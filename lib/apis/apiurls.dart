// It is used for ROUTE navigation
import 'package:shared_preferences/shared_preferences.dart';

class ApiUrls {
  static const String apiBaseUrl = 'https://tennis-api.laraveldevelopmentcompany.com/api/';
  static const String apiWPBaseUrl = 'https://phpdemo.futureprofilez.com/ankesh/jdt/blogs/wp-json/';
  static const String loginRequest = "${apiBaseUrl}login-request";
  static const String authInit = "${apiBaseUrl}common/auth-init";
  static const String authVerify = "${apiBaseUrl}common/auth-verify";
  static const String saveData = "${apiBaseUrl}common/save-data";
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
  static const String leagueUpdateLeague = "${apiBaseUrl}leagues/update-league/";
  static const String leaguesList = "${apiBaseUrl}leagues/list";
  static const String inviteSearchPlayer = "${apiBaseUrl}leagues/invite-search-player";
  static const String leaguesInvitePlayer = "${apiBaseUrl}leagues/invite-player";
  static const String leagueRequest = "${apiBaseUrl}leagues/league-request";
  static const String pendingRequest = "${apiBaseUrl}leagues/pending-request";
  static const String userLeagueRequest = "${apiBaseUrl}leagues/league-request/";
  static const String leaguePlayer = "${apiBaseUrl}leagues/league-player";
  static const String leaguesChallenge = "${apiBaseUrl}leagues/leagues-challange";
  static const String challengeWithdraw = "${apiBaseUrl}leagues/challenge-withdraw";
  static const String challengeList = "${apiBaseUrl}leagues/challenge-list";
  static const String challengeScore = "${apiBaseUrl}leagues/challenge-score";
  static const String leaguesMyResult = "${apiBaseUrl}leagues/my-result";
  static const String leaguesAllMatches = "${apiBaseUrl}leagues/all-matches";
  static const String leaguesAllMatcheslist = "${apiBaseUrl}leagues/match-league-list";
  static const String leaguesChallengeRequest = "${apiBaseUrl}leagues/challenge-request/";
  static const String leaguesReportScore = "${apiBaseUrl}leagues/report-score";
  static const String leaguesScorePendingReports = "${apiBaseUrl}leagues/score-pending-reports";
  static const String leaguesLeave = "${apiBaseUrl}leagues/leave";
  static const String leaguesDelete = "${apiBaseUrl}leagues/delete/";
  static const String scorePendingReportsCount = "${apiBaseUrl}leagues/score-pending-reports/count";
  static const String pendingCounts = "${apiBaseUrl}pending-counts";
  static const String leaguesScoreReportUpdate = "${apiBaseUrl}leagues/score-report-update/";
  ////////////////Wordpress API /////////////////////////////////////
  static const String category = "${apiWPBaseUrl}post/category";
  static const String banner = "${apiWPBaseUrl}home/banner";
  static const String catNews = "${apiWPBaseUrl}posts/news";
  ////////////////url/////////////////////////
  static const String privacyPolicy = "https://phpdemo.futureprofilez.com/ankesh/jdt/blogs/privacy-policy/";
  static const String termsConditions = "https://phpdemo.futureprofilez.com/ankesh/jdt/blogs/terms-and-conditions/";

}


