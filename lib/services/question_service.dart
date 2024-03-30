import 'dart:developer';

import 'package:pause/models/question/question.dart';
import 'package:pause/services/firebase_service.dart';
import 'package:pause/services/user_service.dart';

import 'data_service.dart';

class QuestionService {
  static const String _collection = 'question';

  static Future<bool> makeQuestion({
    required String uid,
  }) async {
    try {
      String? id = await DataService.getId(name: _collection);
      int number = (await getQuestionByUid(uid:uid)).length+1;
      String? question = await _getQuestionByNumber(uid: uid, number: number);
      if (id == null || question == null) return false;

      DateTime nowDate = DateTime.now();
      DateTime openDate = DateTime(nowDate.year, nowDate.month, nowDate.day);

      Question questionObject = Question(
          id: id,
          uid: uid,
          number: number,
          question: question,
          answered: false,
          openTimeStamp: openDate.toString());

      await FirebaseService.fireStore
          .collection(_collection)
          .doc(id)
          .set(questionObject.toJson());

      return true;
    } catch (e) {
      log('QuestionService/makeQuestion error : $e');
      return false;
    }
  }

  static Future<void> answerQuestion({
    required String questionId,
    required String answer,
  }) async {
    try {
      DateTime writeDate = DateTime.now();

      await FirebaseService.fireStore
          .collection(_collection)
          .doc(questionId)
          .update({
        'answer': answer,
        'answered': true,
        'writeTimeStamp': writeDate.toString(),
      });
    } catch (e) {
      log('QuestionService/answerQuestion error : $e');
    }
  }

  static Future<List<Question>> getQuestionByUid({required String uid}) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(_collection)
          .where('uid', isEqualTo: uid)
          .get();
      if (snapshot.docs.isEmpty) return [];
      return snapshot.docs
          .map((document) => Question.fromJson(document.data()))
          .toList();
    } catch (e) {
      log('QuestionService/getQuestionByUid error : $e');
      return [];
    }
  }

  static Future<Question?> getLastQuestionByUid({required String uid}) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(_collection)
          .where('uid', isEqualTo: uid)
          .orderBy('openTimeStamp', descending: true)
          .get();
      if (snapshot.docs.isEmpty) return null;
      return Question.fromJson(snapshot.docs.first.data());
    } catch (e) {
      log('QuestionService/getLastQuestionByUid error : $e');
      return null;
    }
  }

  static  Future<String?> _getQuestionByNumber(
      {required String uid, required int number}) async {
    try {
      String userName = await UserService.get(uid, 'name');
      return "$userName 님의 이름은 무엇이고,\n누가, 어떤 의미로 지어주었나요?$number";
    } catch (e) {
      log('QuestionService/getQuestionByNumber error : $e');
      return null;
    }
  }
}
