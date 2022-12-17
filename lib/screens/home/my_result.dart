import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyResult extends StatefulWidget {
  const MyResult({Key? key}) : super(key: key);

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
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
        builder: (context, provider, child) {
          return Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: 3,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Academy Name :',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                            Text(
                              ' Under 14',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: MyAppTheme.DesBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Match Date :',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: MyAppTheme.black_Color,
                                  fontFamily: Fonts.nunito,
                                ),
                              ),
                              Text(
                                ' 08/12/2022',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: MyAppTheme.DesBlackColor,
                                  fontFamily: Fonts.nunito,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          color: MyAppTheme.LineColor,
                          height: 1.0,
                          margin: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Text(
                                      'Ram',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    'Raju',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: MyAppTheme.MainColor,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: MyAppTheme.black_Color,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )

                          ],
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
          child: Text('My Result',
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
