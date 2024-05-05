import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pause/services/local_service.dart';

import '../models/user/user.dart';

class UserController extends ChangeNotifier {
  User? user;

  void signIn(User newUser) {
    try {
      user = newUser;
      LocalService.saveUserData(newUser);
      notifyListeners();
      log('${user?.id}유저 로그인');
    } catch (e) {
      log('UserController - setUser Failed : $e');
    }
  }

  void signOut()  {
    log('${user?.id}유저 로그아웃');
    user = null;
    notifyListeners();
  }
}