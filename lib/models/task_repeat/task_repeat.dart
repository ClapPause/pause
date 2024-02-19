import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_repeat.g.dart';
part 'task_repeat.freezed.dart';
@freezed
class TaskRepeat with _$TaskRepeat {
  const factory TaskRepeat({
    required int id,
    required int repetitionId,
    required String timeStamp,
    required bool finish,
  }) = _TaskRepeat;

  factory TaskRepeat.fromJson(Map<String, Object?> json) =>
      _$TaskRepeatFromJson(json);
}