import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis/screens/intro.dart';
import 'package:tennis/screens/score_card/winner.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigationToScreen);
  }
  void navigationToScreen() async{
    try {
      SharedPreferences prefs1 = await SharedPreferences.getInstance();
      String user_id = prefs1.getString('id') ?? '';
      print("user_id "+user_id);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool _seen = (prefs.getBool('seen') ?? false);
      if (_seen) {
        if(user_id !=''){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Winner()),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Winner()),
          );

        }
      } else {
        await prefs.setBool('seen', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Winner()),
        );
      }

    } on Exception catch (e) {
    }
  }
  @override
  void initState(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.whiteColor,
      statusBarBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ]);
    _startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyAppTheme.whiteColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "assets/images/flag_img.png",
          width: height * 0.3,
          height: width * 0.2,
        ),
      ),
    );
  }
}
