import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/home/my_result.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class AllMatches extends StatefulWidget {
  const AllMatches({Key? key}) : super(key: key);

  @override
  State<AllMatches> createState() => _AllMatchesState();
}

class _AllMatchesState extends State<AllMatches> {
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
                itemCount: 8,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text(
                      'Under 12',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  color: MyAppTheme.LineColor,
                                  shape: BoxShape.circle
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                              child: SvgPicture.asset(
                                'assets/icons/forword_arrow.svg',
                                allowDrawingOutsideViewBox: true,
                                height: 15,
                                width: 15,
                                color: MyAppTheme.DesBlackColor,
                              ),
                            )
                          ],
                        ),

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
          child: Text(allMatch,
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
