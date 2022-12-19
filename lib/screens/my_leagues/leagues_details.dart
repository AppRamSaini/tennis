import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class LeaguesDetails extends StatefulWidget {
  const LeaguesDetails({Key? key}) : super(key: key);

  @override
  State<LeaguesDetails> createState() => _LeaguesDetailsState();
}

class _LeaguesDetailsState extends State<LeaguesDetails> {
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
          padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'U-19 Jaipur Open 2022',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: MyAppTheme.TitleBlackColor,
                    fontFamily: Fonts.nunito,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Admin Email :',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: MyAppTheme.DesBlackColor,
                      fontFamily: Fonts.nunito,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'tennis555@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: MyAppTheme.MainColor,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  )
                ],
              ),),
              InkWell(
                onTap: (){
                },
                child: Container(
                  height: 50,
                  width: width,
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration:   BoxDecoration(
                      border: Border.all(
                          color: MyAppTheme.DesBlackColor,
                          width: 0.5
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5))
                  ),
                  child:   const Center(
                    child: Text(
                      'View Ranking/Challenge',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyAppTheme.DesBlackColor,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                },
                child: Container(
                  height: 50,
                  width: width,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration:  const BoxDecoration(
                      color: MyAppTheme.EditBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child:  const Center(
                    child: Text(
                      viewRules,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyAppTheme.TitleBlackColor,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                },
                child: Container(
                  height: 50,
                  width: width,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration:  const BoxDecoration(
                      color: MyAppTheme.CategoryBGSelectColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child:  const Center(
                    child: Text(
                      'Leave league',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyAppTheme.whiteColor,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                ),
              ),
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
          child: Text('Leagues Details',
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
