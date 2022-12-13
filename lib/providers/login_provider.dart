import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/auth.dart';
import 'package:tennis/screens/auth/otp.dart';

class LoginProvider extends ChangeNotifier {
   void authLoginData(BuildContext context,String phone,){
     try {
       Helpers.verifyInternet().then((intenet) {
         if (intenet != null && intenet) {
           authLogin(context,phone)
               .then((response) {
             if(json.decode(response.body)['status']==true){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => OTP(number: phone,)),
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