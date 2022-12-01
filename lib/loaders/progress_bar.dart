import 'package:flutter/material.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Progressbar extends StatelessWidget {
  const Progressbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppTheme.BGColor,
      body: Center(
        child: new CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyAppTheme.confirmbgColor)),
      ),
    );
  }
}
