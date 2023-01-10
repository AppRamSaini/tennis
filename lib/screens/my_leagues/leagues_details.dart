import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/leave_league.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/myleagues_provider.dart';
import 'package:tennis/screens/home/view_ranking_challenge.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class LeaguesDetails extends StatefulWidget {
  String league_name;
  String league_uuid;
  String admin_email;
  int sets;
  String role;
  LeaguesDetails({Key? key,required this.league_name,required this.league_uuid,required this.admin_email,required this.sets,required this.role}) : super(key: key);

  @override
  State<LeaguesDetails> createState() => _LeaguesDetailsState();
}

class _LeaguesDetailsState extends State<LeaguesDetails> {

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
      body: Consumer<MyLeaguesProvider>(
        builder: (context, provider, child) {
          return Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    widget.league_name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: MyAppTheme.TitleBlackColor,
                      fontFamily: Fonts.nunito,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      const Text(
                        'Admin Email :',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          widget.admin_email,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: MyAppTheme.MainColor,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                      )
                    ],
                  ),),
                InkWell(
                  onTap: (){
                    provider.setNoSets(widget.sets);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewRankingChallenge(
                                name: widget.league_name, league_uuid: widget.league_uuid,
                              )),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: width,
                    margin: const EdgeInsets.only(top: 15.0),
                    decoration:   BoxDecoration(
                        border: Border.all(
                            color: MyAppTheme.DesBlackColor,
                            width: 0.5
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child:   const Center(
                      child: Text(
                        'View Ranking/Challenge',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ),
                    ),
                  ),
                ),
               /* InkWell(
                  onTap: (){
                  },
                  child: Container(
                    height: 50,
                    width: width,
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration:  const BoxDecoration(
                        color: MyAppTheme.EditBgColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child:  const Center(
                      child: Text(
                        viewRules,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: MyAppTheme.TitleBlackColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ),
                    ),
                  ),
                ),*/
                widget.role != 'admin' ?
                InkWell(
                  onTap: (){
                    LeaveLeagueBottomDilog(context,widget.league_uuid,widget.league_name);
                  },
                  child: Container(
                    height: 50,
                    width: width,
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration:  const BoxDecoration(
                        color: MyAppTheme.CategoryBGSelectColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child:  const Center(
                      child: Text(
                        'Leave league',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: MyAppTheme.whiteColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ),
                    ),
                  ),
                ) : const SizedBox(),
              ],
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
          child: Text('Leagues Details',
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
