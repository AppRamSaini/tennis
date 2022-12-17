import 'package:flutter/material.dart';

class CreateLeaguesProvider extends ChangeNotifier {
  int NSet = 0;

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
}