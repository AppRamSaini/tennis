
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_token', token);
  }
 /* static setUserId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', id);
  }*/
  static setProfileImage(String profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_profile', profile);
  }
  static setUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', name);
  }
  static setUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', email);
  }
  static setUserGender(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_gender', gender);
  }
  static setUserDOB(String dob) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_dob', dob);
  }
  static setUserPhone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_phone', phone);
  }
/*  static Future<int> getUserId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }*/
  static Future<String> getToken(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getProfileImage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getUserName(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getUserEmail(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getUserGender(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getUserDOB(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getUserPhone(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static removeAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}