
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_token', token);
  }
  static setUserId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', id);
  }
  static Future<int> getUserId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;

  }
  static Future<String> getToken(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
}