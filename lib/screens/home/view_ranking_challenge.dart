import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class ViewRankingChallenge extends StatefulWidget {
  String name;
  ViewRankingChallenge({Key? key,required this.name}) : super(key: key);

  @override
  State<ViewRankingChallenge> createState() => _ViewRankingChallengeState();
}

class _ViewRankingChallengeState extends State<ViewRankingChallenge> {
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        color: MyAppTheme.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 80,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: const BoxDecoration(
                              color: MyAppTheme.MainColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: MyAppTheme.colorinactiveThumbColor,
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(index.toString(),style: const TextStyle(fontSize: 18,color: MyAppTheme.whiteColor),),
                                ),
                              ),
                            ),

                          ),
                        ),
                        Expanded(
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Parmod Kumawat',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: MyAppTheme.black_Color,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: const [
                                         Text(
                                           'Record: 1-1',
                                           style: TextStyle(
                                             fontWeight: FontWeight.w400,
                                             fontSize: 16,
                                             color: MyAppTheme.black_Color,
                                             fontFamily: Fonts.nunito,
                                           ),
                                         ),
                                         Text(
                                           'Points: 7.00',
                                           style: TextStyle(
                                             fontWeight: FontWeight.w400,
                                             fontSize: 16,
                                             color: MyAppTheme.black_Color,
                                             fontFamily: Fonts.nunito,
                                           ),
                                         )
                                       ],
                                     ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ViewRankingChallenge(name: 'Under 12',)),
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        margin: const EdgeInsets.only(right: 5.0),
                                        decoration: const BoxDecoration(
                                            color: MyAppTheme.MainColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: const Center(
                                          child: Text(
                                            'challenge',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: MyAppTheme.whiteColor),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
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
      title:  Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Text(widget.name,
              style: const TextStyle(
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
