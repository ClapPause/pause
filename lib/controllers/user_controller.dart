import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pause/services/local_service.dart';
import 'package:pause/services/user_service.dart';

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

  void refresh() async {
    try {
      if (user == null) return;
      User? newUser = await UserService.findByUid(user!.id);
      if (newUser == null) return;
      user = newUser;
      LocalService.saveUserData(newUser);
      notifyListeners();
    } catch (e) {
      log('UserController - refresh Failed : $e');
    }
  }

  void signOut() {
    log('${user?.id}유저 로그아웃');
    user = null;
    notifyListeners();
  }
}
