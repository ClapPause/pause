import 'package:pause/models/main_goal/main_goal.dart';
import 'package:pause/services/firebase_service.dart';

import '../constants/constants_color.dart';

class MainGoalService {
  static const String _collection = 'main_goal';

  static Future<void> createMainGoal(Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).add(data);
  }

  static Future<MainGoal?> readMainGoal(int id) async {
    final snapshot = await FirebaseService.fireStore.collection(_collection).doc(id.toString()).get();
    if(snapshot.exists){
      return MainGoal.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<void> updateMainGoal(
      int id, Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).doc(id.toString()).update(data);
  }

  static Future<void> deleteMainGoal(int id) async {
    await FirebaseService.fireStore.collection(_collection).doc(id.toString()).delete();
  }

  static Future<List<MainGoal>> getMainGoalList(int uid) async {
    return [
      MainGoal(
          id: 1,
          uid: 1,
          selectColor: kPrimaryColor.value,
          backgroundColor: 0xFFFFECE4,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "변호사 되기"),
      MainGoal(
          id: 2,
          uid: 1,
          selectColor: kTertiaryColor.value,
          backgroundColor: 0xFFEEEDFF,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "학점 4.3 달성"),
      MainGoal(
          id: 3,
          uid: 1,
          selectColor: 0xFFCCBD8A,
          backgroundColor: 0xFFFFFBEE,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "인성 바르게 하기"),
      MainGoal(
          id: 4,
          uid: 2,
          selectColor: kPrimaryColor.value,
          backgroundColor: 0xFFFFECE4,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "의사 되기"),
      MainGoal(
          id: 5,
          uid: 2,
          selectColor: kPrimaryColor.value,
          backgroundColor: 0xFFFFECE4,
          finish: false,
          deadline: DateTime(2025, 1, 1).toString(),
          goal: "운동대회 나가기"),
    ].where((goal) => goal.uid == uid).toList();
  }
}
