import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/helpers/helpers.dart';

Future getLeaguesPlayerList(BuildContext context,String league_uuid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse("${ApiUrls.leaguePlayer}/$league_uuid");
  print(url);
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
Future sendLeaguesPlayerChallenge(BuildContext context,String leagues_uuid,String challenge_to) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse(ApiUrls.leaguesChallenge);
  var headers = {
    'authorization': 'Bearer ${prefs.getString("user_token")}',
    "Accept": "application/json"
  };
  var map = <String, dynamic>{};
  map['leagues_uuid'] = leagues_uuid;
  map['challenge_to'] = challenge_to;
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