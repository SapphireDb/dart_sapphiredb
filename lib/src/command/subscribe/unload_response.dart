import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/command/response_base.dart';

part 'unload_response.g.dart';

@JsonSerializable()
class UnloadResponse extends ResponseBase {
  List<dynamic> primaryValues;

  UnloadResponse();
  factory UnloadResponse.fromJson(Map<String, dynamic> json) => _$UnloadResponseFromJson(json);
}
