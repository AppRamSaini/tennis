import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/drawer/drawer_bar.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/home_provider.dart';
import 'package:tennis/repository/home.dart';
import 'package:tennis/screens/home/all_matches.dart';
import 'package:tennis/screens/home/join_academy.dart';
import 'package:tennis/screens/home/my_academy.dart';
import 'package:tennis/screens/home/my_challenges.dart';
import 'package:tennis/screens/home/my_result.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List bannerList = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late PageController _controller = PageController(
      viewportFraction: bannerList.length == 1 ? 1 : 0.80,
      initialPage: 0
  );
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    getHomeBannerData(context);
    locator<HomeProvider>().getHomeData(context);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }
  void _animateSlider() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentIndex < bannerList.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _controller!.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
  void getHomeBannerData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet != null && intenet) {
          setState(() {
            _isLoading = true;
          });
          bannerHomeData(context).then((response) {
            if (json.decode(response.body)['status'] == true) {
              setState(() {
                bannerList.clear();
                bannerList = json.decode(response.body)['data'];
                _isLoading = false;
              });
            } else if (json.decode(response.body)['status'] == 300) {
              Helpers.createErrorSnackBar(context, json.decode(response.body)['message'].toString());
            } else {
              Helpers.createErrorSnackBar(context, json.decode(response.body)['message'].toString());
            }
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
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
      body: (isLoading)
          ? Progressbar()
          : Container(
          width: width,
          height: height,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: bannerList.isNotEmpty
                      ? Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          controller: _controller,
                          padEnds: false,
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          itemCount: bannerList.length,
                          itemBuilder: (_, index) {
                            return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.22,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Center(
                                      child: FadeInImage(
                                        image: NetworkImage(bannerList[index]['banner']!),
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height * 0.22,
                                        placeholder: const AssetImage("assets/images/t_ball.png"),
                                        imageErrorBuilder: (context,
                                            error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/t_ball.png",
                                          );
                                        },
                                      )),
                                ));
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmoothPageIndicator(
                              controller: _controller,
                              count: bannerList.length,
                              effect: const ScrollingDotsEffect(
                                  radius: 8,
                                  spacing: 8,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  activeDotColor: MyAppTheme.MainColor)),
                        ),
                      )
                    ],
                  )
                      : const SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyAcademy()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: height * 0.11,
                        width: width,
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/my_academy.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.homeBgColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/my_academy.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      myAcademy,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: MyAppTheme.whiteColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.whiteColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/forword_arrow.svg',
                                      allowDrawingOutsideViewBox: true,
                                      height: 20,
                                      width: 20,
                                      color: MyAppTheme.MainColor,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyChallenges()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: height * 0.11,
                        width: width,
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/my_challenge.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.homeBgColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/my_challenge.svg',
                                      allowDrawingOutsideViewBox: true,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    myChallenge,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: MyAppTheme.whiteColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.whiteColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/forword_arrow.svg',
                                      allowDrawingOutsideViewBox: true,
                                      height: 20,
                                      width: 20,
                                      color: MyAppTheme.MainColor,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyAcademy()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: height * 0.11,
                        width: width,
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/my_result.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.homeBgColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/my_result.svg',
                                      allowDrawingOutsideViewBox: true,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    myResult,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: MyAppTheme.whiteColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.whiteColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/forword_arrow.svg',
                                      allowDrawingOutsideViewBox: true,
                                      height: 20,
                                      width: 20,
                                      color: MyAppTheme.MainColor,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyResult()),
                        );
                      },
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: height * 0.11,
                          width: width,
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/all_match.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.homeBgColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/all_match.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      allMatch,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: MyAppTheme.whiteColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.whiteColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/forword_arrow.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 20,
                                        width: 20,
                                        color: MyAppTheme.MainColor,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllMatches()),
                        );
                      },
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: height * 0.11,
                          width: width,
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/upcoming.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.homeBgColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/upcoming.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      upcomingTournament,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: MyAppTheme.whiteColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.whiteColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/forword_arrow.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 20,
                                        width: 20,
                                        color: MyAppTheme.MainColor,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),),
                )
              ],
            ),
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
