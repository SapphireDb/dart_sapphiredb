import 'package:realtime_database/src/command/command_base.dart';
import 'package:realtime_database/src/command/connection/connection_response.dart';
import 'package:realtime_database/src/command/response_base.dart';
import 'package:realtime_database/src/models/realtime_database_options.dart';
import 'package:rxdart/rxdart.dart';

abstract class ConnectionBase {
  ConnectionBase(this.options, this.bearer);

  Observable<ConnectionState> connect();

  Function openHandler;
  Function(ResponseBase) messageHandler;
  Function(ConnectionResponse) connectionResponseHandler;

  BehaviorSubject<ConnectionState> readyState = BehaviorSubject.seeded(ConnectionState.disconnected);

  final RealtimeDatabaseOptions options;
  final String bearer;

  send(CommandBase object, bool storedCommand);
  update();
}

enum ConnectionState {
  disconnected, connecting, connected
}
