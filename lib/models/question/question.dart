import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final String id;
  final String uid;
  final int number;
  final String question;
  final String? answer;
  final bool answered;
  final String openTimeStamp;
  final String? writeTimeStamp;

  Question({
    required this.id,
    required this.uid,
    required this.number,
    required this.question,
    this.answer,
    required this.answered,
    required this.openTimeStamp,
    this.writeTimeStamp,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
