import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/user.dart';

class LocalService {
  static final LocalService _instance = LocalService();
  factory LocalService() => _instance;

  static SharedPreferences? _sharedPreferences;

  static const String _userInfoKey = 'userInfo';

  static Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) return;
    await _sharedPreferences!.clear();
  }

  static Future<bool> saveUserData(User user) async {
    try {
      if (_sharedPreferences == null) {
        await _setSharedPreferences();
      }

      Map<String, dynamic> userDataMap = user.toJson();
      DateTime nowDate = DateTime.now();
      userDataMap['date'] = nowDate.toString();

      String userJsonString = jsonEncode(userDataMap);

      await _sharedPreferences?.setString(_userInfoKey, userJsonString);
      return true;
    } catch (e) {
      log('LocalController - saveUserData Failed : $e');
      return false;
    }
  }

  static Future<User?> getUserInfo() async {
    try {
      if (_sharedPreferences == null) {
        await _setSharedPreferences();
      }
      String? jsonString = _sharedPreferences?.getString(_userInfoKey);
      if (jsonString == null) return null;

      Map<String, dynamic> userInfo = jsonDecode(jsonString);
      String dateString = userInfo['date'];
      DateTime date = DateTime.parse(dateString);
      DateTime nowDate = DateTime.now();

      int dayDifference = nowDate.difference(date).inDays;

      if (dayDifference > 7) return null;

      return User.fromJson(userInfo);
    } catch (e) {
      log('LocalController - getUserInfo Failed : $e');
      return null;
    }
  }

}