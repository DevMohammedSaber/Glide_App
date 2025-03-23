import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  static SharedPreferences? _prefs;

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Generic helper methods
  Future<bool> setString(String key, String value) async {
    return _prefs!.setString(key, value);
  }

  String? getString(String key) {
    return _prefs!.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return _prefs!.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  Future<bool> setInt(String key, int value) async {
    return _prefs!.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs!.getInt(key);
  }

  Future<bool> remove(String key) async {
    return _prefs!.remove(key);
  }

  Future<bool> clear() async {
    return _prefs!.clear();
  }
}