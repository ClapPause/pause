import 'package:shared_preferences/shared_preferences.dart';

class LocalController {
  static final LocalController _instance = LocalController();
  factory LocalController() => _instance;

  static SharedPreferences? _sharedPreferences;

  static Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) return;
    await _sharedPreferences!.clear();
  }

}