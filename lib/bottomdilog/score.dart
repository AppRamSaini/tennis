import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

ScoreBottomDilog(BuildContext buildContext,String winner_uuid,String status,String score){
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
            child: Padding(padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      const Padding(
                          padding:  EdgeInsets.only(left: 0.0),
                          child: Text('Score Card',textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
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
                      child: Text('Add Score Data  is Valid. Please Send',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.nunito,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 45,
                            margin:  const EdgeInsets.only(right: 10.0),
                            decoration:  const BoxDecoration(
                                color: MyAppTheme.CategoryBGSelectColor,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child:  const Center(
                              child: Text(
                                'No',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: MyAppTheme.whiteColor,
                                  fontFamily: Fonts.nunito,
                                ),
                              ),
                            ),
                          ),
                        )),
                        Expanded(child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            locator<ScoreCardProvider>().sendChallengeScore(buildContext,winner_uuid,status,score);
                          },
                          child: Container(
                            height: 45,
                            margin:  const EdgeInsets.only(left: 10.0),
                            decoration:  const BoxDecoration(
                                color: MyAppTheme.EditBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child:  const Center(
                              child: Text(
                                'Yes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: MyAppTheme.black_Color,
                                  fontFamily: Fonts.nunito,
                                ),
                              ),
                            ),
                          ),
                        )),

                      ],
                    ),
                  )
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