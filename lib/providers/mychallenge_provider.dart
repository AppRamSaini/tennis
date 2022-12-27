import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/mychallenge.dart';

class MychallengeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List playerlist = [];
  void leaguesPlayerList(BuildContext context,String league_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          getMyChallengeList(context,league_uuid).then((response) {
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
  void leaguesPlayerChallenge(BuildContext context,String player_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendMyChallengePlayer(context,player_uuid).then((response) {
            if (json.decode(response.body)['status'] == true) {
              playerlist = json.decode(response.body)['players'];
              notifyListeners();
            } else if (json.decode(response.body)['status'] == false) {
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
}