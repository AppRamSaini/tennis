import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Progressbar extends StatelessWidget {
  const Progressbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppTheme.whiteColor,
      body: Center(
        child:  Lottie.asset('assets/gifs/tennis_ball.json'),
        /*new CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyAppTheme.errorMessageTextColor)),*/
      ),
    );
  }
}
