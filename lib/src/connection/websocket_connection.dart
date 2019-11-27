import 'dart:async';
import 'dart:convert';

import 'package:realtime_database/src/command/command_base.dart';
import 'package:realtime_database/src/models/realtime_database_options.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketConnection {
  final RealtimeDatabaseOptions options;

  IOWebSocketChannel webSocketChannel;
  BehaviorSubject<String> readyState = BehaviorSubject.seeded("disconnected");

  WebsocketConnection({this.options});

  Observable<String> connect() {
    readyState.take(1).listen((state) {
      if (state == "disconnected") {
        readyState.sink.add("connecting");

        String connectionString = (options.useSsl ? "wss://" : "ws://") +
            options.serverBaseUrl +
            "/realtimedatabase/socket?";

        if (options.apiSecret.isNotEmpty && options.apiKey.isNotEmpty) {
          connectionString +=
              "key=" + options.apiKey + "&secret=" + options.apiSecret + "&";
        }

        webSocketChannel = IOWebSocketChannel.connect(connectionString);

        webSocketChannel.stream.listen((message) {
          Map<String, dynamic> json = jsonDecode(message);

          readyState.sink.add("connected");
          print(message);
        });
      }
    });

    return readyState;
  }

  void send(CommandBase command, bool storedCommand) {
    connect()
        .takeWhile((state) => state != "disconnected" || !storedCommand)
        .where((state) => state == "connected")
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
