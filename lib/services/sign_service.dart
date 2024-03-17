import 'dart:developer';

import 'package:pause/models/user/user.dart';
import 'package:pause/services/data_service.dart';
import 'package:pause/services/firebase_service.dart';

import '../constants/constants_enum.dart';

class SignService {
  static const String collection = 'user';

  // 확인 - 가입된 이메일인지?
  // 소셜 가입
  // 로그인
  static Future<bool> isSignedUser(String email) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(collection)
          .where("email", isEqualTo: email)
          .get();
      if (snapshot.docs.isEmpty) return false;
      return true;
    } catch (error) {
      log('check isSignedUser error : $error');
      return false;
    }
  }

  static Future<User?> socialSignIn(String email) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(collection)
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: "social")
          .get();
      if (snapshot.docs.isEmpty) return null;
      return User.fromJson(snapshot.docs.first.data());
    } catch (error) {
      log('Error socialSignIn : $error');
      return null;
    }
  }

  static Future<User?> localSignIn(String email, String password) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(collection)
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password)
          .get();
      if (snapshot.docs.isEmpty) return null;
      return User.fromJson(snapshot.docs.first.data());
    } catch (error) {
      log('Error localSignIn : $error');
      return null;
    }
  }

  static Future<User?> signUp(String email,String password,String name)async{
    try {
      String? id = await DataService.getId(name: collection);
      if(id==null) return null;
      if(await isSignedUser(email)) return null;
      User user = User(id: id, email: email, name: name, password: password);
      await FirebaseService.fireStore
          .collection(collection).doc(id).set(user.toJson());
      return user;
    } catch (error) {
      log('Error signUp : $error');
       return null;
    }
  }
}
