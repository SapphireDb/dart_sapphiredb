// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeResponse _$ChangeResponseFromJson(Map<String, dynamic> json) {
  return ChangeResponse()
    ..responseType = json['responseType'] as String
    ..referenceId = json['referenceId'] as String
    ..error = json['error']
    ..state = _$enumDecodeNullable(_$ChangeStateEnumMap, json['state'])
    ..value = json['value'];
}

Map<String, dynamic> _$ChangeResponseToJson(ChangeResponse instance) =>
    <String, dynamic>{
      'responseType': instance.responseType,
      'referenceId': instance.referenceId,
      'error': instance.error,
      'state': _$ChangeStateEnumMap[instance.state],
      'value': instance.value,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ChangeStateEnumMap = {
  ChangeState.Added: 'Added',
  ChangeState.Deleted: 'Deleted',
  ChangeState.Modified: 'Modified',
};
