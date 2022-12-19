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
  url = Uri.parse(ApiUrls.authInit);
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
Future saveUserDetails(BuildContext context,String user_name,String email,String gender,String dob) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.saveData);
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
  request.fields["name"] = user_name;
  request.fields["email"] = email;
  request.fields["gender"] = gender;
  request.fields["dob"] = dob;

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
  print(responseString);
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
Future authRegistor(BuildContext context,String user_name,String email,String gender,String dob) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.saveData);
  var headers = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };
  var map = <String, dynamic>{};
  map['name'] = user_name;
  map['email'] = email;
  map['gender'] = gender;
  map['dob'] = dob;
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
    if(status == true){
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

Future authOtpVerify(BuildContext context,String phone,String otp) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.authVerify);
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