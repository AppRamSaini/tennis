import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/all_matchs.dart';
import 'package:tennis/repository/myleagues.dart';

class AllMatchsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List leagueslist = [];
  List allMResultlist = [];
  void getAllMatchList(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          allMatchList(context).then((response) {
            if (json.decode(response.body)['status'] == true) {
              leagueslist = json.decode(response.body)['leagues'];
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
  void getAllMatchWishResultList(BuildContext context,String league_uuid) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          allMatchWishResultList(context,league_uuid).then((response) {
            if (json.decode(response.body)['status'] == true) {
              allMResultlist = json.decode(response.body)['matches'];
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
}