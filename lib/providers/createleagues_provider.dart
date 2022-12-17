import 'package:flutter/material.dart';

class CreateLeaguesProvider extends ChangeNotifier {
  int NSet = 0;

  void AddNSet(){
    if(NSet <= 6){
      NSet++;
    }
  }
  void MinsNSet(){
    if(NSet > 0){
       NSet--;
    }
  }
}