import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_goal.g.dart';
part 'main_goal.freezed.dart';
@freezed
class MainGoal with _$MainGoal {
  const factory MainGoal({
    required int id,
    required int uid,
    required String goal,
    required String color,
    required bool finish,
    required String deadline,
    required String memo,
  }) = _MainGoal;

  factory MainGoal.fromJson(Map<String, Object?> json) =>
      _$MainGoalFromJson(json);
}
