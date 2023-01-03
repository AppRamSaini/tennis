import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/appconfig.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/my_challenge.dart';
import 'package:tennis/repository/mychallenge.dart';
import 'package:tennis/repository/ranking_challenge.dart';
import 'package:tennis/screens/score_card/add_score.dart';
import 'package:tennis/screens/score_card/score_add.dart';

class MychallengeProvider extends ChangeNotifier {
  void addScoreWithData(BuildContext context,String challenge_uuid,String challenger_name,String challenger_uuid,String accepter_name,String accepter_uuid,int sets){
    AppConfig.ChallengeUuid = challenge_uuid;
    AppConfig.ChallengerName = challenger_name;
    AppConfig.ChallengerUuid = challenger_uuid;
    AppConfig.AccepterName = accepter_name;
    AppConfig.AccepterUuid = accepter_uuid;
    AppConfig.Sets = sets;
    notifyListeners();
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore()));
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List playerlist = [];
  void challengePlayerList(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          myChallengeList(context).then((response) {
            if (json.decode(response)['status'] == true) {
              playerlist = json.decode(response)['challenge'];
              _isLoading = false;
              notifyListeners();
            } else if (json.decode(response)['status'] == false) {
              _isLoading = false;
              notifyListeners();
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
  void updateChallengePlayerList(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          myChallengeList(context).then((response) {
            if (json.decode(response)['status'] == true) {
              playerlist = json.decode(response)['challenge'];
              notifyListeners();
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
  void sendPlayerChallengeRequestStatus(BuildContext context,String challenge_uuid,String status) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendPlayerChallengeRequest(context,challenge_uuid,status).then((response) {
            if (json.decode(response)['status'] == true) {
              updateChallengePlayerList(context);
              Helpers.createSnackBar(context, json.decode(response)['message'].toString());
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
  void myChallengeWithdraw(BuildContext context,String challenge_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendLeaguesChallengeWithdraw(context,challenge_uuid).then((response) {
            if (json.decode(response)['status'] == true) {
              updateChallengePlayerList(context);
            } else if (json.decode(response)['status'] == false) {
              notifyListeners();
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