import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/config/prefConstatnt.dart';
import 'package:tennis/helpers/helpers.dart';
Future authLogin(BuildContext context,String phone) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.loginRequest);
  var headers = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };
  var map = <String, dynamic>{};
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['phone'] = phone;
  http.Response response = await http.post(
    url,
    headers: headers,
    body: json.encode(map),
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status==true){
      return response;
    }
    else{
      return response;
    }
  } else if(response.statusCode == 403){
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
Future authRegistor(BuildContext context,String user_name,String email,String phone) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.register);
  var headers = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };
  var map = <String, dynamic>{};
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['name'] = user_name;
  map['email'] = email;
  map['phone'] = phone;
  http.Response response = await http.post(
    url,
    headers: headers,
    body: json.encode(map),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status==true){
      return response;
    }
    else{
      return response;
    }
  } else if(response.statusCode == 403){
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
Future authOtpVerify(BuildContext context,String phone,String otp,String type) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  if(type == "login"){
    url = Uri.parse(ApiUrls.otpVerify);
  }else {
    url = Uri.parse(ApiUrls.registerVerify);
  }
  var headers = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };
  var map = <String, dynamic>{};
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['phone'] = phone;
  map['otp'] = otp;
  http.Response response = await http.post(
    url,
    headers: headers,
    body: json.encode(map),
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status==true){
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
Future sendLogout(BuildContext context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.logout);
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