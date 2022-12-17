import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/auth.dart';
import 'package:tennis/screens/auth/login.dart';
import 'package:tennis/screens/auth/otp.dart';

class LoginProvider extends ChangeNotifier {
   void authLoginData(BuildContext context,String phone,String type){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           authLogin(context,phone)
               .then((response) {
             if(json.decode(response.body)['status']==true){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => OTP(number: phone, type: type, time: json.decode(response.body)['resend'],)),
               );

             }else if(json.decode(response.body)['status']==false){
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
   void authRegistorData(BuildContext context,String user_name,String email,String phone,String type){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           authRegistor(context,user_name,email,phone)
               .then((response) {
             if(json.decode(response.body)['status']==true){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => OTP(number: phone, type: type, time: json.decode(response.body)['resend'],)),
               );
             }else if(json.decode(response.body)['status']==false){
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
   void authLogout(BuildContext context){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           sendLogout(context)
               .then((response) {
             if(json.decode(response.body)['status'] == true){
               SharedPref.removeAll();
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => Login()),
               );
             }else if(json.decode(response.body)['status']==false){
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