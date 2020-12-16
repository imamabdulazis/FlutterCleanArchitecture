

import 'package:clean_architect/features/data/datasources/binding/binding_cachesource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheKey {
  static final String accessToken = "ACCESS_TOKEN";
  static final String refreshToken = "REFRESH_TOKEN";
  static final String cookie = "COOKIE";
  static final String isLogin = "LOGIN";
}

class BindingCache implements BindingCacheSource{
  static SharedPreferences _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  @override
  Future<bool> clearAll() {
    // TODO: implement clearAll
    throw UnimplementedError();
  }

  @override
  Future<bool> clearKey(String key) {
    // TODO: implement clearKey
    throw UnimplementedError();
  }

  @override
  Future<bool> getBool(String key) {
    // TODO: implement getBool
    throw UnimplementedError();
  }

  @override
  Future<double> getDouble(String key) {
    // TODO: implement getDouble
    throw UnimplementedError();
  }

  @override
  Future<int> getInt(String key) {
    // TODO: implement getInt
    throw UnimplementedError();
  }

  @override
  Future<String> getString(String key) {
    // TODO: implement getString
    throw UnimplementedError();
  }

  @override
  List<String> getStringList(String key) {
    // TODO: implement getStringList
    throw UnimplementedError();
  }

  @override
  Future<bool> isKeyExists(String key) {
    // TODO: implement isKeyExists
    throw UnimplementedError();
  }

  @override
  Future<bool> putBool(String key, bool value) {
    // TODO: implement putBool
    throw UnimplementedError();
  }

  @override
  Future<bool> putDouble(String key, double value) {
    // TODO: implement putDouble
    throw UnimplementedError();
  }

  @override
  Future<bool> putInt(String key, int value) {
    // TODO: implement putInt
    throw UnimplementedError();
  }

  @override
  Future<bool> putString(String key, String value) {
    // TODO: implement putString
    throw UnimplementedError();
  }

  @override
  Future<String> putStringList(String key, List<String> value) {
    // TODO: implement putStringList
    throw UnimplementedError();
  }



}