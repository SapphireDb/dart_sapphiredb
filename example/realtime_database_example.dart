import 'package:realtime_database/realtime_database.dart';
import 'package:realtime_database/src/command/subscribe/subscribe_command.dart';
import 'dart:io';

import 'package:realtime_database/src/connection/websocket_connection.dart';
import 'package:realtime_database/src/models/realtime_database_options.dart';

main() {
  var t = WebsocketConnection(options: RealtimeDatabaseOptions(
    serverBaseUrl: "localhost:5000",
    useSsl: false,
    apiKey: "dart_client",
    apiSecret: "pw1234"
  ));

  t.send(SubscribeCommand("entries", "demo", []), false);
}
