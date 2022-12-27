import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/repository/add_player.dart';
import 'package:tennis/repository/myleagues.dart';
import 'package:tennis/screens/dashboard/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';

class AddPlayerProvider extends ChangeNotifier {
    List playerList = [];
    bool playerSearch = false;
    bool playerInvite = false;
    bool inviteBtn = false;
    String number = "";
    void changePlayerInvite (){
      playerSearch = false;
      playerList = [];
      notifyListeners();
    }
    void clearData(){
      playerList = [];
      playerSearch = false;
      playerInvite = false;
      inviteBtn = false;
      number = "";
      notifyListeners();
    }
    void shareWhatsApp(BuildContext context,String number,String name){
      String shareBody = "Hello $number\nI am inviting you to join\n$name \n\nDownload the Tennis Khelo app \nhttps://webzon.in/App\n\nLogin with $number\n\n" ;
      openwhatsapp(context,number,shareBody);
    }
    openwhatsapp(BuildContext context,String number,String message) async{
     // var whatsappURlAndroid = "whatsapp://send?phone=$number&text=$message";
      var whatsappURlAndroid = "https://api.whatsapp.com/send?phone=$number=${Uri.parse(message)}";
      var whatappURLIos ="https://wa.me/$number?text=${Uri.encodeFull(message)}";
      if(Platform.isIOS){
        // for iOS phone only
        if( await canLaunch(whatappURLIos)){
          await launch(whatappURLIos, forceSafariVC: false);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("whatsapp no installed")));
        }
      }else{
        // android , web
        if( await canLaunch(whatsappURlAndroid)){
          await launch(whatsappURlAndroid);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("whatsapp no installed")));

        }


      }

    }
    void addLeaguesInvitePlayer(BuildContext context,String league_uuid,String phone) async {
      try {
        Helpers.verifyInternet().then((intenet) {
          if (intenet != null && intenet) {
            sendLeaguesInvitePlayer(context,league_uuid,phone).then((response) {
              if (json.decode(response)['status'] == true) {
                playerList.clear();
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
    void addPlayerRequestSend(BuildContext context,String league_uuid,String user_uuid) async {
      try {
        Helpers.verifyInternet().then((intenet) {
          if (intenet != null && intenet) {
            sendLeagueRequest(context,league_uuid,user_uuid).then((response) {
              if (json.decode(response)['status'] == true) {
                playerList.clear();
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
    void searchPlayerList(BuildContext context,String league_uuid,String phone) async {
      try {
        Helpers.verifyInternet().then((intenet) {
          if (intenet != null && intenet) {
            getPlayerList(context,league_uuid,phone).then((response) {
              if (json.decode(response)['status'] == true) {
                playerList = json.decode(response)['players'];
                if(playerList.isEmpty){
                  number = phone;
                  playerSearch = true;
                  if(phone.length == 10){
                    inviteBtn = true;
                  }else {
                    inviteBtn = false;
                  }
                }else {
                  inviteBtn = false;
                  playerSearch = false;
                }
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
}