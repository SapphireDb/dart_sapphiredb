import 'dart:async';
import 'dart:convert';

import 'package:realtime_database/src/command/command_base.dart';
import 'package:realtime_database/src/command/connection/connection_response.dart';
import 'package:realtime_database/src/command/response_base.dart';
import 'package:realtime_database/src/helper/response_type_mapper.dart';
import 'package:realtime_database/src/models/realtime_database_options.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

import 'connection_base.dart';

class WebsocketConnection extends ConnectionBase {
  IOWebSocketChannel webSocketChannel;

  WebsocketConnection(RealtimeDatabaseOptions options, String bearer)
      : super(options, bearer);

  Observable<ConnectionState> connect() {
    readyState.take(1).listen((state) {
      if (state == ConnectionState.disconnected) {
        readyState.sink.add(ConnectionState.connecting);

        String connectionString = (options.useSsl ? "wss://" : "ws://") +
            options.serverBaseUrl +
            "/sapphire/socket?";

        if (options.apiSecret.isNotEmpty && options.apiKey.isNotEmpty) {
          connectionString +=
              "key=" + options.apiKey + "&secret=" + options.apiSecret + "&";
        }

        if (bearer.isNotEmpty) {
          connectionString += "bearer=" + bearer;
        }

        webSocketChannel = IOWebSocketChannel.connect(connectionString);

        webSocketChannel.stream.listen((message) {
          ResponseBase response = ResponseTypeMapper.mapResponse(message);

          if (response is ConnectionResponse) {
            connectionResponseHandler(response);
            readyState.add(ConnectionState.connected);
            openHandler();
          } else {
            messageHandler(response);
          }
        });
      }
    });

    return readyState;
  }

  void send(CommandBase command, bool storedCommand) {
    connect()
        .takeWhile((state) => state != ConnectionState.disconnected || !storedCommand)
        .where((state) => state == ConnectionState.connected)
        .take(1)
        .listen((state) {
          webSocketChannel.sink.add(jsonEncode(command.toJson()));
        });
  }

  void update() {
    if (webSocketChannel != null) {
      webSocketChannel.sink.close();
    }

    Timer(Duration(milliseconds: 10), () {
      connect();
    });
  }
}
