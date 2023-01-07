import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/score_edit_request.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
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
  String? user_uuid;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    locator<MyResultProvider>().getResultList(context);
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    locator<MyResultProvider>().getResultList(context);
    SharedPref.getProfileImage("user_uuid").then((value) => setState(() {
      user_uuid = value;
      print(user_uuid);
    }));
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
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double lineFHeight = (size.height - kToolbarHeight - 24) / 12;
    final double lineSHeight = (size.height - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 2;
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
                : resultlist.isNotEmpty ?
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    height: 30,
                                    width: 55,
                                    decoration:  BoxDecoration(
                                        color: user_uuid == '${resultlist[index]['score']['winner']['uuid']}' ? MyAppTheme.MainColor : MyAppTheme.AcceptBgColor,
                                        border: Border.all(
                                            color: user_uuid == '${resultlist[index]['score']['winner']['uuid']}' ? MyAppTheme.MainColor : MyAppTheme.AcceptBgColor,
                                            width : 1
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child:   Center(
                                      child: user_uuid == '${resultlist[index]['score']['winner']['uuid']}' ? const Text(
                                        'Won',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: MyAppTheme.whiteColor,
                                          fontFamily: Fonts.nunito,),
                                      ) : const Text(
                                        'Lose',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: MyAppTheme.whiteColor,
                                          fontFamily: Fonts.nunito,),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      ScoreEditRequestBottomDilog(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/edit.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 12,
                                        width: 12,
                                        color: MyAppTheme.black_Color,
                                      ),
                                    ),
                                  )
                                  ,
                                ],
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
                            width: width,
                            height: resultlist[index]['score']['score'].length == 0 || resultlist[index]['score']['score'].length == 1 || resultlist[index]['score']['score'].length == 2 || resultlist[index]['score']['score'].length == 3 ? lineFHeight : lineSHeight,
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
                                resultlist[index]['score']['score'].length == 0 ? Text( Helpers.showMatchStatus('${resultlist[index]['score']['status']}')
                                  ,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyAppTheme.TitleBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ):
                                Expanded(child: GridView.builder(
                                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    childAspectRatio: (itemWidth / itemHeight),
                                  ),
                                  itemCount: resultlist[index]['score']['score'].length,
                                  itemBuilder: (BuildContext context, int index1) {
                                    return Container(
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
                                                  TextSpan(
                                                      text: '${resultlist[index]['score']['score'][index1]['winner']}',
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12,
                                                        color: MyAppTheme.TitleBlackColor,
                                                        fontFamily: Fonts.nunito,
                                                      )),
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(2, -6),
                                                      child:  Text(
                                                        '${resultlist[index]['score']['score'][index1]['tie_winner']}',
                                                        //superscript is usually smaller in size
                                                        textScaleFactor: 0.7,
                                                        style: const TextStyle(
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
                                                  TextSpan(
                                                      text: '${resultlist[index]['score']['score'][index1]['loser']}',
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12,
                                                        color: MyAppTheme.TitleBlackColor,
                                                        fontFamily: Fonts.nunito,
                                                      )),
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(2, -6),
                                                      child:  Text(
                                                        '${resultlist[index]['score']['score'][index1]['tie_loser']}',
                                                        //superscript is usually smaller in size
                                                        textScaleFactor: 0.7,
                                                        style: const TextStyle(
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
                                    )
                                      ;
                                  },
                                )
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ) : Container(
              width: width,
              height: height,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/empty_image.svg',
                  allowDrawingOutsideViewBox: true,
                ),
              ),
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
