import 'package:flutter/material.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class DrawerBar extends StatefulWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  String? user_profile;
  String? user_name;
  String? user_email;
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
            SizedBox(
              height: 40,
              child: ListTile(
                title: const Text(myAcademy,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyAppTheme.TitleBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                title: const Text(myChallenge,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyAppTheme.TitleBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                title: const Text(myResult,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyAppTheme.TitleBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                title: const Text(allMatch,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyAppTheme.TitleBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                title: const Text(upcomingTournament,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyAppTheme.TitleBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: ListTile(
                title: const Text(logout,textAlign: TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyAppTheme.TitleBlackColor,
                  fontFamily: Fonts.nunito,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


