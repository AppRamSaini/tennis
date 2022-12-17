import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/repository/edit_profile.dart';

class EditProfileProvider extends ChangeNotifier {
  String gender = "Male";
  bool whatsApp = false;
  bool emailApp = false;
  void getGender(String type){
    if("Male" == type){
      gender = "Male";
      notifyListeners();
    }else if("Female" == type){
      gender = "Female";
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
  void createEditProfileDetails(BuildContext context,String name,String dob,String gender) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          setEditProfileDetails(context,name,dob,gender).then((response) {
            if (json.decode(response)['status'] == true) {
              SharedPref.setUserName(json.decode(response)['user']['name']);
              SharedPref.setUserDOB(json.decode(response)['user']['dob']);
              SharedPref.setUserGender(json.decode(response)['user']['gender']);
              KeyboardUtil.hideKeyboard(context);
              notifyListeners();
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