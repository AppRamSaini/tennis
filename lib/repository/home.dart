import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/apis/apiurls.dart';
Future homeData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('${prefs.getString("user_token")}');
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
  else {

  }
}