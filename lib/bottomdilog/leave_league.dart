import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/providers/myleagues_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

LeaveLeagueBottomDilog(BuildContext buildContext,String leagueUUID,String leagueName){
  final maxLines = 5;
  bool checkLength = false;
  TextEditingController leaguesDescription = TextEditingController();
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                   Padding(
                      padding:  const EdgeInsets.only(top: 10.0,bottom: 10.0),
                      child: Text('Are you sure you want to Leave $leagueName League',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.nunito,
                          ))),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: maxLines * 25.0,
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: MyAppTheme.MainColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child:  TextFormField(
                      maxLines: maxLines,
                      maxLength: 655,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      controller: leaguesDescription,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Reason';
                        }else if (value.length < 10){
                          return 'Please Enter minimum 10 Characters';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: MyAppTheme.black_Color,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.nunito,
                          fontSize: 14),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Reason',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.0),),
                    ),
                  ),
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
                                cancel,
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
                            if(leaguesDescription.text.isNotEmpty && leaguesDescription.text.length >= 10){
                              Navigator.pop(context);
                              locator<MyLeaguesProvider>().leaveLeague(buildContext,leagueUUID,leaguesDescription.text.toString());
                            }else {
                              Helpers.messageToastFalseBottom(context,'Enter Reason with Minimum 10 Characters');
                            }

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
                                yes,
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