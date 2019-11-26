// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCommand _$QueryCommandFromJson(Map<String, dynamic> json) {
  return QueryCommand(
    json['collectionName'] as String,
    json['contextName'] as String,
    json['prefilters'] as List,
  )
    ..commandType = json['commandType'] as String
    ..referenceId = json['referenceId'] as String;
}

Map<String, dynamic> _$QueryCommandToJson(QueryCommand instance) =>
    <String, dynamic>{
      'commandType': instance.commandType,
      'referenceId': instance.referenceId,
      'collectionName': instance.collectionName,
      'contextName': instance.contextName,
      'prefilters': instance.prefilters,
    };
