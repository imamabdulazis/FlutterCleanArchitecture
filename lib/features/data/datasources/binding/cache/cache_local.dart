import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static final String accessToken = "ACCESS_TOKEN";
  static final String refreshToken = "REFRESH_TOKEN";
  static final String cookie = "COOKIE";
  static final String isLogin = "LOGIN";
  static final String midtrans = "MIDTRANS";
}

class CacheLocal {
  static SharedPreferences _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  static void remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }
}
