import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/score_edit_request.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/allmatchs_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class LeagueWishResult extends StatefulWidget {
  String league_name;
  String league_uuid;
  LeagueWishResult({Key? key,required this.league_name,required this.league_uuid}) : super(key: key);

  @override
  State<LeagueWishResult> createState() => _LeagueWishResultState();
}

class _LeagueWishResultState extends State<LeagueWishResult> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    locator<AllMatchsProvider>().getAllMatchWishResultList(context,widget.league_uuid);
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    locator<AllMatchsProvider>().getAllMatchWishResultList(context,widget.league_uuid);
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
    final double itemWidth = size.width / 2;
    final double lineFHeight = (size.height - kToolbarHeight - 24) / 12;
    final double lineSHeight = (size.height - kToolbarHeight - 24) / 6;
    bool isLoading = Provider.of<AllMatchsProvider>(context).isLoading;
    List allMResultlist = Provider.of<AllMatchsProvider>(context).allMResultlist;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child:  Consumer<AllMatchsProvider>(
          builder: (context, provider, child) {
            return (isLoading)
                ? Progressbar()
                : allMResultlist.isNotEmpty ?
            Container(
              width: width,
              height: height,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: allMResultlist.length,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 0.0),
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
                                 Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    Helpers.DateFormatString(DateTime.parse('${allMResultlist[index]['score']['created_at']}')).toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,
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
                                    'Opponent : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    '${allMResultlist[index]['score']['loser']['name']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,
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
                                    'Winner : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/winner_icon.svg',
                                      allowDrawingOutsideViewBox: true,
                                      height: 15,
                                      width: 15,
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        '${allMResultlist[index]['score']['winner']['name']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: MyAppTheme.TitleBlackColor,
                                          fontFamily: Fonts.nunito,
                                        ),
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            width: width,
                            height: allMResultlist[index]['score']['score'].length == 0 || allMResultlist[index]['score']['score'].length == 1 || allMResultlist[index]['score']['score'].length == 2 || allMResultlist[index]['score']['score'].length == 3 ? lineFHeight : lineSHeight,
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
                                allMResultlist[index]['score']['score'].length == 0 ? Text(
                                  Helpers.showMatchStatus('${allMResultlist[index]['score']['status']}'),
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
                                  itemCount: allMResultlist[index]['score']['score'].length,
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
                                                      text: '${allMResultlist[index]['score']['score'][index1]['winner']}',
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
                                                        '${allMResultlist[index]['score']['score'][index1]['tie_winner']}',
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
                                                      text: '${allMResultlist[index]['score']['score'][index1]['loser']}',
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
                                                        '${allMResultlist[index]['score']['score'][index1]['tie_loser']}',
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
      title:  Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(widget.league_name,
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
