// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeCommand _$SubscribeCommandFromJson(Map<String, dynamic> json) {
  return SubscribeCommand(
    json['collectionName'] as String,
    json['contextName'] as String,
    json['prefilters'] as List,
  )
    ..commandType = json['commandType'] as String
    ..referenceId = json['referenceId'] as String;
}

Map<String, dynamic> _$SubscribeCommandToJson(SubscribeCommand instance) =>
    <String, dynamic>{
      'commandType': instance.commandType,
      'referenceId': instance.referenceId,
      'collectionName': instance.collectionName,
      'contextName': instance.contextName,
      'prefilters': instance.prefilters,
    };
