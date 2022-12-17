import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
import 'package:tennis/helpers/helpers.dart';
Future homeData(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  print('${prefs.getInt("user_id").toString()}');
  var url;
  url = Uri.parse(ApiUrls.homeUser);
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
    if(status==true){
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
Future bannerHomeData(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
  var url;
  url = Uri.parse(ApiUrls.banner);
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
    if(status==true){
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