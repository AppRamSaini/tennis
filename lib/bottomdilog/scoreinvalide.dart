import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

ScoreInvalideBottomDilog(BuildContext buildContext){
  showModalBottomSheet<void>(
    context: buildContext,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder( // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return  SingleChildScrollView(
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                          padding:  EdgeInsets.only(left: 0.0),
                          child: Text('Validation Error',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.poppins,
                              ))),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/close_icon.svg",
                          allowDrawingOutsideViewBox: true,
                          height: 20,
                          width: 20,
                          color: MyAppTheme.black_Color,
                        ),
                      )


                    ],
                  ),
                  const Padding(
                      padding:  EdgeInsets.only(top: 10.0,bottom: 10.0),
                      child: Text('Score is invalid. Please review',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.poppins,
                          ))),

                ],
              ) ,)
            ,
          ),
        )
        ,
      )

      ;
    },
  );
}