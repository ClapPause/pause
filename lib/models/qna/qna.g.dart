// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qna.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QnAImpl _$$QnAImplFromJson(Map<String, dynamic> json) => _$QnAImpl(
      id: json['id'] as int,
      uid: json['uid'] as int,
      topic: json['topic'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      openDate: json['openDate'] as String,
      writeDate: json['writeDate'] as String,
    );

Map<String, dynamic> _$$QnAImplToJson(_$QnAImpl instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'topic': instance.topic,
      'question': instance.question,
      'answer': instance.answer,
      'openDate': instance.openDate,
      'writeDate': instance.writeDate,
    };
