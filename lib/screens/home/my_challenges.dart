import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/score_card/add_score.dart';
import 'package:tennis/screens/score_card/winner.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyChallenges extends StatefulWidget {
  const MyChallenges({Key? key}) : super(key: key);

  @override
  State<MyChallenges> createState() => _MyChallengesState();
}

class _MyChallengesState extends State<MyChallenges> {
  List<Map<String, String>> splashData = [
    {
      "title": "U-19 Jaipur Open 2022",
      "oppoent": "John Browne",
      "status": "Pending",
      "date": "22-Nov-2022",
      "address": "Pink city Tennis Court, C-Scheme, Jaipur",
    },
    {
      "title": "U-19 Jaipur Open 2022",
      "oppoent": "John Browne",
      "status": "Accepted",
      "date": "22-Nov-2022",
      "address": "Pink city Tennis Court, C-Scheme, Jaipur",
    },
    {
      "title": "U-19 Jaipur Open 2022",
      "oppoent": "John Browne",
      "status": "Denied",
      "date": "22-Nov-2022",
      "address": "Pink city Tennis Court, C-Scheme, Jaipur",
    },
  ];
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
                itemCount: splashData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: MyAppTheme.listBorderColor, //New
                            blurRadius: 5.0,
                          )
                        ],
                        color: MyAppTheme.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                      '${splashData[index]['title']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyAppTheme.TitleBlackColor,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Container(
                                width : 100,
                                child: const Text(
                                  'Opponent : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                              Text(
                                '${splashData[index]['oppoent']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: MyAppTheme.TitleBlackColor,
                                  fontFamily: Fonts.nunito,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Container(
                                width : 100,
                                child: const Text(
                                  'Status : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                              splashData[index]['status'] == "Pending" ?
                              Container(
                                height: 30,
                                width: 100,
                                decoration:  BoxDecoration(
                                    color: MyAppTheme.PendingLightColor,
                                    border: Border.all(
                                      color: MyAppTheme.PendingDarkColor,
                                          width : 1
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'Pending',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              ) : splashData[index]['status'] == "Accepted" ? Container(
                                height: 30,
                                width: 100,
                                decoration:  BoxDecoration(
                                    color: MyAppTheme.AcceptLightColor,
                                    border: Border.all(
                                        color: MyAppTheme.AcceptDarkColor,
                                        width : 1
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'Accepted',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              ) : Container(
                                height: 30,
                                width: 100,
                                decoration:  BoxDecoration(
                                    color: MyAppTheme.DeniedLightColor,
                                    border: Border.all(
                                        color: MyAppTheme.DeniedDarkColor,
                                        width : 1
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'Denied',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Container(
                                width : 100,
                                child: const Text(
                                  'Match Date : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                              Text(
                                '${splashData[index]['date']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: MyAppTheme.TitleBlackColor,
                                  fontFamily: Fonts.nunito,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Container(
                                width : 100,
                                child: const Text(
                                  'Court Address : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                              Expanded(child: Text(
                                '${splashData[index]['address']}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: MyAppTheme.TitleBlackColor,
                                  fontFamily: Fonts.nunito,
                                ),
                              ))

                            ],
                          ),
                        ),
                        splashData[index]['status'] == "Pending" ?
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddScore()),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.AcceptBgColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Center(
                                    child: Text(
                                      'Accept',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: MyAppTheme.whiteColor,
                                        fontFamily: Fonts.nunito,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.DeniedBgColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'Deny',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ) : splashData[index]['status'] == "Accepted" ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddScore()),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.ScoreBgColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Center(
                                    child: Text(
                                      'Report score',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: MyAppTheme.whiteColor,
                                        fontFamily: Fonts.nunito,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.DeniedBgColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'Withdraw',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ) : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddScore()),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.AcceptBgColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Center(
                                    child: Text(
                                      'Accept',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: MyAppTheme.whiteColor,
                                        fontFamily: Fonts.nunito,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.DeniedBgColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'Deny',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              ),
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
          child: Text('My Challenge',
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
