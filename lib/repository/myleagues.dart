import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/config/prefConstatnt.dart';
import 'package:tennis/helpers/helpers.dart';
Future getLeaguesPermissionStatus(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse(ApiUrls.leaguePermissionStatus);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  http.Response response = await http.get(
      url, headers: headers
  );
  if (response.statusCode == 200) {
    bool status;
    status=json.decode(response.body)['status'];
    if(status == true){
      return response;
    }
    else{
      return response;
    }

  }
  else if(response.statusCode == 403){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 422){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 500){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else {
    print(response.statusCode);
  }
}
Future sendRequestLeaguePermission(BuildContext context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.requestLeaguePermission);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  var map = <String, dynamic>{};
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['user_id'] = prefs.getInt("user_id").toString();
  http.Response response = await http.post(
      url,
      headers: headers,
      body: json.encode(map),
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status == true){
      return response;
    }
    else{
      return response;
    }

  }
  else if(response.statusCode == 403){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 422){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 500){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else {
    Helpers.hideLoader(loader);
    print(response.statusCode);
  }
}
Future setCreateLeague(BuildContext context,String league_name,String type,String desc,int no_sets) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.createLeague);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields

  request.headers["authorization"] = 'Bearer ${prefs.getString("user_token")}';
  request.headers["Accept"] = "application/json";
  //request.fields["device_id"] = Preferences.deviceId;
  // request.fields["device_token"] = Preferences.deviceToken;
  //request.fields["device_type"] = Preferences.deviceType;
  request.fields["name"] = league_name;
  request.fields["sets"] = no_sets.toString();
  request.fields["descriptions"] = desc;
  request.fields["type"] = type;

/*  request.files.add(
      http.MultipartFile(
          'photo',
          File(fill.path).readAsBytes().asStream(),
          File(fill.path).lengthSync(),
          filename: fill.path.split("/").last
      )
  );*/
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(responseString)['status'];
    if(status == true){
      return responseString;
    } else{
      Helpers.createErrorSnackBar(context, json.decode(responseString)['message'].toString());
      return responseString;
    }
  }
  else if(response.statusCode == 403){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else if(response.statusCode == 422){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else if(response.statusCode == 500){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else {
    Helpers.hideLoader(loader);
    print(response.statusCode);
  }
}
Future getPlayerList(BuildContext context,String leagus_uuid,String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.inviteSearchPlayer);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields

  request.headers["authorization"] = 'Bearer ${prefs.getString("user_token")}';
  request.headers["Accept"] = "application/json";
  //request.fields["device_id"] = Preferences.deviceId;
  // request.fields["device_token"] = Preferences.deviceToken;
  //request.fields["device_type"] = Preferences.deviceType;
  request.fields["league_uuid"] = leagus_uuid;
  request.fields["phone"] = phone;

/*  request.files.add(
      http.MultipartFile(
          'photo',
          File(fill.path).readAsBytes().asStream(),
          File(fill.path).lengthSync(),
          filename: fill.path.split("/").last
      )
  );*/
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  if (response.statusCode == 200) {
    bool status;
    status=json.decode(responseString)['status'];
    if(status == true){
      return responseString;
    } else{
      Helpers.createErrorSnackBar(context, json.decode(responseString)['message'].toString());
      return responseString;
    }
  }
  else if(response.statusCode == 403){
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else if(response.statusCode == 422){
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else if(response.statusCode == 500){
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else {
    print(response.statusCode);
  }
}

Future getLeaguesList(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse(ApiUrls.leaguesList);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  http.Response response = await http.get(
      url, headers: headers
  );
  if (response.statusCode == 200) {
    bool status;
    status=json.decode(response.body)['status'];
    if(status == true){
      return response;
    }
    else{
      return response;
    }

  }
  else if(response.statusCode == 403){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 422){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 500){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else {
    print(response.statusCode);
  }
}
Future getPlayerPendingRequest(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse(ApiUrls.pendingRequest);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  http.Response response = await http.get(
      url, headers: headers
  );
  if (response.statusCode == 200) {
    bool status;
    status=json.decode(response.body)['status'];
    if(status == true){
      return response;
    }
    else{
      return response;
    }

  }
  else if(response.statusCode == 403){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 422){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else if(response.statusCode == 500){
    Helpers.messagetoastfalse(context,json.decode(response.body)['message']);
  }else {
    print(response.statusCode);
  }
}
Future sendPlayerLeagueRequest(BuildContext context,String uuid,String status) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.userLeagueRequest+status);
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields

  request.headers["authorization"] = 'Bearer ${prefs.getString("user_token")}';
  request.headers["Accept"] = "application/json";
  request.fields["uuid"] = uuid;
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(responseString)['status'];
    if(status == true){
      return responseString;
    } else{
      Helpers.createErrorSnackBar(context, json.decode(responseString)['message'].toString());
      return responseString;
    }
  }
  else if(response.statusCode == 403){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else if(response.statusCode == 422){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else if(response.statusCode == 500){
    Helpers.hideLoader(loader);
    Helpers.messagetoastfalse(context,json.decode(responseString)['message'].toString());
  }else {
    Helpers.hideLoader(loader);
    print(response.statusCode);
  }
}