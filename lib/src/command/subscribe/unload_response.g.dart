// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnloadResponse _$UnloadResponseFromJson(Map<String, dynamic> json) {
  return UnloadResponse()
    ..responseType = json['responseType'] as String
    ..referenceId = json['referenceId'] as String
    ..error = json['error']
    ..primaryValues = json['primaryValues'] as List;
}

Map<String, dynamic> _$UnloadResponseToJson(UnloadResponse instance) =>
    <String, dynamic>{
      'responseType': instance.responseType,
      'referenceId': instance.referenceId,
      'error': instance.error,
      'primaryValues': instance.primaryValues,
    };
