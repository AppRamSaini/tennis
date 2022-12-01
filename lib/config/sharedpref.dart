
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {

  static setUserId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', id);
  }

  static setStaffId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('staff_id', id);
  }

  static setShopId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('shop_id', id);
  }

  static setBName(String businessname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('business_name', businessname);
  }
  static setShopIcon(String shopicon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('shop_icon', shopicon);
  }
  static setShopCategory(String shopcategory) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('shop_category', shopcategory);
  }
  static setTemplateId(int templateid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('template_id', templateid);
  }
  static setCategoryId(int categoryid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('category_id', categoryid);
  }

  static setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  static setPhoneNumber(String phonenumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone_phone', phonenumber);
  }
  static setDUrl(String dhukanurl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dhukan_url', dhukanurl);
  }

  static setListData(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('search_data', value);
  }

  static Future<int> getUserId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;

  }
  static Future<int> getStaffId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;

  }

  static Future<int> getShopId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;

  }

  static Future<String> getBName(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getShopCategory(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getShopIcon(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<String> getDUrl(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }
  static Future<int> getTemplateId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }
  static Future<int> getCategoryId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<String> getEmail(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";

  }

  static Future<String> getPhoneNumber(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";

  }

  static Future<List<String>?> getListData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("id");

  }
  static removeAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static setDarkLight(bool isSwitch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darklight', isSwitch);
  }

  static Future<bool> getDarkLight(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;

  }
}