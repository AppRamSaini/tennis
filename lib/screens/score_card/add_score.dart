import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/scoreinvalide.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddScore extends StatefulWidget {
  const AddScore({Key? key}) : super(key: key);

  @override
  State<AddScore> createState() => _AddScoreState();
}

class _AddScoreState extends State<AddScore> {
  TextEditingController wSetF = TextEditingController();
  TextEditingController lSetF =  TextEditingController();
  TextEditingController wTBSetF =  TextEditingController();
  TextEditingController lTBSetF =  TextEditingController();
  TextEditingController wSetS =  TextEditingController();
  TextEditingController lSetS =  TextEditingController();
  TextEditingController wTBSetS =  TextEditingController();
  TextEditingController lTBSetS =  TextEditingController();
  TextEditingController wSetT =  TextEditingController();
  TextEditingController lSetT =  TextEditingController();
  TextEditingController wTBSetT =  TextEditingController();
  TextEditingController lTBSetT =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.MainColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Consumer<ScoreCardProvider>(
        builder: (context,provider,child){
          return Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width* 0.10,
                              child: const Center(
                                child: Text('Set',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.poppins,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: width* 0.20,
                              child: const Center(
                                child: Text('Winner',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.poppins,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: width* 0.20,
                              child: const Center(
                                child: Text('Loser',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.poppins,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: width* 0.40,
                              child: const Center(
                                child: Text('Tie-Break',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.poppins,
                                    )),
                              ),
                            ),
                            /*Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: MyAppTheme.MainColor,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: wSetF,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {

                                  },
                                  style: const TextStyle(
                                      color: MyAppTheme.black_Color,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.poppins,
                                      fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(top: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: MyAppTheme.MainColor,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: wSetF,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {

                                  },
                                  style: const TextStyle(
                                      color: MyAppTheme.black_Color,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.poppins,
                                      fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(top: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: MyAppTheme.colorinactiveTrackColor,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: wSetF,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {

                                  },
                                  style: const TextStyle(
                                      color: MyAppTheme.black_Color,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.poppins,
                                      fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(top: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: MyAppTheme.colorinactiveTrackColor,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  controller: wSetF,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {

                                  },
                                  style: const TextStyle(
                                      color: MyAppTheme.black_Color,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Fonts.poppins,
                                      fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          )*/

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width* 0.10,
                                child: const Center(
                                  child: Text('#1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.poppins,
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child:  Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MyAppTheme.MainColor,
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: wSetF,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.firstTieBreak(wSetF.text.toString(), lSetF.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.poppins,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MyAppTheme.colorinactiveTrackColor,
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: lSetF,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.firstTieBreak(wSetF.text.toString(), lSetF.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.poppins,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: provider.fTB ==  true ?   Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: MyAppTheme.MainColor,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          controller: wTBSetF,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.poppins,
                                              fontSize: 14),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: MyAppTheme.colorinactiveTrackColor,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          controller: lTBSetF,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.poppins,
                                              fontSize: 14),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ): SizedBox(),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width* 0.10,
                                child: const Center(
                                  child: Text('#2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.poppins,
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child:  Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MyAppTheme.MainColor,
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: wSetS,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.secondTieBreak(wSetS.text.toString(), lSetS.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.poppins,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MyAppTheme.colorinactiveTrackColor,
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: lSetS,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.secondTieBreak(wSetS.text.toString(), lSetS.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.poppins,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: provider.sTB ==  true ? Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: MyAppTheme.MainColor,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          controller: wTBSetS,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.poppins,
                                              fontSize: 14),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: MyAppTheme.colorinactiveTrackColor,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          controller: lTBSetS,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.poppins,
                                              fontSize: 14),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) :SizedBox(),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width* 0.10,
                                child: const Center(
                                  child: Text('#3',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.poppins,
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child:  Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MyAppTheme.MainColor,
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: wSetT,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.thirdTieBreak(wSetT.text.toString(), lSetT.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.poppins,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MyAppTheme.colorinactiveTrackColor,
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: lSetT,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.thirdTieBreak(wSetT.text.toString(), lSetT.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.poppins,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: provider.tTB ==  true ?  Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: MyAppTheme.MainColor,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          controller: wTBSetT,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.poppins,
                                              fontSize: 14),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: MyAppTheme.colorinactiveTrackColor,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          controller: lTBSetT,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.poppins,
                                              fontSize: 14),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) :SizedBox(),
                              ),

                            ],
                          ),
                        ),
                      ],
                    )

                ),
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyAppTheme.MainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        KeyboardUtil.hideKeyboard(context);
                       saveData(context,provider);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Save',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.whiteColor,
                              fontFamily: Fonts.poppins,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title:  const Padding(
          padding:  EdgeInsets.only(left: 0.0),
          child: Text('Score Card',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: MyAppTheme.whiteColor,
                fontFamily: Fonts.poppins,
              ))),
      leading: IconButton(
        icon:  SvgPicture.asset(
          'assets/icons/black_back_arrow.svg',
          allowDrawingOutsideViewBox: true,
          height: 20,
          width: 20,
          color: MyAppTheme.whiteColor,
        ),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      actions: [

      ],
      backgroundColor: MyAppTheme.MainColor,
    );
  }

  void saveData(BuildContext context,ScoreCardProvider provider){

    if(wSetF.text.isNotEmpty && lSetF.text.isNotEmpty){
      if(provider.fTB == true){
        if(wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty){
         if(wSetS.text.isNotEmpty && lSetS.text.isNotEmpty){
            if(provider.sTB == true){
              if(wTBSetS.text.isNotEmpty && lTBSetS.text.isNotEmpty){
                if(wSetT.text.isNotEmpty && lSetT.text.isNotEmpty){
                  if(provider.tTB == true){
                    if(wTBSetT.text.isNotEmpty && lTBSetT.text.isNotEmpty){
                      // call api
                      print('call set 3 tie-break');
                    }else {
                      // dilog box
                      ScoreInvalideBottomDilog(context);
                    }
                  }else {
                    print('call set 3');
                    // call api
                  }
                }else {
                  // dilog box
                  ScoreInvalideBottomDilog(context);
                }
                // call api
              }else {
                // dilog box
                ScoreInvalideBottomDilog(context);
              }
            }else {
              if(wSetT.text.isNotEmpty && lSetT.text.isNotEmpty){
                if(provider.tTB == true){
                  if(wTBSetT.text.isNotEmpty && lTBSetT.text.isNotEmpty){
                    print('call set 3 tie-break');
                    // call api
                  }else {
                    // dilog box
                    ScoreInvalideBottomDilog(context);
                  }
                }else {
                  print('call set 3');
                  // call api
                }
              }else {
                // dilog box
                ScoreInvalideBottomDilog(context);
              }
            }
         }else {
           // diloag box
           ScoreInvalideBottomDilog(context);
         }
        }else {
          ScoreInvalideBottomDilog(context);
        }
      }else {
        print('call set 1');
           // call api
      }
    }else {
      ScoreInvalideBottomDilog(context);
    }
  }
}
