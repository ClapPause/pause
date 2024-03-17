import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/user/user.dart';

class UserController extends ChangeNotifier {
  User? user;

  void signIn(User newUser) {
    try {
      user = newUser;
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