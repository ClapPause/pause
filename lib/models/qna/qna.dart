import 'package:freezed_annotation/freezed_annotation.dart';
part 'qna.g.dart';
part 'qna.freezed.dart';
@freezed
class QnA with _$QnA {
  const factory QnA({
    required int id,
    required int uid,
    required String topic,
    required String question,
    required String answer,
    required String openDate,
    required String writeDate,
  }) = _QnA;

  factory QnA.fromJson(Map<String, Object?> json) =>
      _$QnAFromJson(json);
}