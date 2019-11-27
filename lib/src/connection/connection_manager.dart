import 'package:realtime_database/src/command/command_base.dart';
import 'package:realtime_database/src/command/connection/connection_response.dart';
import 'package:realtime_database/src/command/response_base.dart';
import 'package:realtime_database/src/command/subscribe/subscribe_command.dart';
import 'package:realtime_database/src/connection/connection_base.dart';
import 'package:realtime_database/src/connection/websocket_connection.dart';
import 'package:realtime_database/src/models/realtime_database_options.dart';
import 'package:rxdart/rxdart.dart';

class ConnectionManager {
  final RealtimeDatabaseOptions options;
  final BehaviorSubject<ConnectionResponse> connectionData$ = BehaviorSubject();

  final List<CommandBase> storedCommands = [];
  final Map<String, CommandReference> commandReferences = {};

  ConnectionBase connection;
  BehaviorSubject<ConnectionState> status$;

  ConnectionManager(this.options) {
    connection = WebsocketConnection(options, "");
    connection.openHandler = () {

    };

    connection.messageHandler = (message) {
      handleResponse(message);
    };

    connection.connectionResponseHandler = (response) {
      connectionData$.add(response);
    };
  }

  Observable<T> sendCommand<T>(CommandBase command, bool keep, bool onlySend) {
    ReplaySubject<T> referenceSubject = ReplaySubject();

    connection.send(command, storeSubscribeCommands(command));

    if (onlySend) {
      referenceSubject.close();
      return Observable.just(null);
    } else {
      commandReferences[command.referenceId] = CommandReference(referenceSubject, keep);
      return createHotCommandObservable(referenceSubject, command);
    }
  }

  Observable<T> createHotCommandObservable<T>(Observable<T> referenceObservable$, CommandBase command) {
    ReplaySubject<T> hotSubject$ = ReplaySubject();
    referenceObservable$.listen((response) {
      hotSubject$.add(response);
    }, onError: (error) {
      hotSubject$.addError(error);
    }, onDone: () {
      this.commandReferences.remove(command.referenceId);
    });

    return hotSubject$;
  }

  bool storeSubscribeCommands(CommandBase command) {
    if (command is SubscribeCommand) {
      storedCommands.add(command);
      return true;
    }

    return false;
  }

  void handleResponse(ResponseBase response) {
    if (response == null) {
      return;
    }

//    if (response.responseType is ResponseBase) {
//
//    }

    if (commandReferences.containsKey(response.referenceId)) {
      CommandReference reference = commandReferences[response.referenceId];

      if (response.error != null) {
        reference.subject$.addError(response.error);
      }

      reference.subject$.add(response);

      if (!reference.keep) {
        reference.subject$.close();
        commandReferences.remove(response.referenceId);
      }
    }

  }
}

class CommandReference<T> {
  final ReplaySubject<T> subject$;
  final bool keep;

  CommandReference(this.subject$, this.keep);
}
