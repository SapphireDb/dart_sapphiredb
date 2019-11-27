import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/command/response_base.dart';

part 'load_response.g.dart';

@JsonSerializable()
class LoadResponse extends ResponseBase {
  dynamic newObject;

  LoadResponse();
  factory LoadResponse.fromJson(Map<String, dynamic> json) => _$LoadResponseFromJson(json);
}
