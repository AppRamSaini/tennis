import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/auth.dart';
import 'package:tennis/screens/auth/login.dart';
import 'package:tennis/screens/auth/otp.dart';
import 'package:tennis/screens/auth/registor.dart';
import 'package:tennis/screens/dashboard/dashboard.dart';

class LoginProvider extends ChangeNotifier {
   void authLoginData(BuildContext context,String phone){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           authLogin(context,phone)
               .then((response) {
             if(json.decode(response.body)['status']==true){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => OTP(number: phone,time: json.decode(response.body)['resend'],)),
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
   void authRegistorData(BuildContext context,String user_name,String email,String gender,String dob){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           saveUserDetails(context,user_name,email,gender,dob)
               .then((response) {
             if(json.decode(response)['status'] == true){
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => DashBoard(selectedIndex: 0)),
               );
             }else if(json.decode(response)['status'] == false){
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
   void authOTPData(BuildContext context,String phone,String otp){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           authOtpVerify(context,phone,otp)
               .then((response) {
             if(json.decode(response.body)['status']==true){
               SharedPref.setToken(json.decode(response.body)['access_token']);
               if(json.decode(response.body)['exist'] == "yes"){
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => DashBoard(selectedIndex: 0,)),
                 );
               }else {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Registor()),
                 );
               }
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