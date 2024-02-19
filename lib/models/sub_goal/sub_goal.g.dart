// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubGoalImpl _$$SubGoalImplFromJson(Map<String, dynamic> json) =>
    _$SubGoalImpl(
      id: json['id'] as int,
      mainGoalId: json['mainGoalId'] as int,
      goal: json['goal'] as String,
    );

Map<String, dynamic> _$$SubGoalImplToJson(_$SubGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mainGoalId': instance.mainGoalId,
      'goal': instance.goal,
    };
