import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/bottomdilog/logout.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/screens/home/all_matches.dart';
import 'package:tennis/screens/home/my_challenges.dart';
import 'package:tennis/screens/home/my_leagues.dart';
import 'package:tennis/screens/home/my_result.dart';
import 'package:tennis/screens/score_card/score_can_report.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:tennis/upcoming_tournament/upcoming_tournament.dart';

class DrawerBar extends StatefulWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  String? user_profile;
  String? user_name;
  String? user_email;
  String? user_role;
  void getUserData(){
    SharedPref.getProfileImage("user_profile").then((value) => setState(() {
      user_profile = value;
      print(user_profile);
    }));
    SharedPref.getUserName("user_name").then((value) => setState(() {
      user_name = value;
    }));
    SharedPref.getUserEmail("user_email").then((value) => setState(() {
      user_email = value;
    }));
    SharedPref.getLoginType("user_type").then((value) => setState(() {
      user_role = value;
    }));
  }
  @override
  initState() {
    getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: MyAppTheme.MainColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  user_profile != "" && user_profile != null ?
                  Container(
                      width: 70,
                      height: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Center(
                            child: FadeInImage(
                              image: NetworkImage(user_profile!),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              placeholder: const AssetImage("assets/images/image_defult.png"),
                              imageErrorBuilder: (context,
                                  error, stackTrace) {
                                return Image.asset(
                                  "assets/images/image_defult.png",
                                );
                              },
                            )),
                      )) : Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/image_defult.png"),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  user_name != null ?
                  Text(
                    user_name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: MyAppTheme.whiteColor,
                      fontFamily: Fonts.nunito,
                    ),
                  ):const SizedBox(),
                  user_email != null ?
                  Text(
                    user_email!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: MyAppTheme.whiteColor,
                      fontFamily: Fonts.nunito,
                    ),
                  ):const SizedBox(),
                ],
              )
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(myAcademy,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLeagues()),
                  );
                },
                trailing: SizedBox(
                  width: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                   /*   Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: MyAppTheme.LineColor,
                            shape: BoxShape.circle
                        ),
                        child:  const Center(
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              '21',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                          ),
                        ),
                      ),*/
                      SvgPicture.asset(
                        'assets/icons/forword_arrow.svg',
                        allowDrawingOutsideViewBox: true,
                        height: 15,
                        width: 15,
                        color: MyAppTheme.iconsBGColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(myChallenge,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyChallenges()),
                  );
                },
                trailing: SizedBox(
                  width: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     /* Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: MyAppTheme.LineColor,
                            shape: BoxShape.circle
                        ),
                        child:  const Center(
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              '21',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                          ),
                        ),
                      ),*/
                      SvgPicture.asset(
                        'assets/icons/forword_arrow.svg',
                        allowDrawingOutsideViewBox: true,
                        height: 15,
                        width: 15,
                        color: MyAppTheme.iconsBGColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(myResult,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyResult()),
                  );
                },
                trailing: SvgPicture.asset(
                  'assets/icons/forword_arrow.svg',
                  allowDrawingOutsideViewBox: true,
                  height: 15,
                  width: 15,
                  color: MyAppTheme.iconsBGColor,
                ),
              ),
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(allMatch,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllMatches()),
                  );
                },
                trailing: SvgPicture.asset(
                  'assets/icons/forword_arrow.svg',
                  allowDrawingOutsideViewBox: true,
                  height: 15,
                  width: 15,
                  color: MyAppTheme.iconsBGColor,
                ),
              ),
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(upcomingTournament,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpcomingTournament()),
                  );
                },
                trailing:  SvgPicture.asset(
                  'assets/icons/forword_arrow.svg',
                  allowDrawingOutsideViewBox: true,
                  height: 15,
                  width: 15,
                  color: MyAppTheme.iconsBGColor,
                ),
              ),
            ),
            user_role == 'admin' ?
            Container(
              height: 45,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text(canReport,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScoreCanReport()),
                  );*/
                },
                trailing:  SizedBox(
                  width: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                   /*   Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: MyAppTheme.LineColor,
                            shape: BoxShape.circle
                        ),
                        child:  const Center(
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              '21',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                          ),
                        ),
                      ),*/
                      SvgPicture.asset(
                        'assets/icons/forword_arrow.svg',
                        allowDrawingOutsideViewBox: true,
                        height: 15,
                        width: 15,
                        color: MyAppTheme.iconsBGColor,
                      ),
                    ],
                  ),
                )

              ),
            ) :const SizedBox(),
            Expanded(child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height : 45,
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  title: const Text(logout,textAlign: TextAlign.left,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: MyAppTheme.AcceptBgColor,
                    fontFamily: Fonts.nunito,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    LogoutBottomDilog(context);
                  },
                ),
              ),
            )
            ),

          ],
        ),
      ),
    );
  }
}


