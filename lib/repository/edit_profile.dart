import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/config/prefConstatnt.dart';
import 'package:tennis/helpers/helpers.dart';
Future getEditProfile(BuildContext context,File fill) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.editProfileImage);
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
  //request.fields["user_id"] = Preferences.userID;

  request.files.add(
      http.MultipartFile(
          'photo',
          File(fill.path).readAsBytes().asStream(),
          File(fill.path).lengthSync(),
          filename: fill.path.split("/").last
      )
  );
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(responseString)['status'];
    if(status == true){
      String resp = json.decode(responseString)['url'];
      print('response is update shop icon ${json.decode(responseString)['url']}');
      return resp;
    } else{
      Helpers.createErrorSnackBar(context, json.decode(responseString)['message'].toString());
      return response;
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
