import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/bottomdilog/scoreinvalide.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/add_score.dart';
import 'package:tennis/screens/dashboard/dashboard.dart';

class ScoreCardProvider extends ChangeNotifier {

   bool fTB = false;
   bool fVCheck = false;
   bool fTBVCheck = false;

   bool sTB = false;
   bool sVCheck = false;
   bool sTBVCheck = false;

   bool tTB = false;
   bool tVCheck = false;
   bool tTBVCheck = false;

   bool forthTB = false;
   bool forthVCheck = false;
   bool forthTBVCheck = false;

   bool fiveTB = false;
   bool fiveVCheck = false;
   bool fiveTBVCheck = false;

   int winnerTotalCount = 0;
   int loserTotalCount = 0;

   int fWCount = 0;
   int fLCount = 0;

   int sWCount = 0;
   int sLCount = 0;

   int tWCount = 0;
   int tLCount = 0;

   int forthWCount = 0;
   int forthLCount = 0;

   int fiveWCount = 0;
   int fiveLCount = 0;

   int superTieBreakerWCount = 0;
   int superTieBreakerLCount = 0;

   bool superTieBreakerVCheck = false;
 //  bool secSuperTieBreakerVCheck = false;

   void reSetAllValue(){
     fTB = false;
     fVCheck = false;
     fTBVCheck = false;

     sTB = false;
     sVCheck = false;
     sTBVCheck = false;

     tTB = false;
     tVCheck = false;
     tTBVCheck = false;

     forthTB = false;
     forthVCheck = false;
     forthTBVCheck = false;

     fiveTB = false;
     fiveVCheck = false;
     fiveTBVCheck = false;

     superTieBreakerVCheck = false;
     //secSuperTieBreakerVCheck = false;

     winnerTotalCount = 0;
     loserTotalCount = 0;

     fWCount = 0;
     fLCount = 0;

     sWCount = 0;
     sLCount = 0;

     tWCount = 0;
     tLCount = 0;

     forthWCount = 0;
     forthLCount = 0;

     fiveWCount = 0;
     fiveLCount = 0;

     superTieBreakerWCount = 0;
     superTieBreakerLCount = 0;
     notifyListeners();
   }
   void reSetValue(String value){
     if(value == 'Set 1'){
       sTB = false;
       sVCheck = false;
       sTBVCheck = false;

       tTB = false;
       tVCheck = false;
       tTBVCheck = false;

       forthTB = false;
       forthVCheck = false;
       forthTBVCheck = false;

       fiveTB = false;
       fiveVCheck = false;
       fiveTBVCheck = false;

       superTieBreakerVCheck = false;
      // secSuperTieBreakerVCheck = false;
       notifyListeners();
     }else if(value == 'Set 2'){
       tTB = false;
       tVCheck = false;
       tTBVCheck = false;

       forthTB = false;
       forthVCheck = false;
       forthTBVCheck = false;

       fiveTB = false;
       fiveVCheck = false;
       fiveTBVCheck = false;
       superTieBreakerVCheck = false;
      // secSuperTieBreakerVCheck = false;

       notifyListeners();
     }else if(value == 'Set 3'){
       forthTB = false;
       forthVCheck = false;
       forthTBVCheck = false;

       fiveTB = false;
       fiveVCheck = false;
       fiveTBVCheck = false;
       superTieBreakerVCheck = false;
      // secSuperTieBreakerVCheck = false;

       notifyListeners();
     }else if(value == 'Set 4'){
       fiveTB = false;
       fiveVCheck = false;
       fiveTBVCheck = false;
       superTieBreakerVCheck = false;
      // secSuperTieBreakerVCheck = false;

       notifyListeners();
     }

   }
/*  void superTieBreakValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
       if(int.parse(win) > int.parse(los)){
         if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          fWCount++;
          print('AAA1$fWCount');
           notifyListeners();
         }else if (int.parse(win) == 6){
           fWCount++;
           print('AAA2$fWCount');
           notifyListeners();
         }else if (int.parse(win) == 7 && int.parse(los) == 5){
           fWCount++;
           print('AAA3$fWCount');
           notifyListeners();
         }

       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
           fLCount++;
           print('AAA5$fLCount');
           notifyListeners();
         }else if (int.parse(los) == 6){
           fLCount++;
           print('AAA6$fLCount');
           notifyListeners();
         } else if (int.parse(win) == 5 && int.parse(los) == 7){
           fLCount++;
           print('AAA7$fLCount');
           notifyListeners();
         }

       }else if(int.parse(win) == 6 && int.parse(los) == 6){
         fWCount = 0;
         fLCount = 0;
         notifyListeners();
       }else if(int.parse(win) == int.parse(los)){
         fWCount = 0;
         fLCount = 0;
         notifyListeners();
       }
     }else {
       fWCount = 0;
       fLCount = 0;
       notifyListeners();
     }
  }
   void tieBreakerSuperTieBreakValueCheck(String tieWin,String tieLos){
     if(tieWin.isNotEmpty && tieLos.isNotEmpty){
       if(int.parse(tieWin) > int.parse(tieLos)){
         if(int.parse(tieWin) >= 7 && int.parse(tieLos) >= 5){
           if(int.parse(tieWin) - int.parse(tieLos) == 2){
             fWCount++;
             print('AAA11$fWCount');
             notifyListeners();
           }else {
             fWCount = 0;
             fLCount = 0;
             print('AAA12$fLCount');
             notifyListeners();
           }
         }else if (int.parse(tieWin) == 7 && int.parse(tieLos) <= 5){
           fWCount++;
           print('AAA13$fWCount');
           notifyListeners();
         }
         else {
           fWCount = 0;
           fLCount = 0;
           print('AAA14$fLCount');
           notifyListeners();
         }

       }else if(int.parse(tieWin) < int.parse(tieLos)){
         if(int.parse(tieWin) >= 5 && int.parse(tieLos) >= 7){
           if(int.parse(tieLos) - int.parse(tieWin) == 2){
             fLCount++;
             print('AAA15$fLCount');
             notifyListeners();
           }else {
             fWCount = 0;
             fLCount = 0;
             print('AAA16$fWCount');
             notifyListeners();
           }
         }else if (int.parse(tieWin) <= 5 && int.parse(tieLos) == 7){
           fLCount++;
           print('AAA17$fLCount');
           notifyListeners();
         }
         else {
           fWCount = 0;
           fLCount = 0;
           print('AAA18$fWCount');
           notifyListeners();
         }

       }else if(int.parse(tieWin) == int.parse(tieLos)){
         fWCount = 0;
         fLCount = 0;
         notifyListeners();
       }
     }else {
       fWCount = 0;
       fLCount = 0;
       notifyListeners();
     }
   }*/
  ////////////////////////////////super tie breaker value ////////////////////////
  void superTieBreakerValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          superTieBreakerVCheck = true;
          superTieBreakerWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
          notifyListeners();
        }else if (int.parse(win) == 6){
          superTieBreakerVCheck = true;
          superTieBreakerWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          superTieBreakerVCheck = true;
          superTieBreakerWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
          notifyListeners();
        }
        else {
          superTieBreakerVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          superTieBreakerVCheck = true;
          superTieBreakerLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
          notifyListeners();
        }else if (int.parse(los) == 6){
          superTieBreakerVCheck = true;
          superTieBreakerLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
          notifyListeners();
        } else if (int.parse(win) == 5 && int.parse(los) == 7){
          superTieBreakerVCheck = true;
          superTieBreakerLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
          notifyListeners();
        }
        else {
          superTieBreakerVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        superTieBreakerWCount = 0;
        superTieBreakerLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
        superTieBreakerVCheck = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        superTieBreakerWCount = 0;
        superTieBreakerLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
        superTieBreakerVCheck = false;
        notifyListeners();
      }
    }else {
      superTieBreakerWCount = 0;
      superTieBreakerLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+superTieBreakerWCount;
      loserTotalCount = fLCount+sLCount+tLCount+forthLCount+superTieBreakerLCount;
      superTieBreakerVCheck = false;
      notifyListeners();
    }

  }
 /* void secSuperTieBreakerValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          secSuperTieBreakerVCheck = true;
          fWCount++;
          notifyListeners();
        }else if (int.parse(win) == 6){
          secSuperTieBreakerVCheck = true;
          fWCount++;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          secSuperTieBreakerVCheck = true;
          fWCount++;
          notifyListeners();
        }
        else {
          secSuperTieBreakerVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          secSuperTieBreakerVCheck = true;
          fLCount++;
          notifyListeners();
        }else if (int.parse(los) == 6){
          secSuperTieBreakerVCheck = true;
          fLCount++;
          notifyListeners();
        } else if (int.parse(win) == 5 && int.parse(los) == 7){
          secSuperTieBreakerVCheck = true;
          fLCount++;
          notifyListeners();
        }
        else {
          secSuperTieBreakerVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        fWCount = 0;
        fLCount = 0;
        secSuperTieBreakerVCheck = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        fWCount = 0;
        fLCount = 0;
        secSuperTieBreakerVCheck = false;
        notifyListeners();
      }
    }else {
      fWCount = 0;
      fLCount = 0;
      secSuperTieBreakerVCheck = false;
      notifyListeners();
    }

  }*/
