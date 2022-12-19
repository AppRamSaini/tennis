import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/logout.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/drawer/drawer_bar.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/setting/edit_profile.dart';
import 'package:tennis/screens/webviewscreens/webviewpage.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  String? user_profile;
  String? user_name;
  String? user_email;
  @override
  initState() {
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
    return Scaffold(
      key: _key, // Assign the key to Scaffold.
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              user_profile != "" && user_profile != null ?
              Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 25.0,bottom: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
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
                  ))
              /*Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 25.0,bottom: 10.0),
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(user_profile!)
                  ),
                  border: Border.all(color: MyAppTheme.CategoryBGSelectColor,width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                ),
              )*/: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 25.0,bottom: 10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/image_defult.png"),
                      fit: BoxFit.fill
                  ),
                ),
              ),
               user_name != null ?
               Text(
                user_name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: MyAppTheme.black_Color,
                  fontFamily: Fonts.nunito,
                ),
              ):SizedBox(),
              user_email != null ?
               Text(
                user_email!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: MyAppTheme.DesBlackColor,
                  fontFamily: Fonts.nunito,
                ),
              ):SizedBox(),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  ).then((value) => {
                  setState(() {
                  user_profile = value;
                      })
                  });
                },
                child: Container(
                  width: 120,
                  height: 40,
                  margin:  const EdgeInsets.only(top: 10.0),
                  decoration:  const BoxDecoration(
                      color: MyAppTheme.EditBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child:  const Center(
                    child: Text(
                      editProfile,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: width,
                height: 1,
                margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                color: MyAppTheme.LineColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WebViewPage(url: 'https://flutter.dev', title: termConditions,)),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(
                              'assets/icons/term_condition.svg',
                              allowDrawingOutsideViewBox: true,
                              height: 20,
                              width: 20,
                              color: MyAppTheme.DesBlackColor,
                            ),
                          ),
                          const Text(
                            termConditions,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.DesBlackColor,
                              fontFamily: Fonts.nunito,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/forword_arrow.svg',
                        allowDrawingOutsideViewBox: true,
                        height: 10,
                        width: 10,
                        color: MyAppTheme.DesBlackColor,
                      ),
                    ],
                  ),
                )


              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            'assets/icons/privacy_policy.svg',
                            allowDrawingOutsideViewBox: true,
                            height: 20,
                            width: 20,
                            color: MyAppTheme.DesBlackColor,
                          ),
                        ),
                        const Text(
                          privacyPolicy,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: MyAppTheme.DesBlackColor,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/forword_arrow.svg',
                      allowDrawingOutsideViewBox: true,
                      height: 10,
                      width: 10,
                      color: MyAppTheme.DesBlackColor,
                    ),
                  ],
                )

              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            'assets/icons/star_rating.svg',
                            allowDrawingOutsideViewBox: true,
                            height: 20,
                            width: 20,
                            color: MyAppTheme.DesBlackColor,
                          ),
                        ),
                        const Text(
                          rateTheApp,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: MyAppTheme.DesBlackColor,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/forword_arrow.svg',
                      allowDrawingOutsideViewBox: true,
                      height: 10,
                      width: 10,
                      color: MyAppTheme.DesBlackColor,
                    ),
                  ],
                )

              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                child: InkWell(
                  onTap: (){
                    LogoutBottomDilog(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'assets/icons/logout.svg',
                          allowDrawingOutsideViewBox: true,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const Text(
                        logout,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ),
                    ],
                  ),
                )
                ,
              )
            ],
          )

      ),
      drawer: const DrawerBar(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _key.currentState!.openDrawer();
            }, // Image tapped
            child: Image.asset('assets/images/menu.png',width: 20,height: 15,),
          ),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            allowDrawingOutsideViewBox: true,
          ),
          const SizedBox(width: 20,height: 20,)

        ],

      ),
      backgroundColor: MyAppTheme.whiteColor,
    );
  }
}

