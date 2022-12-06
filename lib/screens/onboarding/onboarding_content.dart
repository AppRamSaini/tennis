
import 'package:flutter/material.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    this.title,
    this.desc,
    this.image,
  }) : super(key: key);
  final String? title,desc,image;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        height: height,
        width: width,
        child: Stack(
        children: [
          Container(
              height: height* 0.70,
              width: width,
              alignment: Alignment.center,
              child: Image.asset(image!,
                height: height,
                width: width,
                fit: BoxFit.cover,)
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.25,
              width: width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: MyAppTheme.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
                    child: Text(
                      desc!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
    ),
      )
      ;
  }
}
