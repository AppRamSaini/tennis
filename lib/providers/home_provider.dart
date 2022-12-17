import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/home.dart';

class HomeProvider extends ChangeNotifier {

  void getHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          homeData(context).then((response) {
            if (json.decode(response.body)['status'] == true) {
              SharedPref.setUserId(json.decode(response.body)['data']['id']);
              SharedPref.setProfileImage(json.decode(response.body)['data']['profile_photo_url'].toString());
              SharedPref.setUserName(json.decode(response.body)['data']['name'].toString());
              SharedPref.setUserEmail(json.decode(response.body)['data']['email'].toString());
              SharedPref.setUserDOB(json.decode(response.body)['data']['dob'].toString());
              SharedPref.setUserGender(json.decode(response.body)['data']['gender'].toString());
              SharedPref.setUserPhone(json.decode(response.body)['data']['phone'].toString());

            } else if (json.decode(response.body)['status'] == false) {
              Helpers.createErrorSnackBar(context, json.decode(response.body)['message'].toString());
            }
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
}