import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/config/prefConstatnt.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/screens/onboarding/onboarding_content.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  PageController? _controller;
  int currentIndex = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "title1",
      "image": "assets/images/flag_img.png",
      "des": "desc",
    },
    {
      "title": "title1",
      "image": "assets/images/flag_img.png",
      "des": "desc",
    },
    {
      "title": "title1",
      "image": "assets/images/flag_img.png",
      "des": "desc",
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentIndex < splashData.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      _controller!.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: MyAppTheme.whiteColor,
          body: Container(
            height: height,
            width: width,
            child: Column(
              children: [
                Container(
                  height: height * 0.65,
                  width: width,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => OnBoardingContent(
                      image: splashData[index]["image"],
                      title: splashData[index]['title'],
                      desc: splashData[index]['des'],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                        (index) => buildDot(index: index),
                  ),
                ),
                Container(
                  width: width * 0.60,
                  margin: EdgeInsets.only(top: height * 0.03),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child:
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'get start',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.whiteColor,
                          fontFamily: Fonts.poppins,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: MyAppTheme.welcomeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5.0,
                    ),
                    onPressed: () {
                     /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );*/
                    },
                  )
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(left: 10.0,right: 10.0,top: height * 0.03),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'use',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.black_Color,
                          fontFamily: Fonts.poppins,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );*/
                        },
                        child: Text(
                          'login',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.poppins,
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: Row(
                    children: [
                      Expanded(child: Container(
                        color: MyAppTheme.black_Color,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.40,
                      )),
                      Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Text(
                          "OR",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.poppins,
                          ),
                        ),),
                      Expanded(child: Container(
                        color: MyAppTheme.welcomeColor,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.40,
                      )),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.50,
                  margin: EdgeInsets.only(top: height * 0.02,bottom: height * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyAppTheme.black_Color,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                   ),
                  child: InkWell(
                    onTap: (){
                     /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StaffLogin()),
                      );*/
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/staff_login.svg',
                          allowDrawingOutsideViewBox: true,
                          height: 20,
                          width: 15,
                          color: MyAppTheme.black_Color,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10.0),
                          child:  Text(
                            'staff',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: MyAppTheme.black_Color,
                              fontFamily: Fonts.poppins,
                            ),
                          ),)

                      ],
                    ),
                  )
                  ,
                )
              ],
            ),
          ),
        )


    );
  }
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 12,
      width: currentIndex == index ? 35 : 12,
      decoration:  currentIndex == index ? BoxDecoration(
        color: MyAppTheme.black_Color,
        borderRadius: BorderRadius.circular(12),
      ):BoxDecoration(
        border: Border.all(color: MyAppTheme.black_Color,width: 0.5),
        borderRadius: BorderRadius.all(
            Radius.circular(12) //                 <--- border radius here
        ),
      ),
    );
  }
}

