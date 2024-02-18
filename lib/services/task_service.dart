import '../models/task/task.dart';
import 'firebase_service.dart';

class TaskService {
  static const String _collection = 'task';

  static Future<void> createTask(Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).add(data);
  }

  static Future<Task?> readTask(int id) async {
    final snapshot = await FirebaseService.fireStore.collection(_collection).doc(id.toString()).get();
    if(snapshot.exists){
      return Task.fromJson(snapshot.data()!);
    }
    return null; // Explicit cast
  }

  static Future<void> updateTask(int id, Map<String, dynamic> data) async {
    await FirebaseService.fireStore.collection(_collection).doc(id.toString()).update(data);
  }

  static Future<void> deleteTask(int id) async {
    await FirebaseService.fireStore.collection(_collection).doc(id.toString()).delete();
  }

  static Future<List<Task>> getTaskList(int uid, int mainGoalId,
      int subGoalId) async {
    return [
      const Task(
          id: 1,
          uid: 1,
          mainGoalId: 1,
          subGoalId: 1,
          goal: "법률 기사 3개 읽기",
          repeatType: '',
          repeatValue: ''),
      const Task(
          id: 2,
          uid: 1,
          mainGoalId: 1,
          subGoalId: 1,
          goal: "변호사 면허증 1시간 공부하기",
          repeatType: '',
          repeatValue: ''),
      const Task(
          id: 3,
          uid: 1,
          mainGoalId: 1,
          subGoalId: 1,
          goal: "법전 읽기",
          repeatType: '',
          repeatValue: ''),
    ]
        .where((goal) => goal.mainGoalId == mainGoalId)
        .where((goal) => goal.subGoalId == subGoalId)
        .where((goal) => goal.uid == uid)
        .toList();
  }
}
