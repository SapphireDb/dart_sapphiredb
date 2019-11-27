// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) {
  return QueryResponse()
    ..responseType = json['responseType'] as String
    ..referenceId = json['referenceId'] as String
    ..error = json['error']
    ..result = json['result'];
}

Map<String, dynamic> _$QueryResponseToJson(QueryResponse instance) =>
    <String, dynamic>{
      'responseType': instance.responseType,
      'referenceId': instance.referenceId,
      'error': instance.error,
      'result': instance.result,
    };
