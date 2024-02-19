// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_repeat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskRepeatImpl _$$TaskRepeatImplFromJson(Map<String, dynamic> json) =>
    _$TaskRepeatImpl(
      id: json['id'] as int,
      repetitionId: json['repetitionId'] as int,
      timeStamp: json['timeStamp'] as String,
      finish: json['finish'] as bool,
    );

Map<String, dynamic> _$$TaskRepeatImplToJson(_$TaskRepeatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repetitionId': instance.repetitionId,
      'timeStamp': instance.timeStamp,
      'finish': instance.finish,
    };
