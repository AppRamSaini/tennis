import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/models/newscategorymodel.dart';
import 'package:tennis/repository/news.dart';

class NewsProvider extends ChangeNotifier {
  NewsCategoryModel? newsCategoryModel;
  List<Map<String, dynamic>> newsCateList = [];
  List<Map<String, dynamic>> newsCateAllList = [];
  List catNewsList = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isNewsLoading = false;
  bool get isNewsLoading => _isNewsLoading;
  List<Map<String, dynamic>> firstNews = [
    {
      "id": '0',
      "category": 'All',
    },
  ];
  void getNewsCategoryList(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          _isLoading = true;
          notifyListeners();
          newsCategoryList().then((response) {
            if (json.decode(response.body)['status'] == true) {
              print('login api done');
              newsCateList.clear();
              newsCateAllList.clear();
              newsCateList = List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
              newsCateAllList.addAll(firstNews+newsCateList);
              _isLoading = false;
              notifyListeners();
            } else if (json.decode(response.body)['status'] == false) {
              _isLoading = false;
              notifyListeners();
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
  void getCategoryNewsList(BuildContext context,String cat_id) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          _isNewsLoading = true;
          notifyListeners();
          newsList(cat_id).then((response) {
            if (json.decode(response.body)['status'] == true) {
              print('login api done'+cat_id);
              catNewsList.clear();
              catNewsList = json.decode(response.body)['data'];
              _isNewsLoading = false;
              notifyListeners();
            } else if (json.decode(response.body)['status'] == false) {
              _isNewsLoading = false;
              notifyListeners();
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