import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/repository/edit_profile.dart';

class EditProfileProvider extends ChangeNotifier {
  String gender = "male";
  bool whatsApp = false;
  bool emailApp = false;
  void getGender(String type){
    if("male" == type){
      gender = "male";
      notifyListeners();
    }else if("female" == type){
      gender = "female";
      notifyListeners();
    }else {
      gender = "";
      notifyListeners();
    }
  }
  void getWhatsApp(bool type){
    if(type == false){
      whatsApp = true;
      notifyListeners();
    }else {
      whatsApp = false;
      notifyListeners();
    }
  }
  void getEmailApp(bool type){
    if(type == false){
      emailApp = true;
      notifyListeners();
    }else {
      emailApp = false;
      notifyListeners();
    }
  }
  void createEditProfileDetails(BuildContext context,String name,String dob,String gender,String email) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          setEditProfileDetails(context,name,dob,gender,email).then((response) {
            if (json.decode(response)['status'] == true) {
              SharedPref.setUserName(json.decode(response)['user']['name']);
              SharedPref.setUserDOB(json.decode(response)['user']['dob']);
              SharedPref.setUserGender(json.decode(response)['user']['gender']);
              SharedPref.setUserEmail(json.decode(response)['user']['email']);
              KeyboardUtil.hideKeyboard(context);
              Helpers.createSnackBar(context, json.decode(response)['message'].toString());
              notifyListeners();
              Navigator.pop(context);
            } else if (json.decode(response)['status'] == false) {
              Helpers.createErrorSnackBar(context, json.decode(response)['message'].toString());
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