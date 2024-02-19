import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.g.dart';
part 'task.freezed.dart';
@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    required int subGoalId,
    required String contents,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) =>
      _$TaskFromJson(json);
}