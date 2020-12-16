import 'package:flutter/material.dart';

abstract class BindingCacheSource {
  Future<bool> isKeyExists(String key);

  Future<bool> clearKey(String key);

  Future<bool> clearAll();

  Future<bool> putBool(String key, bool value);

  Future<bool> getBool(String key);

  Future<bool> putDouble(String key, double value);

  Future<double> getDouble(String key);

  Future<bool> putInt(String key, int value);

  Future<int> getInt(String key);

  Future<bool> putString(String key, String value);

  Future<String> getString(String key);

  Future<String> putStringList(String key, List<String> value);

  List<String> getStringList(String key);
}
