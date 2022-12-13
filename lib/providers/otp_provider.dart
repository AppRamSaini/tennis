import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/auth.dart';
import 'package:tennis/screens/dashboard/dashboard.dart';

class OtpProvider extends ChangeNotifier {
  void authOTPData(BuildContext context,String phone,String otp){
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          authOtpVerify(context,phone,otp)
              .then((response) {
            if(json.decode(response.body)['status']==true){
              SharedPref.setToken(json.decode(response.body)['access_token']);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoard(selectedIndex: 0,)),
              );
              Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
            }else if(json.decode(response.body)['status']==403){
              Helpers.createErrorSnackBar(context, json.decode(response.body)['message'].toString());
            }else{
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