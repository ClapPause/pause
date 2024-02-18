// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainGoalImpl _$$MainGoalImplFromJson(Map<String, dynamic> json) =>
    _$MainGoalImpl(
      id: json['id'] as int,
      uid: json['uid'] as int,
      selectColor: json['selectColor'] as int,
      backgroundColor: json['backgroundColor'] as int,
      finish: json['finish'] as bool,
      deadline: json['deadline'] as String,
      goal: json['goal'] as String,
    );

Map<String, dynamic> _$$MainGoalImplToJson(_$MainGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'selectColor': instance.selectColor,
      'backgroundColor': instance.backgroundColor,
      'finish': instance.finish,
      'deadline': instance.deadline,
      'goal': instance.goal,
    };
