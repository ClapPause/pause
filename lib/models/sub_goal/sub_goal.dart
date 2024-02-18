import 'package:freezed_annotation/freezed_annotation.dart';
part 'sub_goal.g.dart';
part 'sub_goal.freezed.dart';
@freezed
class SubGoal with _$SubGoal {
  const factory SubGoal({
    required int id,
    required int uid,
    required int mainGoalId,
    required String goal,
  }) = _SubGoal;

  factory SubGoal.fromJson(Map<String, Object?> json) =>
      _$SubGoalFromJson(json);
}
