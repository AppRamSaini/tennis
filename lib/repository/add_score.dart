import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/helpers/appconfig.dart';
import 'package:tennis/helpers/helpers.dart';

Future addChallengeScore(BuildContext context,String winner_uuid,String status,String score) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse(ApiUrls.challengeScore);
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields
  request.headers["authorization"] = 'Bearer ${prefs.getString("user_token")}';
  request.headers["Accept"] = "application/json";
  request.fields["challenge_uuid"] = AppConfig.ChallengeUuid;
  request.fields["winner_uuid"] = winner_uuid;
  request.fields["sets"] = AppConfig.Sets.toString();
  request.fields["status"] = status;
  request.fields["score"] = score;
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