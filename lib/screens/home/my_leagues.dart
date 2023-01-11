import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/delete_league.dart';
import 'package:tennis/bottomdilog/my_league_request.dart';
import 'package:tennis/helpers/appconfig.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/myleagues_provider.dart';
import 'package:tennis/screens/home/view_ranking_challenge.dart';
import 'package:tennis/screens/my_leagues/add_player.dart';
import 'package:tennis/screens/my_leagues/create_leagues.dart';
import 'package:tennis/screens/my_leagues/edit_league.dart';
import 'package:tennis/screens/my_leagues/leagues_details.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyLeagues extends StatefulWidget {
  const MyLeagues({Key? key}) : super(key: key);

  @override
  State<MyLeagues> createState() => _MyLeaguesState();
}

class _MyLeaguesState extends State<MyLeagues> {
  @override
  void initState() {
    // TODO: implement initState
    locator<MyLeaguesProvider>().leaguesPermissionStatus(context);
    locator<MyLeaguesProvider>().getMyLeaguesPendingRequestList(context);
    locator<MyLeaguesProvider>().getMyLeaguesList(context);
    super.initState();
  }
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    locator<MyLeaguesProvider>().leaguesPermissionStatus(context);
    locator<MyLeaguesProvider>().getMyLeaguesPendingRequestList(context);
    locator<MyLeaguesProvider>().getMyLeaguesList(context);
    return null;
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.MainColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLoading = Provider.of<MyLeaguesProvider>(context).isLoading;
    List leagueslist = Provider.of<MyLeaguesProvider>(context).leagueslist;
    List pendingLeagueslist = Provider.of<MyLeaguesProvider>(context).pendingLeagueslist;
    return  RefreshIndicator(
      key: refreshKey,
      onRefresh: refreshList,
      child: Consumer<MyLeaguesProvider>(
        builder: (context, provider, child) {
          return (isLoading)
              ? Progressbar()
              : Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: MyAppTheme.whiteColor,
            body: Container(
                width: width,
                height: height,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: pendingLeagueslist.length,
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${pendingLeagueslist[index]['league']['name']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: MyAppTheme.TitleBlackColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${pendingLeagueslist[index]['league']['members_count']} Members',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: MyAppTheme.DesBlackColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              MyLeagueRequestBottomDilog(context,'${pendingLeagueslist[index]['league']['name']}','${pendingLeagueslist[index]['uuid']}','accept');
                                            },
                                            child: Container(
                                              height: 50,
                                              margin:
                                              const EdgeInsets.only(right: 5.0),
                                              decoration: BoxDecoration(
                                                  color: MyAppTheme.MainColor,
                                                  border: Border.all(
                                                      color:
                                                      MyAppTheme.MainColor,
                                                      width: 1),
                                                  borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5))),
                                              child: const Center(
                                                child: Text(
                                                  'Accepted',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color:
                                                    MyAppTheme.whiteColor,
                                                    fontFamily: Fonts.nunito,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              MyLeagueRequestBottomDilog(context,'${pendingLeagueslist[index]['league']['name']}','${pendingLeagueslist[index]['uuid']}','reject');
                                            },
                                            child: Container(
                                              height: 50,
                                              margin:
                                              const EdgeInsets.only(left: 5.0),
                                              decoration: BoxDecoration(
                                                  color:
                                                  MyAppTheme.AcceptBgColor,
                                                  border: Border.all(
                                                      color: MyAppTheme
                                                          .AcceptBgColor,
                                                      width: 1),
                                                  borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5))),
                                              child: const Center(
                                                child: Text(
                                                  'Rejected',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color:
                                                    MyAppTheme.whiteColor,
                                                    fontFamily: Fonts.nunito,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      leagueslist.isNotEmpty ||
                          pendingLeagueslist.isNotEmpty ?
                    Expanded(
                        child: ListView.builder(
                            physics:
                            const AlwaysScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: leagueslist.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin:
                                const EdgeInsets.only(top: 10.0),
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyAppTheme
                                            .listBorderColor, //New
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    color: MyAppTheme.whiteColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          '${leagueslist[index]['name']}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: MyAppTheme
                                                .TitleBlackColor,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                        PopupMenuButton(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: Image.asset(
                                                  "assets/images/more.png"),
                                            ),
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                    height: leagueslist[index]['is_admin'] ==
                                                        true
                                                        ? 30
                                                        : 0,
                                                    value: 1,
                                                    child: leagueslist[
                                                    index]
                                                    [
                                                    'is_admin'] ==
                                                        true
                                                        ? InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.push(context, MaterialPageRoute(
                                                            builder: (context) =>   EditLeague(leagueUUID: '${leagueslist[index]['uuid']}',leagueName: '${leagueslist[index]['name']}', leagueType: '${leagueslist[index]['type']}', leagueDesc: '${leagueslist[index]['description']}', leagueSets: leagueslist[index]['sets'], ))).then(
                                                                (value) => {provider.getMyLeaguesList(context)});
                                                      },
                                                      child: Row(
                                                        children: <
                                                            Widget>[
                                                          SvgPicture
                                                              .asset(
                                                            'assets/icons/edit_details.svg',
                                                            allowDrawingOutsideViewBox:
                                                            true,
                                                            height:
                                                            15,
                                                            width:
                                                            15,
                                                          ),
                                                          const Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10),
                                                            child: Text(
                                                                editDetails,
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 13,
                                                                  color: MyAppTheme.black_Color,
                                                                  fontFamily: Fonts.nunito,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                        : SizedBox()),
                                                PopupMenuItem(
                                                    height: leagueslist[index]['is_admin'] ==
                                                        true
                                                        ? 30
                                                        : 0,
                                                    value: 2,
                                                    child: leagueslist[index]['is_admin'] ==
                                                        true
                                                        ? InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.push(context,
                                                          MaterialPageRoute(builder: (context) =>
                                                                  AddPlayer(
                                                                    league_uuid: leagueslist[index]['uuid'],
                                                                    league_name: '${leagueslist[index]['name']}',
                                                                  )),
                                                        );
                                                      },
                                                      child: Row(
                                                        children: <
                                                            Widget>[
                                                          SvgPicture
                                                              .asset(
                                                            'assets/icons/add_player.svg',
                                                            allowDrawingOutsideViewBox:
                                                            true,
                                                            height:
                                                            15,
                                                            width:
                                                            15,
                                                          ),
                                                          const Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10),
                                                            child: Text(
                                                                addPlayer,
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 13,
                                                                  color: MyAppTheme.black_Color,
                                                                  fontFamily: Fonts.nunito,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                        : SizedBox()),
                                                PopupMenuItem(
                                                    height: 30,
                                                    value: 3,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.push(context,
                                                          MaterialPageRoute(builder:
                                                                  (context) =>
                                                               LeaguesDetails(league_name: '${leagueslist[index]['name']}', league_uuid: leagueslist[index]['uuid'], admin_email: '${leagueslist[index]['admin']['email']}', sets: leagueslist[index]['sets'], role: leagueslist[index]['is_admin'],)),
                                                        ).then(
                                                                (value) => {provider.getMyLeaguesList(context)});
                                                      },
                                                      child: Row(
                                                        children: <
                                                            Widget>[
                                                          SvgPicture
                                                              .asset(
                                                            'assets/icons/league_details.svg',
                                                            allowDrawingOutsideViewBox:
                                                            true,
                                                            height: 15,
                                                            width: 15,
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .only(
                                                                left:
                                                                10),
                                                            child: Text(
                                                                leagueDetails,
                                                                style:
                                                                TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  fontSize:
                                                                  13,
                                                                  color:
                                                                  MyAppTheme.black_Color,
                                                                  fontFamily:
                                                                  Fonts.nunito,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                PopupMenuItem(
                                                    height: leagueslist[
                                                    index]
                                                    [
                                                    'is_admin'] ==
                                                        true
                                                        ? 30
                                                        : 0,
                                                    value: 4,
                                                    child: leagueslist[
                                                    index]
                                                    [
                                                    'is_admin'] ==
                                                        true
                                                        ? InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        DeleteLeagueBottomDilog(context,'${leagueslist[index]['uuid']}','${leagueslist[index]['name']}');
                                                      },
                                                      child: Row(
                                                        children: <
                                                            Widget>[
                                                          SvgPicture
                                                              .asset(
                                                            'assets/icons/delete_league.svg',
                                                            allowDrawingOutsideViewBox:
                                                            true,
                                                            height:
                                                            15,
                                                            width:
                                                            15,
                                                          ),
                                                          const Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10),
                                                            child: Text(
                                                                deleteLeague,
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 13,
                                                                  color: MyAppTheme.CategoryBGSelectColor,
                                                                  fontFamily: Fonts.nunito,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                        : SizedBox()),
                                              ];
                                            })
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${leagueslist[index]['members_count']} Members',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: MyAppTheme
                                                .DesBlackColor,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.setNoSets(leagueslist[index]['sets']);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewRankingChallenge(
                                                    name: '${leagueslist[index]['name']}', league_uuid: leagueslist[index]['uuid'],
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        width: width,
                                        margin: const EdgeInsets.only(
                                          right: 5.0,
                                          top: 10.0,
                                        ),
                                        decoration: const BoxDecoration(
                                            color: MyAppTheme.MainColor,
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(
                                                    5))),
                                        child: const Center(
                                          child: Text(
                                            'View Rankings / challenge',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: MyAppTheme
                                                    .whiteColor),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })) :
                           Expanded(child: SvgPicture.asset(
                    'assets/icons/empty_image.svg',
                    allowDrawingOutsideViewBox: true,
                  )),
                    SizedBox(
                      height: provider.userRequest == "null"
                          ? 130
                          : provider.userRole == AppConfig.USERROLE
                          ? 0
                          : 100,
                    )
                  ],
                )),
            floatingActionButton: provider.userRole == AppConfig.USERROLE
                ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  const CreateLeagues()),
                ).then(
                        (value) => {provider.getMyLeaguesList(context)});
              },
              backgroundColor: MyAppTheme.MainColor,
              child: const Icon(Icons.add),
            )
                : const SizedBox(),
            bottomSheet: provider.userRole == AppConfig.USERROLE
                ? const SizedBox()
                : Container(
              width: width,
              height: provider.userRequest == "null" ? 130 : 100,
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ques.svg',
                        allowDrawingOutsideViewBox: true,
                        height: 20,
                        width: 20,
                      ),
                      Expanded(
                          child: Padding(
                              padding:
                              const EdgeInsets.only(left: 5.0),
                              child: provider.userRequest == "null"
                                  ? const Text(
                                  requestForCreateLeagues,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color:
                                    MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ))
                                  : const Text(
                                  requestForSendCreateLeagues,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color:
                                    MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  )))),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (provider.userRequest == "null") {
                        provider.requestLeaguePermission(context);
                      }
                    },
                    child: Container(
                      width: width,
                      height: 50,
                      margin: const EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                          color: provider.userRequest == "null"
                              ? MyAppTheme.MainColor
                              : MyAppTheme.PendingRequestBgColor,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(5))),
                      child: Center(
                        child: provider.userRequest == "null"
                            ? const Text(
                          requestNow,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: MyAppTheme.whiteColor,
                            fontFamily: Fonts.nunito,
                          ),
                        )
                            : const Text(
                          requestPending,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: MyAppTheme.DesBlackColor,
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
        },
      ),
    );

  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(myAcademy,
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
