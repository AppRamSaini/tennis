import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      "title": "Tennis Khelo App Title ",
      "image": "assets/images/slider001.jpg",
      "des": "tennis khelo app description",
    },
    {
      "title": "Tennis Khelo App Title ",
      "image": "assets/images/slider002.jpg",
      "des": "tennis khelo app description",
    },
    {
      "title": "Tennis Khelo App Title ",
      "image": "assets/images/slider003.jpg",
      "des": "tennis khelo app description",
    },
  ];
  void nextPage(int page){
    _controller = PageController(initialPage: page);
  }
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: MyAppTheme.whiteColor,
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height * 0.90,
                width: width,
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child:  const Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.black_Color,
                          fontFamily: Fonts.nunito,
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
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(currentIndex == 2){
                            currentIndex++;
                            nextPage(currentIndex);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }else {
                            currentIndex++;
                            nextPage(currentIndex);
                          }
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: const BoxDecoration(
                                color: MyAppTheme.MainColor,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.whiteColor,
                                    shape: BoxShape.circle
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/forword_arrow.svg',
                                    allowDrawingOutsideViewBox: true,
                                    height: 20,
                                    width: 20,
                                    color: MyAppTheme.MainColor,
                                  ),
                                ),
                              ),

                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              )

            ],
          )
          ,
        ),
      ),
    );
  }
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentIndex == index ? 35 : 10,
      decoration:  currentIndex == index ? BoxDecoration(
        color: MyAppTheme.MainColor,
        borderRadius: BorderRadius.circular(10),
      ):BoxDecoration(
        border: Border.all(color: MyAppTheme.black_Color,width: 0.5),
        borderRadius: BorderRadius.all(
            Radius.circular(12) //                 <--- border radius here
        ),
      ),
    );
  }
}

