import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/home/view_ranking_challenge.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyAcademy extends StatefulWidget {
  const MyAcademy({Key? key}) : super(key: key);

  @override
  State<MyAcademy> createState() => _MyAcademyState();
}

class _MyAcademyState extends State<MyAcademy> {
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
      backgroundColor: MyAppTheme.LineColor,
      body: Consumer<ScoreCardProvider>(
        builder: (context, provider, child) {
          return Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        color: MyAppTheme.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text(
                              'Under 12',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                            PopupMenuButton(
                                child: SizedBox(width: 20,height: 20,
                                  child:  Image.asset("assets/images/more.png"),),
                                itemBuilder: (context){
                                  return [
                                    PopupMenuItem(
                                        height: 30,
                                        value: 1,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.pop(context);

                                          },
                                          child: Row(
                                            children: const <Widget>[
                                             // Image.asset(MyImages.ic_edit_img ,width: 15,height: 15,),
                                              Padding(padding: EdgeInsets.only(left: 10),
                                                child: Text('View Rules',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 13,
                                                      color: MyAppTheme.black_Color,
                                                      fontFamily: Fonts.nunito,
                                                    )),)
                                            ],
                                          ),
                                        )
                                    ),
                                    PopupMenuItem(
                                        height: 30,
                                        value: 2,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            children: const <
                                                Widget>[
                                            //  Image.asset(MyImages.ic_delete_img,width: 15,height: 15,),
                                              Padding(padding: EdgeInsets.only(left: 10),
                                                child: Text("Drop From Academy",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 13,
                                                      color: MyAppTheme.black_Color,
                                                      fontFamily: Fonts.nunito,
                                                    )),)
                                            ],
                                          ),
                                        )
                                    ),

                                  ];
                                })
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Players :',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                            Text(
                              ' 5',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: MyAppTheme.DesBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: width,
                          color: MyAppTheme.LineColor,
                          height: 1.0,
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewRankingChallenge(name: 'Under 12',)),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: width,
                            margin: const EdgeInsets.only(right: 5.0),
                            decoration: const BoxDecoration(
                                color: MyAppTheme.MainColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5))),
                            child: const Center(
                              child: Text(
                                'View Rankings / challenge',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyAppTheme.whiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text('My Academy',
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
