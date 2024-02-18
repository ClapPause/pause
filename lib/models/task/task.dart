import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.g.dart';
part 'task.freezed.dart';
@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    required int uid,
    required int mainGoalId,
    required int subGoalId,
    required String goal,
    required String repeatType,
    required String repeatValue,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) =>
      _$TaskFromJson(json);
}