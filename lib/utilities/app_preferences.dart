import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences({required this.sharedPreferences});

  SharedPreferences sharedPreferences;

  Future<void> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  Future<bool> setInt(String key, int value) {
    return sharedPreferences.setInt(key, value);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  Future<bool> setDouble(String key, double value) {
    return sharedPreferences.setDouble(key, value);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  Future<bool> setBool(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  Future<bool> remove(String key) {
    return sharedPreferences.remove(key);
  }

  T? getObject<T>(String key) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      try {
        return json.decode(jsonString) as T;
      } catch (e) {
        debugPrint("Error decoding object from SharedPreferences: $e");
      }
    }
    return null;
  }

  Future<bool> setOject<T>(String key, T value) {
    try {
      final jsonString = json.encode(value);
      return sharedPreferences.setString(key, jsonString);
    } catch (e) {
      debugPrint("Error encoding object to SharedPreferences: $e");
    }
    return Future.value(false);
  }
}
