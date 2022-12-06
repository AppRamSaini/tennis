import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/scoreinvalide.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/score_card/match_status.dart';
import 'package:tennis/screens/score_card/sets.dart';
import 'package:tennis/screens/score_card/winner.dart';
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
  TextEditingController wSetFourth =  TextEditingController();
  TextEditingController lSetFourth =  TextEditingController();
  TextEditingController wTBSetFourth =  TextEditingController();
  TextEditingController lTBSetFourth =  TextEditingController();
  TextEditingController wSetFive =  TextEditingController();
  TextEditingController lSetFive =  TextEditingController();
  TextEditingController wTBSetFive =  TextEditingController();
  TextEditingController lTBSetFive =  TextEditingController();
  TextEditingController wSetSix =  TextEditingController();
  TextEditingController lSetSix =  TextEditingController();
  TextEditingController wTBSetSix =  TextEditingController();
  TextEditingController lTBSetSix =  TextEditingController();
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
            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(challengerName,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.TitleTextColor,
                        fontFamily: Fonts.nunito,
                      )),
                  Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration:   BoxDecoration(
                      color: MyAppTheme.listBGColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: MyAppTheme.listBorderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Text(
                      'Ram',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(opponent,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.TitleTextColor,
                          fontFamily: Fonts.nunito,
                        )),
                  ),
                  Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration:   BoxDecoration(
                      color: MyAppTheme.listBGColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: MyAppTheme.listBorderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Text(
                      'Raju',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(winner,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.TitleTextColor,
                          fontFamily: Fonts.nunito,
                        )),
                  ),
                  Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    decoration:   BoxDecoration(
                      color: MyAppTheme.listBGColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: MyAppTheme.listBorderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Winner(cWinner: 'edit',)),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            provider.winnerName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.black_Color,
                              fontFamily: Fonts.nunito,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/forword_arrow.svg',
                            allowDrawingOutsideViewBox: true,
                            height: 15,
                            width: 15,
                            color: MyAppTheme.listBorderColor,
                          )
                        ],
                      ),
                    )

                    ,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(numberOfSets,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.TitleTextColor,
                          fontFamily: Fonts.nunito,
                        )),
                  ),
                  Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    decoration:   BoxDecoration(
                      color: MyAppTheme.listBGColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: MyAppTheme.listBorderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sets(cSet: 'edit',)),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            provider.numberOfSet,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.black_Color,
                              fontFamily: Fonts.nunito,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/forword_arrow.svg',
                            allowDrawingOutsideViewBox: true,
                            height: 15,
                            width: 15,
                            color: MyAppTheme.listBorderColor,
                          )
                        ],
                      ),
                    )

                    ,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(matchStatus,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.TitleTextColor,
                          fontFamily: Fonts.nunito,
                        )),
                  ),
                  Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    decoration:   BoxDecoration(
                      color: MyAppTheme.listBGColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: MyAppTheme.listBorderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MatchStatus(cmStatus: 'edit',)),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            provider.matchStatus,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.black_Color,
                              fontFamily: Fonts.nunito,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/forword_arrow.svg',
                            allowDrawingOutsideViewBox: true,
                            height: 15,
                            width: 15,
                            color: MyAppTheme.listBorderColor,
                          )
                        ],
                      ),
                    )

                    ,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(matchStatus,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.TitleTextColor,
                          fontFamily: Fonts.nunito,
                        )),
                  ),
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration:   BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: MyAppTheme.listBorderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: MyAppTheme.listBGColor,
                          height: 40,
                          child: Row(
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
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
                                        fontFamily: Fonts.nunito,
                                        fontSize: 14),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            )*/
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
                                  child: Text('#1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
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
                                          fontFamily: Fonts.nunito,
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
                                          fontFamily: Fonts.nunito,
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
                                              fontFamily: Fonts.nunito,
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
                                              fontFamily: Fonts.nunito,
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
                        provider.selectSIndex == 1 || provider.selectSIndex == 2 || provider.selectSIndex == 3
                            || provider.selectSIndex == 4 || provider.selectSIndex == 5 ?
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
                                        fontFamily: Fonts.nunito,
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
                                          fontFamily: Fonts.nunito,
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
                                          fontFamily: Fonts.nunito,
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
                                              fontFamily: Fonts.nunito,
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
                                              fontFamily: Fonts.nunito,
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
                        ) :SizedBox(),
                         provider.selectSIndex == 2 || provider.selectSIndex == 3
                             || provider.selectSIndex == 4 || provider.selectSIndex == 5 ?
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
                                        fontFamily: Fonts.nunito,
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
                                          fontFamily: Fonts.nunito,
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
                                          fontFamily: Fonts.nunito,
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
                                              fontFamily: Fonts.nunito,
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
                                              fontFamily: Fonts.nunito,
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
                        ) :SizedBox(),
                        provider.selectSIndex == 3 || provider.selectSIndex == 4 || provider.selectSIndex == 5?
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width* 0.10,
                                child: const Center(
                                  child: Text('#4',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
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
                                      controller: wSetFourth,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.forthTieBreak(wSetFourth.text.toString(), lSetFourth.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
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
                                      controller: lSetFourth,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.forthTieBreak(wSetFourth.text.toString(), lSetFourth.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: provider.forthTB ==  true ?  Center(
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
                                          controller: wTBSetFourth,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.nunito,
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
                                          controller: lTBSetFourth,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.nunito,
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
                        ) :SizedBox(),
                        provider.selectSIndex == 4 || provider.selectSIndex == 5 ?
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width* 0.10,
                                child: const Center(
                                  child: Text('#5',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
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
                                      controller: wSetFive,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.fiveTieBreak(wSetFive.text.toString(), lSetFive.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
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
                                      controller: lSetFive,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.fiveTieBreak(wSetFive.text.toString(), lSetFive.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: provider.fiveTB ==  true ?  Center(
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
                                          controller: wTBSetFive,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.nunito,
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
                                          controller: lTBSetFive,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.nunito,
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
                        ) :SizedBox(),
                        provider.selectSIndex == 5 ?
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width* 0.10,
                                child: const Center(
                                  child: Text('#6',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
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
                                      controller: wSetSix,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.sixTieBreak(wSetSix.text.toString(), lSetSix.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
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
                                      controller: lSetSix,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        provider.sixTieBreak(wSetSix.text.toString(), lSetSix.text.toString());
                                      },
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
                                          fontSize: 14),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: provider.sixTB ==  true ?  Center(
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
                                          controller: wTBSetSix,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.nunito,
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
                                          controller: lTBSetSix,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {

                                          },
                                          style: const TextStyle(
                                              color: MyAppTheme.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.nunito,
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
                        ) :SizedBox(),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 20.0,bottom: 10.0),
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
                          child: Text(save,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: MyAppTheme.whiteColor,
                                fontFamily: Fonts.nunito,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
            ,
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
          child: Text(scoreCard,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: MyAppTheme.whiteColor,
                fontFamily: Fonts.nunito,
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
void saveData1(BuildContext context,ScoreCardProvider provider){

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
