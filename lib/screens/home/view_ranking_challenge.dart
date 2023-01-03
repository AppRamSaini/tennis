import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/my_league_challenge_request.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/ranking_challenge_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/score_card/add_score.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class ViewRankingChallenge extends StatefulWidget {
  String name;
  String league_uuid;
  ViewRankingChallenge({Key? key,required this.name,required this.league_uuid}) : super(key: key);

  @override
  State<ViewRankingChallenge> createState() => _ViewRankingChallengeState();
}

class _ViewRankingChallengeState extends State<ViewRankingChallenge> {
  String? user_uuid;
  List<Map<String, String>> splashData = [
    {
      "title": "Olivia White",
      "status": "Challenge",
    },
    {
      "title": "Olivia White",
      "status": "Score",
    },
    {
      "title": "Olivia White",
      "status": "Withdraw",
    },
    {
      "title": "Olivia White",
      "status": "Self",
    },
  ];
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    SharedPref.getProfileImage("user_uuid").then((value) => setState(() {
      user_uuid = value;
      print(user_uuid);
    }));
    locator<RankingChallengeProvider>().leaguesPlayerList(context,widget.league_uuid);
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
    bool isLoading = Provider.of<RankingChallengeProvider>(context).isLoading;
    List playerlist = Provider.of<RankingChallengeProvider>(context).playerlist;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Consumer<RankingChallengeProvider>(
        builder: (context, provider, child) {
          return (isLoading)
              ? Progressbar()
              :
            RefreshIndicator(
            key: refreshKey,
            onRefresh: refreshList,
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: playerlist.isNotEmpty ?
              ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: playerlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    int ind = 1 + index;
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 75,
                                      height: 75,
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration:  BoxDecoration(
                                          color: ind == 1 ? MyAppTheme.PosFLColor : ind == 2 ? MyAppTheme.PosSLColor : ind == 3 ? MyAppTheme.PosTLColor : MyAppTheme.PosFourthLColor,
                                          borderRadius: BorderRadius.all(Radius.circular(10))),
                                      child: Center(
                                        child: Container(
                                          height: 65,
                                          width: 65,
                                          decoration: const BoxDecoration(
                                              color: MyAppTheme.whiteColor,
                                              shape: BoxShape.circle
                                          ),
                                          child: Container(
                                            height: 55,
                                            width: 55,
                                            decoration:  BoxDecoration(
                                                color: ind == 1 ? MyAppTheme.PosFMColor : ind == 2 ? MyAppTheme.PosSMColor : ind == 3 ? MyAppTheme.PosTMColor : MyAppTheme.PosFourthMColor,
                                                shape: BoxShape.circle
                                            ),
                                            child: Center(
                                              child:
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: ind == 1 ? MyAppTheme.PosFDColor : ind == 2 ? MyAppTheme.PosSDColor : ind == 3 ? MyAppTheme.PosTDColor : MyAppTheme.PosFourthDColor,
                                                    shape: BoxShape.circle
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("$ind",style: const TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 25,
                                                      color: MyAppTheme.whiteColor,
                                                      fontFamily: Fonts.nunito,),),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        ,

                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: width * 0.35,
                                          child: Text(
                                            '${playerlist[index]['name']}',
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: MyAppTheme.TitleBlackColor,
                                              fontFamily: Fonts.nunito,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children:  [
                                              const Text(
                                                'Record:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: MyAppTheme.DesBlackColor,
                                                  fontFamily: Fonts.nunito,
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: 50,
                                                margin: EdgeInsets.only(left: 5.0),
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
                                                    '',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color: MyAppTheme.TitleBlackColor,
                                                      fontFamily: Fonts.nunito,
                                                    ),
                                                  ),
                                                ),
                                              )

                                            ],
                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                                playerlist[index]['uuid'] == user_uuid ?  SizedBox() : playerlist[index]['can_challenge'] == true && playerlist[index]['challenge'] == null ? InkWell(
                                  onTap: () {
                                   MyLeagueChallengeRequestBottomDilog(context, widget.league_uuid, playerlist[index]['uuid'].toString(),'${playerlist[index]['name']}');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.AcceptBgColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        'Challenge',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: MyAppTheme.whiteColor,
                                          fontFamily: Fonts.nunito,),
                                      ),
                                    ),
                                  ),
                                ) : playerlist[index]['can_challenge'] == false && playerlist[index]['challenge'] == null ? InkWell(
                                  onTap: () {
                                   // provider.leaguesPlayerChallenge(context, widget.league_uuid, playerlist[index]['uuid'].toString());
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.CategoryBGUNSelectBorderColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        'Challenge',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: MyAppTheme.whiteColor,
                                          fontFamily: Fonts.nunito,),
                                      ),
                                    ),
                                  ),
                                ) : playerlist[index]['can_challenge'] == false && playerlist[index]['challenge']['challenge_status'] == "accepted" ? InkWell(
                                  onTap: () {
                                   provider.addScoreWithData(context, playerlist[index]['challenge']['uuid'].toString(), playerlist[index]['challenge']['challenger']['name'].toString(), playerlist[index]['challenge']['challenger']['uuid'].toString(), playerlist[index]['challenge']['accepter']['name'].toString(), playerlist[index]['challenge']['accepter']['uuid'].toString());
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
                                        'Add Score',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: MyAppTheme.whiteColor,
                                          fontFamily: Fonts.nunito,),
                                      ),
                                    ),
                                  ),
                                ) : InkWell(
                                  onTap: () {
                                    provider.leaguesChallengeWithdraw(context, widget.league_uuid, playerlist[index]['challenge']['uuid'].toString());
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.PosFourthDColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        'Withdraw',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: MyAppTheme.whiteColor,
                                          fontFamily: Fonts.nunito,),
                                      ),
                                    ),
                                  ),
                                )
                               /* Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    splashData[index]['status'] == "Challenge" ?
                                    InkWell(
                                      onTap: () {

                                      },
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        margin: const EdgeInsets.only(right: 5.0),
                                        decoration: const BoxDecoration(
                                            color: MyAppTheme.AcceptBgColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: const Center(
                                          child: Text(
                                            'Challenge',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: MyAppTheme.whiteColor,
                                              fontFamily: Fonts.nunito,),
                                          ),
                                        ),
                                      ),
                                    ) : splashData[index]['status'] == "Withdraw" ? InkWell(
                                      onTap: () {

                                      },
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        margin: const EdgeInsets.only(right: 5.0),
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
                                              color: MyAppTheme.whiteColor,
                                              fontFamily: Fonts.nunito,),
                                          ),
                                        ),
                                      ),
                                    ) : splashData[index]['status'] == "Score" ? InkWell(
                                      onTap: () {

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
                                            'Score',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: MyAppTheme.whiteColor,
                                              fontFamily: Fonts.nunito,),
                                          ),
                                        ),
                                      ),
                                    ) : SizedBox()
                                  ],
                                )*/
                              ],
                            ),
                            Container(
                              width: width,
                              height: 1,
                              color: MyAppTheme.LineColor,
                              margin: EdgeInsets.only(top: 10.0),
                            )
                          ],
                        )

                    );
                  }) :SvgPicture.asset(
                'assets/icons/empty_image.svg',
                allowDrawingOutsideViewBox: true,
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
