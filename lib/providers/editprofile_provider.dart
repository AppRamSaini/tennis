import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/edit_profile.dart';

class EditProfileProvider extends ChangeNotifier {
  String gender = "male";
  bool whatsApp = false;
  bool emailApp = false;
  void getGender(String type){
    if("male" == type){
      gender = "male";
      notifyListeners();
    }else {
      gender = "female";
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

}