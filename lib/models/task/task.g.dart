// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int,
      subGoalId: json['subGoalId'] as int,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subGoalId': instance.subGoalId,
      'contents': instance.contents,
    };
