
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
    return Column(
      children: <Widget>[
        Container(
          height: height* 0.60,
          width: width,
          alignment: Alignment.center,
          child: FadeInImage(
            image: NetworkImage(image!),
            width: width,
            height: height,
            alignment: Alignment.center,
            placeholder: AssetImage(image!),
            imageErrorBuilder: (context, error, stackTrace)
            {
              return Image.asset(
                image!,
                height: height,
                width: width,);
            },

          )
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: MyAppTheme.black_Color,
              fontFamily: Fonts.poppins,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
          child: Text(
            desc!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: MyAppTheme.black_Color,
              fontFamily: Fonts.poppins,
            ),
          ),
        ),
      ],
    );
  }
}
