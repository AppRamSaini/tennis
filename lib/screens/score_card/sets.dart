import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/score_card/add_score.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sets extends StatefulWidget {
  const Sets({Key? key}) : super(key: key);

  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {
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
      body: Consumer<ScoreCardProvider>(
        builder: (context,provider,child){
          return Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    provider.addSets('1');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddScore()),
                    );
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(left: 15.0,top: 10.0,bottom: 5.0),
                    child: const Text('1',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.poppins,
                      ),),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 5.0,bottom: 10.0),
                  child: Container(
                    width: width,
                    height: 1,
                    color: MyAppTheme.MainColor,
                  ),),
                InkWell(
                  onTap: (){
                    provider.addSets('2');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddScore()),
                    );
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0),
                    child: const Text('2',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.poppins,
                      ),),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 5.0,bottom: 10.0),
                  child: Container(
                    width: width,
                    height: 1,
                    color: MyAppTheme.MainColor,
                  ),),
                InkWell(
                  onTap: (){
                    provider.addSets('3');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddScore()),
                    );
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0),
                    child: const Text('3',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.poppins,
                      ),),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 5.0,bottom: 10.0),
                  child: Container(
                    width: width,
                    height: 1,
                    color: MyAppTheme.MainColor,
                  ),),
              ],
            ),
          );
        },
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title:  const Padding(
          padding:  EdgeInsets.only(left: 0.0),
          child: Text('Sets',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: MyAppTheme.whiteColor,
                fontFamily: Fonts.poppins,
              ))),
      leading: IconButton(
        icon:  SvgPicture.asset(
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
      actions: [

      ],
      backgroundColor: MyAppTheme.MainColor,
    );
  }
}
