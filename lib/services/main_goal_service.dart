import 'package:pause/constants/constants_enum.dart';
import 'package:pause/models/main_goal/main_goal.dart';
import 'package:pause/services/firebase_service.dart';

class MainGoalService {
  static const String _collection = 'main_goal';

  static Future<void> createMainGoal(Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).add(data);
  }

  static Future<MainGoal?> readMainGoal(int id) async {
    final snapshot = await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .get();
    if (snapshot.exists) {
      return MainGoal.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<void> updateMainGoal(int id, Map<String, dynamic> data) async {
    await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .update(data);
  }

  static Future<void> deleteMainGoal(int id) async {
    await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .delete();
  }

  static Future<List<MainGoal>> getMainGoalList(int uid) async {
    return [
      MainGoal(
          id: 1,
          uid: 1,
          color: PauseColor.color1.name,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "변호사 되기",
          memo: ''),
      MainGoal(
          id: 2,
          uid: 1,
          color: PauseColor.color2.name,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "학점 4.3 달성",
          memo: ''),
      MainGoal(
          id: 3,
          uid: 1,
          color: PauseColor.color3.name,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "인성 바르게 하기",
          memo: ''),
      MainGoal(
          id: 4,
          uid: 2,
          color: PauseColor.color4.name,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "의사 되기",
          memo: ''),
      MainGoal(
          id: 5,
          uid: 2,
          color: PauseColor.color5.name,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "운동대회 나가기",
          memo: ''),
    ].where((goal) => goal.uid == uid).toList();
  }
}