///////////////////////////////set first value ///////////////////////////////////////////
   void firstValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
         if(int.parse(win) > int.parse(los)){
         if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
           fVCheck = true;
           fWCount++;
           notifyListeners();
         }else if (int.parse(win) == 6){
           fVCheck = true;
           fWCount++;
           notifyListeners();
         }else if (int.parse(win) == 7 && int.parse(los) == 5){
           fVCheck = true;
           fWCount++;
           notifyListeners();
         }
         else {
           fVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
           fVCheck = true;
           fLCount++;
           notifyListeners();
         }else if (int.parse(los) == 6){
           fVCheck = true;
           fLCount++;
           notifyListeners();
         } else if (int.parse(win) == 5 && int.parse(los) == 7){
           fVCheck = true;
           fLCount++;
           notifyListeners();
         }
         else {
           fVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) == 6 && int.parse(los) == 6){
           fWCount = 0;
           fLCount = 0;
           fVCheck = true;
           fTB = true;
         notifyListeners();
       }else if(int.parse(win) == int.parse(los)){
           fWCount = 0;
           fLCount = 0;
           fVCheck = false;
           notifyListeners();
         }
     }else {
       fWCount = 0;
       fLCount = 0;
       fVCheck = false;
       fTB = false;
       notifyListeners();
     }

   }
   void firstTieBreakValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
       if(int.parse(win) > int.parse(los)){
         if(int.parse(win) >= 7 && int.parse(los) >= 5){
           if(int.parse(win) - int.parse(los) == 2){
             fWCount++;
             fTBVCheck = true;
             notifyListeners();
           }else {
             fWCount = 0;
             fLCount = 0;
             fTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) == 7 && int.parse(los) <= 5){
           fWCount++;
           fTBVCheck = true;
           notifyListeners();
         }
         else {
           fWCount = 0;
           fLCount = 0;
           fTBVCheck = false;
           notifyListeners();
         }

       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(win) >= 5 && int.parse(los) >= 7){
           if(int.parse(los) - int.parse(win) == 2){
             fLCount++;
             fTBVCheck = true;
             notifyListeners();
           }else {
             fWCount = 0;
             fLCount = 0;
             fTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) <= 5 && int.parse(los) == 7){
           fLCount++;
           fTBVCheck = true;
           notifyListeners();
         }
         else {
           fWCount = 0;
           fLCount = 0;
           fTBVCheck = false;
           notifyListeners();
         }

       }else if(int.parse(win) == int.parse(los)){
         fWCount = 0;
         fLCount = 0;
         fTBVCheck = false;
         notifyListeners();
       }
     }else {
       fWCount = 0;
       fLCount = 0;
       fTBVCheck = false;
       notifyListeners();
     }
   }
