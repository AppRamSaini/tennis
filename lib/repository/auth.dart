import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/config/prefConstatnt.dart';
import 'package:tennis/helpers/helpers.dart';
Future authLogin(BuildContext context,String phone) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.loginRequest);
  var map = Map<String, dynamic>();
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['phone'] = phone;
  http.Response response = await http.post(
    url,
    body: map,
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
  else {
    Helpers.hideLoader(loader);
  }
}
Future authOtpVerify(BuildContext context,String phone,String otp) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.otpVerify);
  var map = Map<String, dynamic>();
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['phone'] = phone;
  map['otp'] = otp;
  http.Response response = await http.post(
    url,
    body: map,
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
  else {
    Helpers.hideLoader(loader);
  }
}