import 'dart:convert';

import 'package:realtime_database/src/command/connection/connection_response.dart';
import 'package:realtime_database/src/command/query/query_response.dart';
import 'package:realtime_database/src/command/response_base.dart';
import 'package:realtime_database/src/command/subscribe/load_response.dart';
import 'package:realtime_database/src/command/subscribe/unload_response.dart';
import 'package:realtime_database/src/command/subscribe/change_response.dart';

class ResponseTypeMapper {
  static final Map<String, ResponseBase Function(Map<String, dynamic>)> responseTypeMappings = {
    "QueryResponse": (json) => QueryResponse.fromJson(json),
    "ConnectionResponse": (json) => ConnectionResponse.fromJson(json),
    "ChangeResponse": (json) => ChangeResponse.fromJson(json),
    "LoadResponse": (json) => LoadResponse.fromJson(json),
    "UnloadResponse": (json) => UnloadResponse.fromJson(json)

  };

  static ResponseBase mapResponse(String jsonRaw) {
    Map<String, dynamic> json = jsonDecode(jsonRaw);
    ResponseBase Function(Map<String, dynamic>) mapFunction = responseTypeMappings[json["responseType"]];

    if (mapFunction != null) {
      return mapFunction(json);
    } else {
      return null;
    }
  }
}
