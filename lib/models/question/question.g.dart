// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      uid: json['uid'] as String,
      number: json['number'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String?,
      answered: json['answered'] as bool,
      openTimeStamp: json['openTimeStamp'] as String,
      writeTimeStamp: json['writeTimeStamp'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'number': instance.number,
      'question': instance.question,
      'answer': instance.answer,
      'answered': instance.answered,
      'openTimeStamp': instance.openTimeStamp,
      'writeTimeStamp': instance.writeTimeStamp,
    };
