import 'package:freezed_annotation/freezed_annotation.dart';
part 'life_goal.g.dart';
part 'life_goal.freezed.dart';

@freezed
class LifeGoal with _$LifeGoal {
  const factory LifeGoal({
    required int uid,
    required String goal,
  }) = _LifeGoal;

  factory LifeGoal.fromJson(Map<String, Object?> json) =>
      _$LifeGoalFromJson(json);
}
