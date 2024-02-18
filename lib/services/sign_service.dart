import 'dart:developer';

import 'package:pause/services/firebase_service.dart';

class SignService {

  static const String _collection = 'user';

  Future<void> localSignIn(String email, String password) async {
    try {
      await FirebaseService.fireStore.collection(_collection).add({
        'email': email,
        'password': password,
      });

    } catch (error) {
      log('Error saving user data: $error');

    }
  }
}
