// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepetitionImpl _$$RepetitionImplFromJson(Map<String, dynamic> json) =>
    _$RepetitionImpl(
      id: json['id'] as int,
      taskId: json['taskId'] as int,
      repeatType: json['repeatType'] as String,
      repeatValue: json['repeatValue'] as int,
    );

Map<String, dynamic> _$$RepetitionImplToJson(_$RepetitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'repeatType': instance.repeatType,
      'repeatValue': instance.repeatValue,
    };
