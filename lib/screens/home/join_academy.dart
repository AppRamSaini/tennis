import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class JoinAcademy extends StatefulWidget {
  const JoinAcademy({Key? key}) : super(key: key);

  @override
  State<JoinAcademy> createState() => _JoinAcademyState();
}

class _JoinAcademyState extends State<JoinAcademy> {
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
                itemCount: 1,
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
                        Text(
                          'Under 12',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                        Container(
                          width: width,
                          color: MyAppTheme.LineColor,
                          height: 1.0,
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.MainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Center(
                                    child: Text(
                                      'Join Academy',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyAppTheme.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.MainColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                  child: Text(
                                    'View Rule',
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
          child: Text('Join Academy',
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
