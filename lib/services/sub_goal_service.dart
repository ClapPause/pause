import 'package:pause/models/sub_goal/sub_goal.dart';
import 'firebase_service.dart';

class SubGoalService {
  static const String _collection = 'main_goal';

  static Future<void> createSubGoal(Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).add(data);
  }

  static Future<SubGoal?> readSubGoal(int id) async {
    final snapshot = await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .get();
    if (snapshot.exists) {
      return SubGoal.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<void> updateSubGoal(int id, Map<String, dynamic> data) async {
    await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .update(data);
  }

  static Future<void> deleteSubGoal(int id) async {
    await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .delete();
  }

  static Future<List<SubGoal>> getSubGoalList(int uid, int mainGoalId) async {
    return [
      const SubGoal(
        id: 1,
        mainGoalId: 1,
        goal: "로스쿨 진학",
      ),
      const SubGoal(
        id: 2,
        mainGoalId: 1,
        goal: "변호사 면허증",
      ),
      const SubGoal(
        id: 3,
        mainGoalId: 2,
        goal: "중간고사 4.3 달성",
      ),
      const SubGoal(
        id: 4,
        mainGoalId: 3,
        goal: "봉사 시간 150시간 달성하기",
      ),
    ]
        .where((goal) => goal.mainGoalId == mainGoalId)
        .toList();
  }
}
