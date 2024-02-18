// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int,
      uid: json['uid'] as int,
      mainGoalId: json['mainGoalId'] as int,
      subGoalId: json['subGoalId'] as int,
      goal: json['goal'] as String,
      repeatType: json['repeatType'] as String,
      repeatValue: json['repeatValue'] as String,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'mainGoalId': instance.mainGoalId,
      'subGoalId': instance.subGoalId,
      'goal': instance.goal,
      'repeatType': instance.repeatType,
      'repeatValue': instance.repeatValue,
    };
