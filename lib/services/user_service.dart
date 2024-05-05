

import 'dart:developer';

import 'firebase_service.dart';

class UserService {
  static const String collection = 'user';

  static Future<dynamic> get(
      String id, String field) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(collection)
          .doc(id)
          .get();
      if(snapshot.exists){
        return snapshot.get(field);
      }
      return null;
    } catch (e) {
      log('UserService/get error : $e');
      return null;
    }
  }
}
