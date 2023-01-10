import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/my_result.dart';

class MyResultProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List resultlist = [];
  void getResultList(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          myResultList(context).then((response) {
            if (json.decode(response)['status'] == true) {
              resultlist = json.decode(response)['results'];
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
  void sendCanReport(BuildContext context,String challengeUuid,String scoreUuid,String details) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendEditCanReport(context,challengeUuid,scoreUuid,details).then((response) {
            if (json.decode(response)['status'] == true) {
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
}