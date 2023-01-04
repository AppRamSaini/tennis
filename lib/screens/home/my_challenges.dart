import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/my_challenge_request.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/mychallenge_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/score_card/add_score.dart';

import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyChallenges extends StatefulWidget {
  const MyChallenges({Key? key}) : super(key: key);

  @override
  State<MyChallenges> createState() => _MyChallengesState();
}

class _MyChallengesState extends State<MyChallenges> {

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    locator<MychallengeProvider>().challengePlayerList(context);
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    locator<MychallengeProvider>().challengePlayerList(context);
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
    bool isLoading = Provider.of<MychallengeProvider>(context).isLoading;
    List playerlist = Provider.of<MychallengeProvider>(context).playerlist;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Consumer<MychallengeProvider>(
        builder: (context, provider, child) {
          return (isLoading)
              ? Progressbar()
              : RefreshIndicator(
                  key: refreshKey,
                  onRefresh: refreshList,
                  child: playerlist.isNotEmpty
                      ? Container(
                          width: width,
                          height: height,
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: playerlist.length,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${playerlist[index]['league']['name']}',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 100,
                                              child: const Text(
                                                'Opponent : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color:
                                                      MyAppTheme.DesBlackColor,
                                                  fontFamily: Fonts.nunito,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${playerlist[index]['opponent']['name']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color:
                                                    MyAppTheme.TitleBlackColor,
                                                fontFamily: Fonts.nunito,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 100,
                                              child: const Text(
                                                'Status : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color:
                                                      MyAppTheme.DesBlackColor,
                                                  fontFamily: Fonts.nunito,
                                                ),
                                              ),
                                            ),
                                            playerlist[index]
                                                        ['challenge_status'] ==
                                                    "pending"
                                                ? Container(
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: MyAppTheme
                                                            .PendingLightColor,
                                                        border: Border.all(
                                                            color: MyAppTheme
                                                                .PendingDarkColor,
                                                            width: 1),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: const Center(
                                                      child: Text(
                                                        'Pending',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                          color: MyAppTheme
                                                              .TitleBlackColor,
                                                          fontFamily:
                                                              Fonts.nunito,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : playerlist[index]['challenge_status'] == "accepted"
                                                    ? Container(
                                                        height: 30,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color: MyAppTheme
                                                                .AcceptLightColor,
                                                            border: Border.all(
                                                                color: MyAppTheme
                                                                    .AcceptDarkColor,
                                                                width: 1),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5))),
                                                        child: const Center(
                                                          child: Text(
                                                            'Accepted',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12,
                                                              color: MyAppTheme
                                                                  .TitleBlackColor,
                                                              fontFamily:
                                                                  Fonts.nunito,
                                                            ),
                                                          ),
                                                        ),
                                                      ) : playerlist[index]['challenge_status'] == "done"
                                                ? Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: MyAppTheme
                                                      .DeniedLightColor,
                                                  border: Border.all(
                                                      color: MyAppTheme
                                                          .DeniedDarkColor,
                                                      width: 1),
                                                  borderRadius:
                                                  const BorderRadius
                                                      .all(
                                                      Radius
                                                          .circular(
                                                          5))),
                                              child: const Center(
                                                child: Text(
                                                  'Done',
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    fontSize: 12,
                                                    color: MyAppTheme
                                                        .TitleBlackColor,
                                                    fontFamily:
                                                    Fonts.nunito,
                                                  ),
                                                ),
                                              ),
                                            )
                                                    : Container(
                                                        height: 30,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color: MyAppTheme
                                                                .DeniedLightColor,
                                                            border: Border.all(
                                                                color: MyAppTheme
                                                                    .DeniedDarkColor,
                                                                width: 1),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5))),
                                                        child: const Center(
                                                          child: Text(
                                                            'Denied',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12,
                                                              color: MyAppTheme
                                                                  .TitleBlackColor,
                                                              fontFamily:
                                                                  Fonts.nunito,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                          ],
                                        ),
                                      ),
                                      /*   Padding(
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
                                const Text(
                                  'null',
                                  style: TextStyle(
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
                                const Expanded(child: Text(
                                  'null',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyAppTheme.TitleBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ))

                              ],
                            ),
                          ),*/
                                      playerlist[index]['challenge_status'] == "pending" &&
                                              playerlist[index]['sender'] ==
                                                  true
                                          ? InkWell(
                                              onTap: () {
                                                provider.myChallengeWithdraw(
                                                    context,
                                                    playerlist[index]['uuid']
                                                        .toString());
                                              },
                                              child: Container(
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                    color: MyAppTheme
                                                        .DeniedBgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: const Center(
                                                  child: Text(
                                                    'Withdraw',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                      color: MyAppTheme
                                                          .TitleBlackColor,
                                                      fontFamily: Fonts.nunito,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : playerlist[index]['challenge_status'] == "pending" &&
                                                  playerlist[index]['sender'] ==
                                                      false
                                              ? Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          MyChallengeRequestBottomDilog(context,'${playerlist[index]['league']['name']}','${playerlist[index]['uuid']}','accept');
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 5.0),
                                                          decoration: const BoxDecoration(
                                                              color: MyAppTheme
                                                                  .AcceptBgColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                          child: const Center(
                                                            child: Text(
                                                              'Accept',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 12,
                                                                color: MyAppTheme
                                                                    .whiteColor,
                                                                fontFamily:
                                                                    Fonts
                                                                        .nunito,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          MyChallengeRequestBottomDilog(context,'${playerlist[index]['league']['name']}','${playerlist[index]['uuid']}','reject');
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5.0),
                                                          decoration: const BoxDecoration(
                                                              color: MyAppTheme
                                                                  .DeniedBgColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                          child: const Center(
                                                            child: Text(
                                                              'Deny',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 12,
                                                                color: MyAppTheme
                                                                    .TitleBlackColor,
                                                                fontFamily:
                                                                    Fonts
                                                                        .nunito,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : playerlist[index]['challenge_status'] == "rejected"
                                                  ? SizedBox()
                                                  : playerlist[index]['challenge_status'] == "done"  ? SizedBox() :  InkWell(
                                                      onTap: () {
                                                      provider.addScoreWithData(context, playerlist[index]['uuid'].toString(), playerlist[index]['challenger']['name'].toString(), playerlist[index]['challenger']['uuid'].toString(), playerlist[index]['accepter']['name'].toString(),playerlist[index]['accepter']['uuid'].toString(),playerlist[index]['league']['sets']);
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        margin: const EdgeInsets
                                                            .only(right: 5.0),
                                                        decoration: const BoxDecoration(
                                                            color: MyAppTheme
                                                                .ScoreBgColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        child: const Center(
                                                          child: Text(
                                                            'Add Score',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 12,
                                                              color: MyAppTheme
                                                                  .whiteColor,
                                                              fontFamily:
                                                                  Fonts.nunito,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                    ],
                                  ),
                                );
                              }),
                        )
                      : Container(
                          width: width,
                          height: height,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/empty_image.svg',
                              allowDrawingOutsideViewBox: true,
                            ),
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
          child: Text(myChallenge,
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
