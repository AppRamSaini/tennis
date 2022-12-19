import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/myleagues.dart';
class MyLeaguesProvider extends ChangeNotifier {
  //String userRole = '';             //hint data show 3 type 1."request": null 2."role": "player",3."role": "admin",4."request_status": "Approved"
  String userRequest = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List leagueslist = [];
  void leaguesPermissionStatus(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        _isLoading = true;
        notifyListeners();
        if (intenet != null && intenet) {
          getLeaguesPermissionStatus(context).then((response) {
            if (json.decode(response.body)['status'] == true) {
               // userRole = json.decode(response.body)['role'];
                print(json.decode(response.body)['role']);
                print(json.decode(response.body)['request']);
                if(json.decode(response.body)['request'] == null){
                  userRequest = "null";
                  print(json.decode(response.body)['request']);
                }else{
                  userRequest = json.decode(response.body)['request']['request_status'];
                  print(json.decode(response.body)['request']['request_status']);
                }
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
  void requestLeaguePermission(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          sendRequestLeaguePermission(context).then((response) {
            if (json.decode(response.body)['status'] == true) {
             // userRole = "player";
              userRequest = json.decode(response.body)['request']['request_status'];
             // Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
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
  void getMyLeaguesList(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          getLeaguesList(context).then((response) {
            if (json.decode(response.body)['status'] == true) {
              leagueslist = json.decode(response.body)['leagues'];
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
}
