import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/command/response_base.dart';

part 'query_response.g.dart';

@JsonSerializable()
class QueryResponse extends ResponseBase {
  dynamic result;

  QueryResponse();
  factory QueryResponse.fromJson(Map<String, dynamic> json) => _$QueryResponseFromJson(json);
}
