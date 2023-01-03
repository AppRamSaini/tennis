import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/myresult_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyResult extends StatefulWidget {
  const MyResult({Key? key}) : super(key: key);

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  List<Map<String, String>> splashData = [
    {
      "title": "U-19 Jaipur Open 2022",
      "oppoent": "John Browne",
      "status": "Won",
      "date": "22-Nov-2022",
    },
    {
      "title": "U-19 Jaipur Open 2022",
      "oppoent": "John Browne",
      "status": "Lose",
      "date": "22-Nov-2022",
    },
    {
      "title": "U-19 Jaipur Open 2022",
      "oppoent": "John Browne",
      "status": "Won",
      "date": "22-Nov-2022",
    },
  ];
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    locator<MyResultProvider>().getResultList(context);
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    locator<MyResultProvider>().getResultList(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.MainColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLoading = Provider.of<MyResultProvider>(context).isLoading;
    List resultlist = Provider.of<MyResultProvider>(context).resultlist;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child:  Consumer<MyResultProvider>(
          builder: (context, provider, child) {
            return (isLoading)
                ? Progressbar()
                :
            Container(
              width: width,
              height: height,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: resultlist.length,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${resultlist[index]['league']['name']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: MyAppTheme.TitleBlackColor,
                                  fontFamily: Fonts.nunito,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 55,
                                decoration:  BoxDecoration(
                                    color: splashData[index]['status'] == "Won" ? MyAppTheme.MainColor : MyAppTheme.AcceptBgColor,
                                    border: Border.all(
                                        color: splashData[index]['status'] == "Won" ? MyAppTheme.MainColor : MyAppTheme.AcceptBgColor,
                                        width : 1
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child:  Center(
                                  child: Text(
                                    '${splashData[index]['status']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: MyAppTheme.whiteColor,
                                      fontFamily: Fonts.nunito,),
                                  ),
                                ),
                              )
                            ],
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
                                  '${resultlist[index]['accepter']['name']}',
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
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            height: 50,
                            width: width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                Container(
                                  width : 100,
                                  child: const Text(
                                    'Result : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                ),
                                Expanded(child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: '${resultlist[index]['score']['score']}'.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: 25,
                                        width: 60,
                                        margin: const EdgeInsets.all(5),
                                        decoration:  BoxDecoration(
                                            color: MyAppTheme.AcceptLightColor,
                                            border: Border.all(
                                                color: MyAppTheme.AcceptDarkColor,
                                                width : 1
                                            ),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(5))),
                                        child:  Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              RichText(
                                                text: TextSpan(children: [
                                                  const TextSpan(
                                                      text: '9',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12,
                                                        color: MyAppTheme.TitleBlackColor,
                                                        fontFamily: Fonts.nunito,
                                                      )),
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(2, -6),
                                                      child: const Text(
                                                        '2',
                                                        //superscript is usually smaller in size
                                                        textScaleFactor: 0.7,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12,
                                                          color: MyAppTheme.TitleBlackColor,
                                                          fontFamily: Fonts.nunito,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                              const Text(" - ",style: TextStyle( color: MyAppTheme.DesBlackColor,),),
                                              RichText(
                                                text: TextSpan(children: [
                                                  const TextSpan(
                                                      text: '9',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12,
                                                        color: MyAppTheme.TitleBlackColor,
                                                        fontFamily: Fonts.nunito,
                                                      )),
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(2, -6),
                                                      child: const Text(
                                                        '2',
                                                        //superscript is usually smaller in size
                                                        textScaleFactor: 0.7,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12,
                                                          color: MyAppTheme.TitleBlackColor,
                                                          fontFamily: Fonts.nunito,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ],
                                          )

                                        ),
                                      );
                                    }))
                                ,

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(myResult,
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
