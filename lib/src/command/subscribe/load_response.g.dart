// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadResponse _$LoadResponseFromJson(Map<String, dynamic> json) {
  return LoadResponse()
    ..responseType = json['responseType'] as String
    ..referenceId = json['referenceId'] as String
    ..error = json['error']
    ..newObject = json['newObject'];
}

Map<String, dynamic> _$LoadResponseToJson(LoadResponse instance) =>
    <String, dynamic>{
      'responseType': instance.responseType,
      'referenceId': instance.referenceId,
      'error': instance.error,
      'newObject': instance.newObject,
    };
