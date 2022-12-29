import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/ranking_challenge.dart';

class RankingChallengeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List playerlist = [];
  void leaguesPlayerList(BuildContext context,String league_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          getLeaguesPlayerList(context,league_uuid).then((response) {
            if (json.decode(response.body)['status'] == true) {
              playerlist = json.decode(response.body)['players'];
              _isLoading = false;
              notifyListeners();
            } else if (json.decode(response.body)['status'] == false) {
              _isLoading = false;
              notifyListeners();
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
  void updateLeaguesPlayerList(BuildContext context,String league_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          getLeaguesPlayerList(context,league_uuid).then((response) {
            if (json.decode(response.body)['status'] == true) {
              playerlist = json.decode(response.body)['players'];
              notifyListeners();
            } else if (json.decode(response.body)['status'] == false) {
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
  void leaguesPlayerChallenge(BuildContext context,String leagues_uuid,String challenge_to) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendLeaguesPlayerChallenge(context,leagues_uuid,challenge_to).then((response) {
            if (json.decode(response)['status'] == true) {
              updateLeaguesPlayerList(context,leagues_uuid);
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
  void leaguesChallengeWithdraw(BuildContext context,String leagues_uuid,String challenge_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendLeaguesChallengeWithdraw(context,challenge_uuid).then((response) {
            if (json.decode(response)['status'] == true) {
              updateLeaguesPlayerList(context,leagues_uuid);
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