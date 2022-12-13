import 'package:flutter/material.dart';

class ScoreCardProvider extends ChangeNotifier {
   String winnerName = '';
   String numberOfSet = '';
   String matchStatus = '';
   bool fTB = false;
   bool sTB = false;
   bool tTB = false;
   bool forthTB = false;
   bool fiveTB = false;
   bool sixTB = false;
   int selectWIndex = -1;
   int selectSIndex = 3;
   int selectMSIndex = -1;
   void selectWinnerIndex (int index,String wName){
     selectWIndex = index;
     winnerName = wName;
     notifyListeners();
   }
   void selectMatchStatusIndex (int index,String mStatus){
     selectMSIndex = index;
     matchStatus = mStatus;
     notifyListeners();
   }
   void selectSetsIndex (int index,String nSets){
     selectSIndex = index;
     numberOfSet = nSets;
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
   void forthTieBreak(String win,String los){
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
         forthTB = true;
         notifyListeners();
       }
     }else {
       forthTB = false;
       notifyListeners();
     }

   }
   void fiveTieBreak(String win,String los){
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
         fiveTB = true;
         notifyListeners();
       }
     }else {
       fiveTB = false;
       notifyListeners();
     }

   }
   void sixTieBreak(String win,String los){
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
         sixTB = true;
         notifyListeners();
       }
     }else {
       sixTB = false;
       notifyListeners();
     }

   }
}