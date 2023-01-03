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
}