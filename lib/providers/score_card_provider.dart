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
       notifyListeners();
     }else if(value == 'Set 3'){
       forthTB = false;
       forthVCheck = false;
       forthTBVCheck = false;

       fiveTB = false;
       fiveVCheck = false;
       fiveTBVCheck = false;
       notifyListeners();
     }else if(value == 'Set 4'){
       fiveTB = false;
       fiveVCheck = false;
       fiveTBVCheck = false;
       notifyListeners();
     }

   }



   String winnerName = '';
   String numberOfSet = '';
   String matchStatus = '';
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
       }else*/ if(int.parse(win) == 6 && int.parse(los) == 6){
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
///////////////////////////////set first value ///////////////////////////////////////////
   void firstValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
         if(int.parse(win) > int.parse(los)){
         if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
           fVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 6){
           fVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 7 && int.parse(los) == 5){
           fVCheck = true;
           notifyListeners();
         }
         else {
           fVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
           fVCheck = true;
           notifyListeners();
         }else if (int.parse(los) == 6){
           fVCheck = true;
           notifyListeners();
         } else if (int.parse(win) == 5 && int.parse(los) == 7){
           fVCheck = true;
           notifyListeners();
         }
         else {
           fVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) == 6 && int.parse(los) == 6){
           fVCheck = true;
           fTB = true;
         notifyListeners();
       }else if(int.parse(win) == int.parse(los)){
           fVCheck = false;
           notifyListeners();
         }
     }else {
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
             fTBVCheck = true;
             notifyListeners();
           }else {
             fTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) == 7 && int.parse(los) <= 5){
           fTBVCheck = true;
           notifyListeners();
         }
         else {
           fTBVCheck = false;
           notifyListeners();
         }

       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(win) >= 5 && int.parse(los) >= 7){
           if(int.parse(los) - int.parse(win) == 2){
             fTBVCheck = true;
             notifyListeners();
           }else {
             fTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) <= 5 && int.parse(los) == 7){
           fTBVCheck = true;
           notifyListeners();
         }
         else {
           fTBVCheck = false;
           notifyListeners();
         }

       }else if(int.parse(win) == int.parse(los)){
         fTBVCheck = false;
         notifyListeners();
       }
     }else {
       fTBVCheck = false;
       notifyListeners();
     }


   }
