import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/home.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void getHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          _isLoading = true;
          notifyListeners();
          homeData().then((response) {
            if (json.decode(response.body)['status'] == true) {
              print('login api done');
              _isLoading = false;
              notifyListeners();
            } else if (json.decode(response.body)['status'] == 300) {
              Helpers.createErrorSnackBar(context, json.decode(response.body)['message'].toString());
            } else {
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