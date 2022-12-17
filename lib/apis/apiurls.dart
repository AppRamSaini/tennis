// It is used for ROUTE navigation
import 'package:shared_preferences/shared_preferences.dart';

class ApiUrls {
  static const String apiBaseUrl = 'https://tennis-api.laraveldevelopmentcompany.com/api/';
  static const String apiWPBaseUrl = 'https://phpdemo.futureprofilez.com/ankesh/jdt/blogs/wp-json/';
  static const String loginRequest = "${apiBaseUrl}login-request";
  static const String otpVerify = "${apiBaseUrl}otp-verify";
  static const String registerVerify = "${apiBaseUrl}register-verify";
  static const String register = "${apiBaseUrl}register";
  static const String homeUser = "${apiBaseUrl}user";
  static const String requestLeaguePermission = "${apiBaseUrl}request-league-permission";
  static const String leaguePermissionStatus = "${apiBaseUrl}leagues/permission-status";
  static const String logout = "${apiBaseUrl}logout";
  static const String editProfileImage = "${apiBaseUrl}edit-profile-image";
  static const String editProfileDetails = "${apiBaseUrl}edit-profile-details";
  static const String createLeague = "${apiBaseUrl}leagues/create-league";
  static const String createList = "${apiBaseUrl}leagues/list";
  ////////////////Wordpress API /////////////////////////////////////
  static const String category = "${apiWPBaseUrl}post/category";
  static const String banner = "${apiWPBaseUrl}home/banner";
  static const String catNews = "${apiWPBaseUrl}posts/news";

}


