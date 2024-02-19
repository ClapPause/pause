import 'package:freezed_annotation/freezed_annotation.dart';
part 'repetition.g.dart';
part 'repetition.freezed.dart';
@freezed
class Repetition with _$Repetition {
  const factory Repetition({
    required int id,
    required int taskId,
    required String repeatType,
    required int repeatValue,
  }) = _Repetition;

  factory Repetition.fromJson(Map<String, Object?> json) =>
      _$RepetitionFromJson(json);
}
