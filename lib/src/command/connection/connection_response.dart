import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/command/response_base.dart';

part 'connection_response.g.dart';

@JsonSerializable()
class ConnectionResponse extends ResponseBase {
  String connectionId;
  bool bearerValid;

  ConnectionResponse();
  factory ConnectionResponse.fromJson(Map<String, dynamic> json) => _$ConnectionResponseFromJson(json);
}
