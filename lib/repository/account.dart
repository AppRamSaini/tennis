import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/config/prefConstatnt.dart';
import 'package:tennis/helpers/helpers.dart';
Future getUpadeBusineesIcon(BuildContext context,File fill) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.loginUrl);
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields

  //request.headers["Authorization"]=Helpers.authId;

  request.fields["device_id"] = Preferences.deviceId;
  request.fields["device_token"] = Preferences.deviceToken;
  request.fields["device_type"] = Preferences.deviceType;
  request.fields["user_id"] = Preferences.userID;

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
    int status;
    status=json.decode(responseString)['status'];

    if(status==200){
      String resp = json.decode(responseString)['data'];
      print('response is update shop icon ${json.decode(responseString)['data']}');
      return resp;
    } else{
      Helpers.createErrorSnackBar(context, json.decode(responseString)['message'].toString());
      return response;
    }

  }
  else {
    Helpers.hideLoader(loader);
  }
}
Future getUpdateBussinessShopIconData(BuildContext context,String user_id,String template_id,String category_id,String shop_icon) async {
 OverlayEntry loader = Helpers.overlayLoader(context);
 Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.loginUrl);
  var map = new Map<String, dynamic>();
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['template_id'] = template_id;
  map['user_id'] = user_id;
  map['category_id'] = category_id;
  http.Response response = await http.post(
    url,
    body: map,
  );
  if (response.statusCode == 200) {
   Helpers.hideLoader(loader);
    int status;
    status=json.decode(response.body)['status'];
    if(status==200){
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
