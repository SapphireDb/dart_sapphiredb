import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/command/response_base.dart';

part 'change_response.g.dart';

@JsonSerializable()
class ChangeResponse extends ResponseBase {
  ChangeState state;
  dynamic value;

  ChangeResponse();
  factory ChangeResponse.fromJson(Map<String, dynamic> json) => _$ChangeResponseFromJson(json);
}

enum ChangeState {
  Added, Deleted, Modified
}