////////////////////////////////set second value ////////////////////////////////////////////
   void secondValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
       if(int.parse(win) > int.parse(los)){
         if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
           sWCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           sVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 6){
           sWCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           sVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 7 && int.parse(los) == 5){
           sWCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           sVCheck = true;
           notifyListeners();
         }
         else {
           sVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
           sVCheck = true;
           sLCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           notifyListeners();
         }else if (int.parse(los) == 6){
           sVCheck = true;
           sLCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           notifyListeners();
         }else if (int.parse(win) == 5 && int.parse(los) == 7){
           sVCheck = true;
           sLCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           notifyListeners();
         }
         else {
           sVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) == 6 && int.parse(los) == 6){
         sWCount = 0;
         sLCount = 0;
         winnerTotalCount = fWCount+sWCount;
         loserTotalCount = fLCount+sLCount;
         print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
         sVCheck = true;
         sTB = true;
         notifyListeners();
       }else if(int.parse(win) == int.parse(los)){
         sWCount = 0;
         sLCount = 0;
         winnerTotalCount = fWCount+sWCount;
         loserTotalCount = fLCount+sLCount;
         print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
         sVCheck = false;
         notifyListeners();
       }
     }else {
       sWCount = 0;
       sLCount = 0;
       winnerTotalCount = fWCount+sWCount;
       loserTotalCount = fLCount+sLCount;
       print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
       sVCheck = false;
       sTB = false;
       notifyListeners();
     }

   }
   void secondTieBreakValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
       if(int.parse(win) > int.parse(los)){
         if(int.parse(win) >= 7 && int.parse(los) >= 5){
           if(int.parse(win) - int.parse(los) == 2){
             sTBVCheck = true;
             sWCount++;
             winnerTotalCount = fWCount+sWCount;
             loserTotalCount = fLCount+sLCount;
             print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
             notifyListeners();
           }else {
             sWCount = 0;
             sLCount = 0;
             winnerTotalCount = fWCount+sWCount;
             loserTotalCount = fLCount+sLCount;
             print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
             sTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) == 7 && int.parse(los) <= 5){
           sTBVCheck = true;
           sWCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           notifyListeners();
         }
         else {
           sWCount = 0;
           sLCount = 0;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           sTBVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(win) >= 5 && int.parse(los) >= 7){
           if(int.parse(los) - int.parse(win) == 2){
             sTBVCheck = true;
             sLCount++;
             winnerTotalCount = fWCount+sWCount;
             loserTotalCount = fLCount+sLCount;
             print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
             notifyListeners();
           }else {
             sWCount = 0;
             sLCount = 0;
             winnerTotalCount = fWCount+sWCount;
             loserTotalCount = fLCount+sLCount;
             print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
             sTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) <= 7 && int.parse(los) == 7){
           sTBVCheck = true;
           sLCount++;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           notifyListeners();
         }
         else {
           sWCount = 0;
           sLCount = 0;
           winnerTotalCount = fWCount+sWCount;
           loserTotalCount = fLCount+sLCount;
           print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
           sTBVCheck = false;
           notifyListeners();
         }

       }else if(int.parse(win) == int.parse(los)){
         sWCount = 0;
         sLCount = 0;
         winnerTotalCount = fWCount+sWCount;
         loserTotalCount = fLCount+sLCount;
         print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
         sTBVCheck = false;
         notifyListeners();
       }
     }else {
       sWCount = 0;
       sLCount = 0;
       winnerTotalCount = fWCount+sWCount;
       loserTotalCount = fLCount+sLCount;
       print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
       sTBVCheck = false;

       notifyListeners();
     }
   }
   ////////////////////////////set third value /////////////////////////////////////////
  void thirdValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          tVCheck = true;
          tWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          notifyListeners();
        }else if (int.parse(win) == 6){
          tVCheck = true;
          tWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          tVCheck = true;
          tWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          notifyListeners();
        }
        else {
          tVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          tVCheck = true;
          tLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          notifyListeners();
        }else if (int.parse(los) == 6){
          tVCheck = true;
          tLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          notifyListeners();
        }else if (int.parse(win) == 5 && int.parse(los) == 7){
          tVCheck = true;
          tLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          notifyListeners();
        }
        else {
          tVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        tWCount = 0;
        tLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount;
        loserTotalCount = fLCount+sLCount+tLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        tVCheck = true;
        tTB = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        tWCount = 0;
        tLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount;
        loserTotalCount = fLCount+sLCount+tLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        tVCheck = false;
        notifyListeners();
      }
    }else {
      tWCount = 0;
      tLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount;
      loserTotalCount = fLCount+sLCount+tLCount;
      print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
      tVCheck = false;
      tTB = false;
      notifyListeners();
    }

  }
  void thirdTieBreakValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) >= 7 && int.parse(los) >= 5){
          if(int.parse(win) - int.parse(los) == 2){
            tWCount++;
            winnerTotalCount = fWCount+sWCount+tWCount;
            loserTotalCount = fLCount+sLCount+tLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            tTBVCheck = true;
            notifyListeners();
          }else {
            tWCount = 0;
            tLCount = 0;
            winnerTotalCount = fWCount+sWCount+tWCount;
            loserTotalCount = fLCount+sLCount+tLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            tTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) == 7 && int.parse(los) <= 5){
          tWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          tTBVCheck = true;
          notifyListeners();
        }
        else {
          tWCount = 0;
          tLCount = 0;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          tTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(win) >= 5 && int.parse(los) >= 7){
          if(int.parse(los) - int.parse(win) == 2){
            tLCount++;
            winnerTotalCount = fWCount+sWCount+tWCount;
            loserTotalCount = fLCount+sLCount+tLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            tTBVCheck = true;
            notifyListeners();
          }else {
            tWCount = 0;
            tLCount = 0;
            winnerTotalCount = fWCount+sWCount+tWCount;
            loserTotalCount = fLCount+sLCount+tLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            tTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) <= 5 && int.parse(los) == 7){
          tLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          tTBVCheck = true;
          notifyListeners();
        }
        else {
          tWCount = 0;
          tLCount = 0;
          winnerTotalCount = fWCount+sWCount+tWCount;
          loserTotalCount = fLCount+sLCount+tLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          tTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) == int.parse(los)){
        tWCount = 0;
        tLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount;
        loserTotalCount = fLCount+sLCount+tLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        tTBVCheck = false;
        notifyListeners();
      }
    }else {
      tWCount = 0;
      tLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount;
      loserTotalCount = fLCount+sLCount+tLCount;
      print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
      tTBVCheck = false;
      notifyListeners();
    }


  }
  ///////////////////////set furth value ////////////////////////
  void furthValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          forthWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 6){
          forthWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          forthWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthVCheck = true;
          notifyListeners();
        }
        else {
          forthVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          forthLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(los) == 6){
          forthLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 5 && int.parse(los) == 7){
          forthLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthVCheck = true;
          notifyListeners();
        }
        else {
          forthVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        forthWCount = 0;
        forthLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        forthVCheck = true;
        forthTB = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        forthWCount = 0;
        forthLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        forthVCheck = false;
        notifyListeners();
      }
    }else {
      forthWCount = 0;
      forthLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
      loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
      print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
      forthVCheck = false;
      forthTB = false;
      notifyListeners();
    }

  }
  void furthTieBreakValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) >= 7 && int.parse(los) >= 5){
          if(int.parse(win) - int.parse(los) == 2){
            forthWCount++;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            forthTBVCheck = true;
            notifyListeners();
          }else {
            forthWCount = 0;
            forthLCount = 0;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            forthTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) == 7 && int.parse(los) <= 5){
          forthWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthTBVCheck = true;
          notifyListeners();
        }
        else {
          forthWCount = 0;
          forthLCount = 0;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(win) >= 5 && int.parse(los) >= 7){
          if(int.parse(los) - int.parse(win) == 2){
            forthLCount++;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            forthTBVCheck = true;
            notifyListeners();
          }else {
            forthWCount = 0;
            forthLCount = 0;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            forthTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) <= 5 && int.parse(los) == 7){
          forthLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthTBVCheck = true;
          notifyListeners();
        }
        else {
          forthWCount = 0;
          forthLCount = 0;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          forthTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) == int.parse(los)){
        forthWCount = 0;
        forthLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        forthTBVCheck = false;
        notifyListeners();
      }
    }else {
      forthWCount = 0;
      forthLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount+forthWCount;
      loserTotalCount = fLCount+sLCount+tLCount+forthLCount;
      print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
      forthTBVCheck = false;
      notifyListeners();
    }


  }
  //////////////////////////set five value ///////////////////////////
  void fiveValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          fiveWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 6){
          fiveWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          fiveWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveVCheck = true;
          notifyListeners();
        }
        else {
          fiveVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          fiveLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(los) == 6){
          fiveLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 5 && int.parse(los) == 7){
          fiveLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveVCheck = true;
          notifyListeners();
        }
        else {
          fiveVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        fiveWCount = 0;
        fiveLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        fiveVCheck = true;
        fiveTB = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        fiveWCount = 0;
        fiveLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        fiveVCheck = false;
        notifyListeners();
      }
    }else {
      fiveWCount = 0;
      fiveLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
      loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
      print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
      fiveVCheck = false;
      fiveTB = false;
      notifyListeners();
    }

  }
  void fiveTieBreakValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) >= 7 && int.parse(los) >= 5){
          if(int.parse(win) - int.parse(los) == 2){
            fiveWCount++;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            fiveTBVCheck = true;
            notifyListeners();
          }else {
            fiveWCount = 0;
            fiveLCount = 0;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            fiveTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) == 7 && int.parse(los) <= 5){
          fiveWCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveTBVCheck = true;
          notifyListeners();
        }
        else {
          fiveWCount = 0;
          fiveLCount = 0;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(win) >= 5 && int.parse(los) >= 7){
          if(int.parse(los) - int.parse(win) == 2){
            fiveLCount++;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            fiveTBVCheck = true;
            notifyListeners();
          }else {
            fiveWCount = 0;
            fiveLCount = 0;
            winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
            loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
            print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
            fiveTBVCheck = false;
            notifyListeners();
          }
        } else if (int.parse(win) <= 5 && int.parse(los) == 7){
          fiveLCount++;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveTBVCheck = true;
          notifyListeners();
        }
        else {
          fiveWCount = 0;
          fiveLCount = 0;
          winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
          loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
          print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
          fiveTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) == int.parse(los)){
        fiveWCount = 0;
        fiveLCount = 0;
        winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
        loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
        print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
        fiveTBVCheck = false;
        notifyListeners();
      }
    }else {
      fiveWCount = 0;
      fiveLCount = 0;
      winnerTotalCount = fWCount+sWCount+tWCount+forthWCount+fiveWCount;
      loserTotalCount = fLCount+sLCount+tLCount+forthLCount+fiveLCount;
      print("total winner count${winnerTotalCount}loser total count$loserTotalCount");
      fiveTBVCheck = false;
      notifyListeners();
    }

  }

  void sendChallengeScore(BuildContext context,String winner_uuid,String status,String score) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          addChallengeScore(context,winner_uuid,status,score).then((response) {
            if (json.decode(response)['status'] == true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoard(selectedIndex: 0,)),
              );
            } else if (json.decode(response)['status'] == false) {
              Helpers.createErrorSnackBar(context, json.decode(response)['message'].toString());
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