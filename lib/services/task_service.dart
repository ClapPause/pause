import '../models/task/task.dart';
import 'firebase_service.dart';

class TaskService {
  static const String _collection = 'task';

  static Future<void> createTask(Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).add(data);
  }

  static Future<Task?> readTask(int id) async {
    final snapshot = await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .get();
    if (snapshot.exists) {
      return Task.fromJson(snapshot.data()!);
    }
    return null; // Explicit cast
  }

  static Future<void> updateTask(int id, Map<String, dynamic> data) async {
    await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .update(data);
  }

  static Future<void> deleteTask(int id) async {
    await FirebaseService.fireStore
        .collection(_collection)
        .doc(id.toString())
        .delete();
  }

  static Future<List<Task>> getTaskList(
      int uid, int mainGoalId, int subGoalId) async {
    return [
      const Task(
        id: 1,
        subGoalId: 1,
        contents: "법률 기사 3개 읽기",
      ),
      const Task(
        id: 2,
        subGoalId: 1,
        contents: "변호사 면허증 1시간 공부하기",
      ),
      const Task(
        id: 3,
        subGoalId: 1,
        contents: "법전 읽기",
      ),
    ].where((goal) => goal.subGoalId == subGoalId).toList();
  }
}
