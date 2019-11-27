import 'package:realtime_database/realtime_database.dart';
import 'package:realtime_database/src/command/query/query_command.dart';
import 'package:realtime_database/src/command/query/query_response.dart';
import 'package:realtime_database/src/command/subscribe/subscribe_command.dart';
import 'package:realtime_database/src/connection/connection_manager.dart';
import 'dart:io';

import 'package:realtime_database/src/connection/websocket_connection.dart';
import 'package:realtime_database/src/models/realtime_database_options.dart';

main() {
  var t = ConnectionManager(RealtimeDatabaseOptions(
    serverBaseUrl: "localhost:5000",
    useSsl: false,
    apiKey: "dart_client",
    apiSecret: "pw1234"
  ));

  t.sendCommand<QueryResponse>(SubscribeCommand("entries", "demo", []), false, false)
    .listen((r) => print(r.result));
}
