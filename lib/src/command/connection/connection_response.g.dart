// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionResponse _$ConnectionResponseFromJson(Map<String, dynamic> json) {
  return ConnectionResponse()
    ..responseType = json['responseType'] as String
    ..referenceId = json['referenceId'] as String
    ..error = json['error']
    ..connectionId = json['connectionId'] as String
    ..bearerValid = json['bearerValid'] as bool;
}

Map<String, dynamic> _$ConnectionResponseToJson(ConnectionResponse instance) =>
    <String, dynamic>{
      'responseType': instance.responseType,
      'referenceId': instance.referenceId,
      'error': instance.error,
      'connectionId': instance.connectionId,
      'bearerValid': instance.bearerValid,
    };
