// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainGoalImpl _$$MainGoalImplFromJson(Map<String, dynamic> json) =>
    _$MainGoalImpl(
      id: json['id'] as int,
      uid: json['uid'] as int,
      goal: json['goal'] as String,
      color: json['color'] as String,
      finish: json['finish'] as bool,
      deadline: json['deadline'] as String,
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$$MainGoalImplToJson(_$MainGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'goal': instance.goal,
      'color': instance.color,
      'finish': instance.finish,
      'deadline': instance.deadline,
      'memo': instance.memo,
    };
