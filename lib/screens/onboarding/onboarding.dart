import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/screens/auth/login.dart';
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
      "image": "assets/images/slider.jpg",
      "des": "desc",
    },
    {
      "title": "title1",
      "image": "assets/images/logo.png",
      "des": "desc",
    },
    {
      "title": "title1",
      "image": "assets/images/slider.jpg",
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
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: height * 0.80,
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:  Container(
                          width: width * 0.60,
                          margin: EdgeInsets.only(top: height * 0.05),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            child:
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Next',
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
                              primary: MyAppTheme.MainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 5.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                          )
                      ),
                    )
                  ],
                ),

              ],
            )
            ,
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

