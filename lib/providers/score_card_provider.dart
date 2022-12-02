import 'package:flutter/material.dart';

class ScoreCardProvider extends ChangeNotifier {
   String wName = '';
   String noSet = '';
   bool fTB = false;
   bool sTB = false;
   bool tTB = false;
   void addWinnerName(String name){
     wName = name;
     notifyListeners();
   }
   void addSets(String no){
     noSet = no;
     notifyListeners();
   }
   void firstTieBreak(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
     /*  if(int.parse(win) > int.parse(los)){
         if(int.parse(win) - int.parse(los) == 1){
           fTB = true;
           notifyListeners();
         }else {
           fTB = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) - int.parse(win) == 1){
           fTB = true;
           notifyListeners();
         }else {
           fTB = false;
           notifyListeners();
         }
       }else*/ if(int.parse(win) == int.parse(los)){
         fTB = true;
         notifyListeners();
       }
     }else {
       fTB = false;
       notifyListeners();
     }

   }
   void secondTieBreak(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
     /*  if(int.parse(win) > int.parse(los)){
         if(int.parse(win) - int.parse(los) == 1){
           sTB = true;
           notifyListeners();
         }else {
           sTB = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) - int.parse(win) == 1){
           sTB = true;
           notifyListeners();
         }else {
           sTB = false;
           notifyListeners();
         }
       }else*/ if(int.parse(win) == int.parse(los)){
         sTB = true;
         notifyListeners();
       }
     }else {
       sTB = false;
       notifyListeners();
     }

   }
   void thirdTieBreak(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
  /*     if(int.parse(win) > int.parse(los)){
         if(int.parse(win) - int.parse(los) == 1){
           tTB = true;
           notifyListeners();
         }else {
           tTB = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) - int.parse(win) == 1){
           tTB = true;
           notifyListeners();
         }else {
           tTB = false;
           notifyListeners();
         }
       }else*/ if(int.parse(win) == int.parse(los)){
         tTB = true;
         notifyListeners();
       }
     }else {
       tTB = false;
       notifyListeners();
     }

   }
}