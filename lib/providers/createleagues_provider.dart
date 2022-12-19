import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/myleagues.dart';

class CreateLeaguesProvider extends ChangeNotifier {
  int NSet = 0;
  void SetValue(){
    NSet = 0;
    notifyListeners();
  }
  void AddNSet(){
    if(NSet <= 5){
      NSet++;
      notifyListeners();
    }
  }
  void MinsNSet(){
    if(NSet > 0){
       NSet--;
       notifyListeners();
    }
  }
  void createLeagueData(BuildContext context,String league_name,String type,String desc,int sets) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          setCreateLeague(context,league_name,type,desc,sets).then((response) {
            if (json.decode(response)['status'] == true) {
              Navigator.pop(context);
            } else if (json.decode(response)['status'] == false) {
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