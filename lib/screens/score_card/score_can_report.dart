import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class ScoreCanReport extends StatefulWidget {
  const ScoreCanReport({Key? key}) : super(key: key);

  @override
  State<ScoreCanReport> createState() => _ScoreCanReportState();
}

class _ScoreCanReportState extends State<ScoreCanReport> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.MainColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),

      ),

    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(canReport,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: MyAppTheme.whiteColor,
                fontFamily: Fonts.nunito,
              ))),
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/black_back_arrow.svg',
          allowDrawingOutsideViewBox: true,
          height: 20,
          width: 20,
          color: MyAppTheme.whiteColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [],
      backgroundColor: MyAppTheme.MainColor,
    );
  }
}