////////////////////////////////set second value ////////////////////////////////////////////
   void secondValueCheck(String win,String los){
     if(win.isNotEmpty && los.isNotEmpty){
       if(int.parse(win) > int.parse(los)){
         if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
           sVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 6){
           sVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 7 && int.parse(los) == 5){
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
           notifyListeners();
         }else if (int.parse(los) == 6){
           sVCheck = true;
           notifyListeners();
         }else if (int.parse(win) == 5 && int.parse(los) == 7){
           sVCheck = true;
           notifyListeners();
         }
         else {
           sVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) == 6 && int.parse(los) == 6){
         sVCheck = true;
         sTB = true;
         notifyListeners();
       }else if(int.parse(win) == int.parse(los)){
         sVCheck = false;
         notifyListeners();
       }
     }else {
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
             notifyListeners();
           }else {
             sTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) == 7 && int.parse(los) <= 5){
           sTBVCheck = true;
           notifyListeners();
         }
         else {
           sTBVCheck = false;
           notifyListeners();
         }
         if(int.parse(win) - int.parse(los) == 2){
           sTBVCheck = true;
           notifyListeners();
         }else {
           sTBVCheck = false;
           notifyListeners();
         }
       }else if(int.parse(win) < int.parse(los)){
         if(int.parse(win) >= 5 && int.parse(los) >= 7){
           if(int.parse(los) - int.parse(win) == 2){
             sTBVCheck = true;
             notifyListeners();
           }else {
             sTBVCheck = false;
             notifyListeners();
           }
         }else if (int.parse(win) <= 7 && int.parse(los) == 7){
           sTBVCheck = true;
           notifyListeners();
         }
         else {
           sTBVCheck = false;
           notifyListeners();
         }

       }else if(int.parse(win) == int.parse(los)){
         sTBVCheck = false;
         notifyListeners();
       }
     }else {
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
          notifyListeners();
        }else if (int.parse(win) == 6){
          tVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          tVCheck = true;
          notifyListeners();
        }
        else {
          tVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          tVCheck = true;
          notifyListeners();
        }else if (int.parse(los) == 6){
          tVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 5 && int.parse(los) == 7){
          tVCheck = true;
          notifyListeners();
        }
        else {
          tVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        tVCheck = true;
        tTB = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        tVCheck = false;
        notifyListeners();
      }
    }else {
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
            tTBVCheck = true;
            notifyListeners();
          }else {
            tTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) == 7 && int.parse(los) <= 5){
          tTBVCheck = true;
          notifyListeners();
        }
        else {
          tTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(win) >= 5 && int.parse(los) >= 7){
          if(int.parse(los) - int.parse(win) == 2){
            tTBVCheck = true;
            notifyListeners();
          }else {
            tTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) <= 5 && int.parse(los) == 7){
          tTBVCheck = true;
          notifyListeners();
        }
        else {
          tTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) == int.parse(los)){
        tTBVCheck = false;
        notifyListeners();
      }
    }else {
      tTBVCheck = false;
      notifyListeners();
    }


  }
  ///////////////////////set furth value ////////////////////////
  void furthValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 6){
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          forthVCheck = true;
          notifyListeners();
        }
        else {
          forthVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(los) == 6){
          forthVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 5 && int.parse(los) == 7){
          forthVCheck = true;
          notifyListeners();
        }
        else {
          forthVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        forthVCheck = true;
        forthTB = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        forthVCheck = false;
        notifyListeners();
      }
    }else {
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
            forthTBVCheck = true;
            notifyListeners();
          }else {
            forthTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) == 7 && int.parse(los) <= 5){
          forthTBVCheck = true;
          notifyListeners();
        }
        else {
          forthTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(win) >= 5 && int.parse(los) >= 7){
          if(int.parse(los) - int.parse(win) == 2){
            forthTBVCheck = true;
            notifyListeners();
          }else {
            forthTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) <= 5 && int.parse(los) == 7){
          forthTBVCheck = true;
          notifyListeners();
        }
        else {
          forthTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) == int.parse(los)){
        forthTBVCheck = false;
        notifyListeners();
      }
    }else {
      forthTBVCheck = false;
      notifyListeners();
    }


  }
  //////////////////////////set five value ///////////////////////////
  void fiveValueCheck(String win,String los){
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) > int.parse(los)){
        if(int.parse(win) == 6 && int.parse(win) - int.parse(los) == 2){
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 6){
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 7 && int.parse(los) == 5){
          fiveVCheck = true;
          notifyListeners();
        }
        else {
          fiveVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(los) == 6 && int.parse(los) - int.parse(win) == 2){
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(los) == 6){
          fiveVCheck = true;
          notifyListeners();
        }else if (int.parse(win) == 5 && int.parse(los) == 7){
          fiveVCheck = true;
          notifyListeners();
        }
        else {
          fiveVCheck = false;
          notifyListeners();
        }
      }else if(int.parse(win) == 6 && int.parse(los) == 6){
        fiveVCheck = true;
        fiveTB = true;
        notifyListeners();
      }else if(int.parse(win) == int.parse(los)){
        fiveVCheck = false;
        notifyListeners();
      }
    }else {
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
            fiveTBVCheck = true;
            notifyListeners();
          }else {
            fiveTBVCheck = false;
            notifyListeners();
          }
        }else if (int.parse(win) == 7 && int.parse(los) <= 5){
          fiveTBVCheck = true;
          notifyListeners();
        }
        else {
          fiveTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) < int.parse(los)){
        if(int.parse(win) >= 5 && int.parse(los) >= 7){
          if(int.parse(los) - int.parse(win) == 2){
            fiveTBVCheck = true;
            notifyListeners();
          }else {
            fiveTBVCheck = false;
            notifyListeners();
          }
        } else if (int.parse(win) <= 5 && int.parse(los) == 7){
          fiveTBVCheck = true;
          notifyListeners();
        }
        else {
          fiveTBVCheck = false;
          notifyListeners();
        }

      }else if(int.parse(win) == int.parse(los)){
        fiveTBVCheck = false;
        notifyListeners();
      }
    }else {
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