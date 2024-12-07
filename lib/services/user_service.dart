import 'dart:developer';

import 'package:pause/models/user/user.dart';

import 'firebase_service.dart';

class UserService {
  static const String collection = 'user';

  static Future<dynamic> get(String id, String field) async {
    try {
      final snapshot =
          await FirebaseService.fireStore.collection(collection).doc(id).get();
      if (snapshot.exists) {
        return snapshot.get(field);
      }
      return null;
    } catch (e) {
      log('UserService/get error : $e');
      return null;
    }
  }

  static Future<User?> findByUid(String id) async {
    try {
      final snapshot =
          await FirebaseService.fireStore.collection(collection).doc(id).get();
      if (snapshot.exists) {
        return User.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      log('UserService/get error : $e');
      return null;
    }
  }

  static Future<void> update(
      {required String id,
      required String field,
      required String value}) async {
    try {
      await FirebaseService.fireStore
          .collection(collection)
          .doc(id)
          .update({field: value});
    } catch (e) {
      log('UserService/update error : $e');
    }
  }

  static Future<void> delete({required String id}) async {
    try {
      await FirebaseService.fireStore.collection(collection).doc(id).delete();
    } catch (e) {
      log('UserService/delete error : $e');
    }
  }
}
