import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/score.dart';
import 'package:tennis/bottomdilog/scoreinvalide.dart';
import 'package:tennis/helpers/appconfig.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/dashboard/dashboard.dart';
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

  TextEditingController superTieBWSet =  TextEditingController();
  TextEditingController superTieBLSet =  TextEditingController();

  TextEditingController secSuperTieBWSet =  TextEditingController();
  TextEditingController secSuperTieBLSet =  TextEditingController();
  String WinnerUUID = "";
  late int selectSIndex;
  String? dropdownValue = AppConfig.AccepterName;
  String? dropdownSets;
  String? dropdownMStatus = 'Played Through';
  String? matchsStatus = "";
  String scoreStatus = "valid";
  List setEmptyValueSet = [];
  List setValueSet = [];
  List<Map<String, dynamic>> numOfSets = [];
  void setValueSendData(int totalWinnerCount, int totalLoserCount){
    setValueSet.clear();
    if(totalWinnerCount > totalLoserCount){
      setState(() {
        scoreStatus = "valid";
      });
    }else {
      setState(() {
        scoreStatus = "notvalid";
      });
    }
    print("match value $scoreStatus");
    List<ScoreCard> firstSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
    //  ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
    //  ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
    //  ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
     // ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> secondSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
     // ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
     // ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
    //  ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
     // ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> secondSuperTieBreakerSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: superTieBWSet.text.toString(), loser: superTieBLSet.text.toString(), tie_winner: "", tie_loser: ""),
      // ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
      // ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
      //  ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
      // ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> thirdSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
     // ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
    //  ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
    //  ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> fourthSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
      ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
    //  ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
    //  ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> fourthSuperTieBreakerSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
      ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
      ScoreCard(winner: secSuperTieBWSet.text.toString(), loser: secSuperTieBLSet.text.toString(), tie_winner: "", tie_loser: ""),
      //  ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
      //  ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> fiveSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
      ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
      ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
     // ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    if(dropdownSets == "Set 1"){
      setValueSet.addAll(firstSetValues);
    }else if (dropdownSets == "Set 2"){
      if(totalWinnerCount == 2 && totalLoserCount == 1 || totalWinnerCount == 1 && totalLoserCount == 2){
        setValueSet.addAll(secondSuperTieBreakerSetValues);
      }else {
        setValueSet.addAll(secondSetValues);
      }
    }else if (dropdownSets == "Set 3"){
      if(totalWinnerCount == 2 && totalLoserCount == 0 || totalWinnerCount == 0 && totalLoserCount == 2){
        setValueSet.addAll(secondSetValues);
      }else {
        setValueSet.addAll(thirdSetValues);
      }
    }else if (dropdownSets == "Set 4"){
      if(totalWinnerCount == 3 && totalLoserCount == 2 || totalWinnerCount == 2 && totalLoserCount == 3){
        setValueSet.addAll(fourthSuperTieBreakerSetValues);
      } else if(totalWinnerCount == 3 && totalLoserCount == 0 || totalWinnerCount == 0 && totalLoserCount == 3){
        setValueSet.addAll(thirdSetValues);
      } else {
        setValueSet.addAll(fourthSetValues);
      }
    }else if (dropdownSets == "Set 5"){
      if(totalWinnerCount == 3 && totalLoserCount == 0 || totalWinnerCount == 0 && totalLoserCount == 3){
        setValueSet.addAll(thirdSetValues);
      }else {
        setValueSet.addAll(fiveSetValues);
      }
      
    }
    print(setValueSet.map((e){
      return {
       "winner" : e.winner,
        "loser" : e.loser,
        "tie_winner" : e.tie_winner,
        "tie_loser" : e.tie_loser
      };
    }).toList());
  }
  void setNoValue(){
    List<Map<String, dynamic>> oneSetsList = [
      {
        "title": 'Set 1',
      }
    ];
    List<Map<String, dynamic>> twoSetsList = [
      {
        "title": 'Set 1',
      },
      {
        "title": 'Set 2',
      }
    ];
    List<Map<String, dynamic>> threeSetsList = [
      {
        "title": 'Set 1',
      },
      {
        "title": 'Set 2',
      },
      {
        "title": 'Set 3',
      }
    ];
    List<Map<String, dynamic>> fourSetsList = [
      {
        "title": 'Set 1',
      },
      {
        "title": 'Set 2',
      },
      {
        "title": 'Set 3',
      },
      {
        "title": 'Set 4',
      }
    ];
    List<Map<String, dynamic>> fiveSetsList = [
      {
        "title": 'Set 1',
      },
      {
        "title": 'Set 2',
      },
      {
        "title": 'Set 3',
      },
      {
        "title": 'Set 4',
      },
      {
        "title": 'Set 5',
      }
    ];
    if(selectSIndex == 1){
      dropdownSets = 'Set 1';
      numOfSets.addAll(oneSetsList);
    }else if (selectSIndex == 2){
      dropdownSets = 'Set 2';
      numOfSets.addAll(twoSetsList);
    }else if (selectSIndex == 3){
      dropdownSets = 'Set 3';
      numOfSets.addAll(threeSetsList);
    }else if (selectSIndex == 4){
      dropdownSets = 'Set 4';
      numOfSets.addAll(fourSetsList);
    }else if (selectSIndex == 5){
      dropdownSets = 'Set 5';
      numOfSets.addAll(fiveSetsList);
    }
  }
  List<Map<String, dynamic>> winnerList = [
    {
      "title": AppConfig.AccepterName,
    },
    {
      "title": AppConfig.ChallengerName,
    },
  ];

  List<Map<String, dynamic>> mStatusList = [
    {
      "title": 'Played Through',
    },
    {
      "title": 'Court Time Expired',
    },
    {
      "title": 'Opponent No Show',
    },
    {
      "title": 'Opponent Forfeited',
    },
    {
      "title": 'Opponent Injured',
    },
  ];
  void selectMatchsStatus(String value){
    setState(() {
      dropdownMStatus = value;
      if(dropdownMStatus == 'Played Through'){
        matchsStatus = "played";
      }else if(dropdownMStatus == 'Court Time Expired'){
        matchsStatus = "expired";
      }else if(dropdownMStatus == 'Opponent No Show'){
        matchsStatus = "absent";
      }else if(dropdownMStatus == 'Opponent Forfeited'){
        matchsStatus = "forfeited";
      }else if(dropdownMStatus == 'Opponent Injured'){
        matchsStatus = "injured";
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    print(AppConfig.Sets);
    locator<ScoreCardProvider>().reSetAllValue();
    selectSIndex = AppConfig.Sets;
    WinnerUUID = AppConfig.AccepterUuid;
    matchsStatus = "played";
    setNoValue();
    super.initState();
  }
  void resetAllValueUpdate(String value){
    locator<ScoreCardProvider>().reSetValue(value);
    setState(() {
      dropdownSets = value;
      if(dropdownSets == 'Set 1'){
        wSetS.text = "";
        lSetS.text = "";
        wTBSetS.text = "";
        lTBSetS.text = "";
        wSetT.text = "";
        lSetT.text = "";
        wTBSetT.text = "";
        lTBSetT.text = "";
        wSetFourth.text = "";
        lSetFourth.text = "";
        wTBSetFourth.text = "";
        lTBSetFourth.text = "";
        wSetFive.text = "";
        lSetFive.text = "";
        wTBSetFive.text = "";
        lTBSetFive.text = "";
        superTieBWSet.text =  "";
        superTieBLSet.text =  "";
        secSuperTieBWSet.text =  "";
        secSuperTieBLSet.text =  "";
        selectSIndex = 1;
        AppConfig.Sets = 1;

      }else if(dropdownSets == 'Set 2'){
        wSetT.text = "";
        lSetT.text = "";
        wTBSetT.text = "";
        lTBSetT.text = "";
        wSetFourth.text = "";
        lSetFourth.text = "";
        wTBSetFourth.text = "";
        lTBSetFourth.text = "";
        wSetFive.text = "";
        lSetFive.text = "";
        wTBSetFive.text = "";
        lTBSetFive.text = "";
        superTieBWSet.text =  "";
        superTieBLSet.text =  "";
        secSuperTieBWSet.text =  "";
        secSuperTieBLSet.text =  "";
        selectSIndex = 2;
        AppConfig.Sets = 2;
      }else if(dropdownSets == 'Set 3'){
        wSetFourth.text = "";
        lSetFourth.text = "";
        wTBSetFourth.text = "";
        lTBSetFourth.text = "";
        wSetFive.text = "";
        lSetFive.text = "";
        wTBSetFive.text = "";
        lTBSetFive.text = "";
        superTieBWSet.text =  "";
        superTieBLSet.text =  "";
        secSuperTieBWSet.text =  "";
        secSuperTieBLSet.text =  "";
        selectSIndex = 3;
        AppConfig.Sets = 3;
      }else if(dropdownSets == 'Set 4'){
        wSetFive.text = "";
        lSetFive.text = "";
        wTBSetFive.text = "";
        lTBSetFive.text = "";
        superTieBWSet.text =  "";
        superTieBLSet.text =  "";
        secSuperTieBWSet.text =  "";
        secSuperTieBLSet.text =  "";
        selectSIndex = 4;
        AppConfig.Sets = 4;
      }else if(dropdownSets == 'Set 5'){
        selectSIndex = 5;
        AppConfig.Sets = 5;
      }
    });
  }
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
                child:
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: MyAppTheme.black_Color,
                        fontFamily: Fonts.nunito,
                      ),
                      items: winnerList.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                        return DropdownMenuItem<String>(
                          value: value['title'],
                          child: Text(value['title']),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                         setState(() {
                           dropdownValue = newValue;
                           if(dropdownValue == AppConfig.ChallengerName){
                             WinnerUUID = AppConfig.ChallengerUuid;
                           }else {
                             WinnerUUID = AppConfig.AccepterUuid;
                           }
                         });
                      },
                    ),
                  )),
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
                      child:
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownSets,
                          enableFeedback: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.nunito,
                          ),
                          items: numOfSets.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                            return DropdownMenuItem<String>(
                              value: value['title'],
                              child: Text(value['title']),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            resetAllValueUpdate(newValue!);
                           // provider.selectSetsIndex(index,setList[index]);
                          },
                        ),
                      )),
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
                      child:
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownMStatus,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.nunito,
                          ),
                          items: mStatusList.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                            return DropdownMenuItem<String>(
                              value: value['title'],
                              child: Text(value['title']),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectMatchsStatus(newValue!);
                          },
                        ),
                      )),
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
                            ],
                          ),
                        ),
                        matchsStatus == "played" ?
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                dropdownSets == "Set 1"  ?
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
                                              border: Border.all(
                                                color: provider.fVCheck == true ? MyAppTheme.MainColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                              ),
                                            ),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(1),
                                              ],
                                              controller: wSetF,
                                              keyboardType: TextInputType.number,
                                              onChanged: (value) {
                                                print(value);
                                                if(value == "5"){
                                                  setState(() {
                                                    lSetF.text = "7";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else if(value == "7"){
                                                  setState(() {
                                                    lSetF.text = "5";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else if(lSetF.text == "7" || lSetF.text == "5") {
                                                  setState(() {
                                                    lSetF.text = "";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else if (value == "8" || value == "9"){
                                                  setState(() {
                                                    wSetF.text = "";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else {
                                                  setState(() {
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }
                                                provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                              border: Border.all(
                                                color: provider.fVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                              ),
                                            ),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(1),
                                              ],
                                              controller: lSetF,
                                              keyboardType: TextInputType.number,
                                              onChanged: (value) {
                                                print(value);
                                                if(value == "5"){
                                                  setState(() {
                                                    wSetF.text = "7";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else if(value == "7"){
                                                  setState(() {
                                                    wSetF.text = "5";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else if(wSetF.text == "7" || wSetF.text == "5") {
                                                  setState(() {
                                                    wSetF.text = "";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else if (value == "8" || value == "9"){
                                                  setState(() {
                                                    lSetF.text = "";
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }else {
                                                  setState(() {
                                                    wTBSetF.text = "";
                                                    lTBSetF.text = "";
                                                  });
                                                }
                                                provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.fTBVCheck == true ? MyAppTheme.MainColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(2),
                                                  ],
                                                  controller: wTBSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.fTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(2),
                                                  ],
                                                  controller: lTBSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                )  : const SizedBox(),

                                dropdownSets == "Set 2"  ?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.MainColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(lSetF.text == "7" || lSetF.text == "5") {
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(wSetF.text == "7" || wSetF.text == "5") {
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.MainColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.MainColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(lSetS.text == "7" || lSetS.text == "5") {
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(wSetS.text == "7" || wSetS.text == "5") {
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.MainColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                    ),
                                    provider.winnerTotalCount == 1 && provider.loserTotalCount == 1
                                        || provider.winnerTotalCount == 2 && provider.loserTotalCount == 1
                                        || provider.winnerTotalCount == 1 && provider.loserTotalCount == 2
                                        ?
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: width,
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(bottom: 5.0),
                                                child: Text('Super Tie-Break',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16,
                                                      color: MyAppTheme.black_Color,
                                                      fontFamily: Fonts.nunito,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: width* 0.20,
                                                child:  Center(
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      border: Border.all(
                                                        color: provider.superTieBreakerVCheck == true ? MyAppTheme.MainColor : superTieBLSet.text.isNotEmpty && superTieBWSet.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: superTieBWSet,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            superTieBLSet.text = "7";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            superTieBLSet.text = "5";
                                                          });
                                                        }else if(superTieBLSet.text == "7" || superTieBLSet.text == "5") {
                                                          setState(() {
                                                            superTieBLSet.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            superTieBWSet.text = "";
                                                          });
                                                        }
                                                        provider.superTieBreakerValueCheck(superTieBWSet.text.toString(), superTieBLSet.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.superTieBreakerVCheck == true ? MyAppTheme.colorinactiveTrackColor : superTieBLSet.text.isNotEmpty && superTieBWSet.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: superTieBLSet,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            superTieBWSet.text = "7";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            superTieBWSet.text = "5";
                                                          });
                                                        }else if(superTieBWSet.text == "7" || superTieBWSet.text == "5") {
                                                          setState(() {
                                                            superTieBWSet.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            superTieBLSet.text = "";
                                                          });
                                                        }
                                                        provider.superTieBreakerValueCheck(superTieBWSet.text.toString(), superTieBLSet.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                            ],
                                          )
                                        ],
                                      ),
                                    ) :const SizedBox(),

                                  ],
                                )
                                    : const SizedBox(),

                                dropdownSets == "Set 3"   ?

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.MainColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(lSetF.text == "7" || lSetF.text == "5") {
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(wSetF.text == "7" || wSetF.text == "5") {
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.MainColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.MainColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(lSetS.text == "7" || lSetS.text == "5") {
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(wSetS.text == "7" || wSetS.text == "5") {
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.MainColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                    ),
                                    provider.winnerTotalCount == provider.loserTotalCount
                                        || provider.winnerTotalCount == 1 && provider.loserTotalCount == 2
                                        || provider.winnerTotalCount == 2 && provider.loserTotalCount == 1
                                        || provider.winnerTotalCount == 0 && provider.loserTotalCount == 1
                                        || provider.winnerTotalCount == 1 && provider.loserTotalCount == 0
                                        ?
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child:  Row(
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
                                                  border: Border.all(
                                                    color: provider.tVCheck == true ? MyAppTheme.MainColor : lSetT.text.isNotEmpty && wSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetT,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetT.text = "7";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetT.text = "5";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(lSetT.text == "7" || lSetT.text == "5") {
                                                      setState(() {
                                                        lSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }
                                                    provider.thirdValueCheck(wSetT.text.toString(), lSetT.text.toString());
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
                                                  border: Border.all(
                                                    color: provider.tVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetT.text.isNotEmpty && wSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetT,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetT.text = "7";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetT.text = "5";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(wSetT.text == "7" || wSetT.text == "5") {
                                                      setState(() {
                                                        wSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }
                                                    provider.thirdValueCheck(wSetT.text.toString(), lSetT.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.tTBVCheck == true ? MyAppTheme.MainColor : lTBSetT.text.isNotEmpty && wTBSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetT,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.thirdTieBreakValueCheck(wTBSetT.text.toString(), lTBSetT.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.tTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetT.text.isNotEmpty && wTBSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetT,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.thirdTieBreakValueCheck(wTBSetT.text.toString(), lTBSetT.text.toString());
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
                                    ) : const SizedBox()
                                  ],
                                )


                                    : const SizedBox(),


                                dropdownSets == "Set 4"   ?

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.MainColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(lSetF.text == "7" || lSetF.text == "5") {
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(wSetF.text == "7" || wSetF.text == "5") {
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.MainColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.MainColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(lSetS.text == "7" || lSetS.text == "5") {
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(wSetS.text == "7" || wSetS.text == "5") {
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.MainColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child:  Row(
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
                                                  border: Border.all(
                                                    color: provider.tVCheck == true ? MyAppTheme.MainColor : lSetT.text.isNotEmpty && wSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetT,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetT.text = "7";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetT.text = "5";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(lSetT.text == "7" || lSetT.text == "5") {
                                                      setState(() {
                                                        lSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }
                                                    provider.thirdValueCheck(wSetT.text.toString(), lSetT.text.toString());
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
                                                  border: Border.all(
                                                    color: provider.tVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetT.text.isNotEmpty && wSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetT,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetT.text = "7";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetT.text = "5";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(wSetT.text == "7" || wSetT.text == "5") {
                                                      setState(() {
                                                        wSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }
                                                    provider.thirdValueCheck(wSetT.text.toString(), lSetT.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.tTBVCheck == true ? MyAppTheme.MainColor : lTBSetT.text.isNotEmpty && wTBSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetT,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.thirdTieBreakValueCheck(wTBSetT.text.toString(), lTBSetT.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.tTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetT.text.isNotEmpty && wTBSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetT,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.thirdTieBreakValueCheck(wTBSetT.text.toString(), lTBSetT.text.toString());
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
                                    ),
                                    provider.winnerTotalCount == 3 && provider.loserTotalCount == 0 || provider.winnerTotalCount == 0 && provider.loserTotalCount == 3 ?
                                    const SizedBox() :
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
                                                  border: Border.all(
                                                    color: provider.forthVCheck == true ? MyAppTheme.MainColor : lSetFourth.text.isNotEmpty && wSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetFourth,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetFourth.text = "7";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetFourth.text = "5";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else if(lSetFourth.text == "7" || lSetFourth.text == "5") {
                                                      setState(() {
                                                        lSetFourth.text = "";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetFourth.text = "";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }
                                                    provider.furthValueCheck(wSetFourth.text.toString(), lSetFourth.text.toString());
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
                                                  border: Border.all(
                                                    color: provider.forthVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetFourth.text.isNotEmpty && wSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetFourth,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetFourth.text = "7";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetFourth.text = "5";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else if(wSetFourth.text == "7" || wSetFourth.text == "5") {
                                                      setState(() {
                                                        wSetFourth.text = "";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetFourth.text = "";
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetFourth.text = "";
                                                        lTBSetFourth.text = "";
                                                      });
                                                    }
                                                    provider.furthValueCheck(wSetFourth.text.toString(), lSetFourth.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.forthTBVCheck == true ? MyAppTheme.MainColor : lTBSetFourth.text.isNotEmpty && wTBSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetFourth,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {

                                                        provider.furthTieBreakValueCheck(wTBSetFourth.text.toString(), lTBSetFourth.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.forthTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetFourth.text.isNotEmpty && wTBSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetFourth,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.furthTieBreakValueCheck(wTBSetFourth.text.toString(), lTBSetFourth.text.toString());
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
                                    ),
                                    provider.winnerTotalCount == 2 && provider.loserTotalCount == 2
                                        || provider.winnerTotalCount == 3 && provider.loserTotalCount == 2
                                        || provider.winnerTotalCount == 2 && provider.loserTotalCount == 3
                                        ?
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: width,
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(bottom: 5.0),
                                                child: Text('Super Tie-Break',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16,
                                                      color: MyAppTheme.black_Color,
                                                      fontFamily: Fonts.nunito,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: width* 0.20,
                                                child:  Center(
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      border: Border.all(
                                                        color: provider.superTieBreakerVCheck == true ? MyAppTheme.MainColor : secSuperTieBLSet.text.isNotEmpty && secSuperTieBWSet.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: secSuperTieBWSet,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            secSuperTieBLSet.text = "7";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            secSuperTieBLSet.text = "5";
                                                          });
                                                        }else if(secSuperTieBLSet.text == "7" || secSuperTieBLSet.text == "5") {
                                                          setState(() {
                                                            secSuperTieBLSet.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            secSuperTieBWSet.text = "";
                                                          });
                                                        }
                                                        provider.superTieBreakerValueCheck(secSuperTieBWSet.text.toString(), secSuperTieBLSet.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.superTieBreakerVCheck == true ? MyAppTheme.colorinactiveTrackColor : secSuperTieBLSet.text.isNotEmpty && secSuperTieBWSet.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: secSuperTieBLSet,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            secSuperTieBWSet.text = "7";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            secSuperTieBWSet.text = "5";
                                                          });
                                                        }else if(secSuperTieBWSet.text == "7" || secSuperTieBWSet.text == "5") {
                                                          setState(() {
                                                            secSuperTieBWSet.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            secSuperTieBLSet.text = "";
                                                          });
                                                        }
                                                        provider.superTieBreakerValueCheck(secSuperTieBWSet.text.toString(), secSuperTieBLSet.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                            ],
                                          )
                                        ],
                                      ),
                                    ) :const SizedBox(),
                                  ],
                                )


                                    :const SizedBox(),


                                dropdownSets == "Set 5" ?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.MainColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(lSetF.text == "7" || lSetF.text == "5") {
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.fVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetF.text.isNotEmpty && wSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetF,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetF.text = "7";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetF.text = "5";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if(wSetF.text == "7" || wSetF.text == "5") {
                                                      setState(() {
                                                        wSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetF.text = "";
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetF.text = "";
                                                        lTBSetF.text = "";
                                                      });
                                                    }
                                                    provider.firstValueCheck(wSetF.text.toString(), lSetF.text.toString());
                                                    print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.MainColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                      border: Border.all(
                                                        color: provider.fTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : wTBSetF.text.isNotEmpty && lTBSetF.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetF,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.firstTieBreakValueCheck(wTBSetF.text.toString(), lTBSetF.text.toString());
                                                        print("winner count ${provider.fWCount} loser count ${provider.fLCount}");
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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.MainColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(lSetS.text == "7" || lSetS.text == "5") {
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                  border: Border.all(
                                                    color: provider.sVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetS.text.isNotEmpty && wSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetS,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetS.text = "7";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetS.text = "5";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if(wSetS.text == "7" || wSetS.text == "5") {
                                                      setState(() {
                                                        wSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetS.text = "";
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetS.text = "";
                                                        lTBSetS.text = "";
                                                      });
                                                    }
                                                    provider.secondValueCheck(wSetS.text.toString(), lSetS.text.toString());
                                                    print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.MainColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                                      border: Border.all(
                                                        color: provider.sTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetS.text.isNotEmpty && wTBSetS.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetS,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.secondTieBreakValueCheck(wTBSetS.text.toString(), lTBSetS.text.toString());
                                                        print("winner count ${provider.sWCount} loser count ${provider.sLCount}");

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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child:  Row(
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
                                                  border: Border.all(
                                                    color: provider.tVCheck == true ? MyAppTheme.MainColor : lSetT.text.isNotEmpty && wSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: wSetT,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        lSetT.text = "7";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        lSetT.text = "5";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(lSetT.text == "7" || lSetT.text == "5") {
                                                      setState(() {
                                                        lSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        wSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }
                                                    provider.thirdValueCheck(wSetT.text.toString(), lSetT.text.toString());
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
                                                  border: Border.all(
                                                    color: provider.tVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetT.text.isNotEmpty && wSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(1),
                                                  ],
                                                  controller: lSetT,
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (value) {
                                                    print(value);
                                                    if(value == "5"){
                                                      setState(() {
                                                        wSetT.text = "7";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(value == "7"){
                                                      setState(() {
                                                        wSetT.text = "5";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if(wSetT.text == "7" || wSetT.text == "5") {
                                                      setState(() {
                                                        wSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else if (value == "8" || value == "9"){
                                                      setState(() {
                                                        lSetT.text = "";
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }else {
                                                      setState(() {
                                                        wTBSetT.text = "";
                                                        lTBSetT.text = "";
                                                      });
                                                    }
                                                    provider.thirdValueCheck(wSetT.text.toString(), lSetT.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.tTBVCheck == true ? MyAppTheme.MainColor : lTBSetT.text.isNotEmpty && wTBSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: wTBSetT,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.thirdTieBreakValueCheck(wTBSetT.text.toString(), lTBSetT.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.tTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetT.text.isNotEmpty && wTBSetT.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(2),
                                                      ],
                                                      controller: lTBSetT,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        provider.thirdTieBreakValueCheck(wTBSetT.text.toString(), lTBSetT.text.toString());
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
                                    ),
                                    provider.winnerTotalCount == 3 && provider.loserTotalCount == 0 || provider.winnerTotalCount == 0 && provider.loserTotalCount == 3 ?
                                    const SizedBox() :
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
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
                                                      border: Border.all(
                                                        color: provider.forthVCheck == true ? MyAppTheme.MainColor : lSetFourth.text.isNotEmpty && wSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: wSetFourth,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            lSetFourth.text = "7";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            lSetFourth.text = "5";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else if(lSetFourth.text == "7" || lSetFourth.text == "5") {
                                                          setState(() {
                                                            lSetFourth.text = "";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            wSetFourth.text = "";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else {
                                                          setState(() {
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }
                                                        provider.furthValueCheck(wSetFourth.text.toString(), lSetFourth.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.forthVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetFourth.text.isNotEmpty && wSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: lSetFourth,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            wSetFourth.text = "7";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            wSetFourth.text = "5";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else if(wSetFourth.text == "7" || wSetFourth.text == "5") {
                                                          setState(() {
                                                            wSetFourth.text = "";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            lSetFourth.text = "";
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }else {
                                                          setState(() {
                                                            wTBSetFourth.text = "";
                                                            lTBSetFourth.text = "";
                                                          });
                                                        }
                                                        provider.furthValueCheck(wSetFourth.text.toString(), lSetFourth.text.toString());
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
                                                          border: Border.all(
                                                            color: provider.forthTBVCheck == true ? MyAppTheme.MainColor : lTBSetFourth.text.isNotEmpty && wTBSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          textAlign: TextAlign.center,
                                                          inputFormatters: [
                                                            LengthLimitingTextInputFormatter(2),
                                                          ],
                                                          controller: wTBSetFourth,
                                                          keyboardType: TextInputType.number,
                                                          onChanged: (value) {

                                                            provider.furthTieBreakValueCheck(wTBSetFourth.text.toString(), lTBSetFourth.text.toString());
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
                                                          border: Border.all(
                                                            color: provider.forthTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetFourth.text.isNotEmpty && wTBSetFourth.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          textAlign: TextAlign.center,
                                                          inputFormatters: [
                                                            LengthLimitingTextInputFormatter(2),
                                                          ],
                                                          controller: lTBSetFourth,
                                                          keyboardType: TextInputType.number,
                                                          onChanged: (value) {
                                                            provider.furthTieBreakValueCheck(wTBSetFourth.text.toString(), lTBSetFourth.text.toString());
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
                                        ),
                                        provider.winnerTotalCount == 3 && provider.loserTotalCount == 1 || provider.winnerTotalCount == 1 && provider.loserTotalCount == 3 ?
                                        const SizedBox() :
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
                                                      border: Border.all(
                                                        color: provider.fiveVCheck == true ? MyAppTheme.MainColor : lSetFive.text.isNotEmpty && wSetFive.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: wSetFive,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            lSetFive.text = "7";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            lSetFive.text = "5";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else if(lSetFive.text == "7" || lSetFive.text == "5") {
                                                          setState(() {
                                                            lSetFive.text = "";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            wSetFive.text = "";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else {
                                                          setState(() {
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }
                                                        provider.fiveValueCheck(wSetFive.text.toString(), lSetFive.text.toString());
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
                                                      border: Border.all(
                                                        color: provider.fiveVCheck == true ? MyAppTheme.colorinactiveTrackColor : lSetFive.text.isNotEmpty && wSetFive.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      controller: lSetFive,
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (value) {
                                                        print(value);
                                                        if(value == "5"){
                                                          setState(() {
                                                            wSetFive.text = "7";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else if(value == "7"){
                                                          setState(() {
                                                            wSetFive.text = "5";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else if(wSetFive.text == "7" || wSetFive.text == "5") {
                                                          setState(() {
                                                            wSetFive.text = "";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else if (value == "8" || value == "9"){
                                                          setState(() {
                                                            lSetFive.text = "";
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }else {
                                                          setState(() {
                                                            wTBSetFive.text = "";
                                                            lTBSetFive.text = "";
                                                          });
                                                        }
                                                        provider.fiveValueCheck(wSetFive.text.toString(), lSetFive.text.toString());
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
                                                          border: Border.all(
                                                            color: provider.fiveTBVCheck == true ? MyAppTheme.MainColor : lTBSetFive.text.isNotEmpty && wTBSetFive.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          textAlign: TextAlign.center,
                                                          inputFormatters: [
                                                            LengthLimitingTextInputFormatter(2),
                                                          ],
                                                          controller: wTBSetFive,
                                                          keyboardType: TextInputType.number,
                                                          onChanged: (value) {
                                                            provider.fiveTieBreakValueCheck(wTBSetFive.text.toString(), lTBSetFive.text.toString());
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
                                                          border: Border.all(
                                                            color: provider.fiveTBVCheck == true ? MyAppTheme.colorinactiveTrackColor : lTBSetFive.text.isNotEmpty && wTBSetFive.text.isNotEmpty ? MyAppTheme.CategoryBGSelectColor : MyAppTheme.listBGColor,
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          textAlign: TextAlign.center,
                                                          inputFormatters: [
                                                            LengthLimitingTextInputFormatter(2),
                                                          ],
                                                          controller: lTBSetFive,
                                                          keyboardType: TextInputType.number,
                                                          onChanged: (value) {
                                                            provider.fiveTieBreakValueCheck(wTBSetFive.text.toString(), lTBSetFive.text.toString());
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
                                                ) :const SizedBox(),
                                              ),

                                            ],
                                          ),
                                        )
                                      ],
                                    )

                                  ],
                                )
                                    :const SizedBox(),
                              ],
                            ):const SizedBox()
                       
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
                          if(matchsStatus == "played"){
                            setValueSendData(provider.winnerTotalCount,provider.loserTotalCount);
                            var json1 = setValueSet.map((e){
                              return {
                                "winner" : e.winner,
                                "loser" : e.loser,
                                "tie_winner" : e.tie_winner,
                                "tie_loser" : e.tie_loser
                              };
                            }).toList();
                            print("$WinnerUUID        ${matchsStatus!}      ${json.encode(json1)}   $selectSIndex",);
                            saveData(context,provider.fTB,provider.fTBVCheck,provider.sTB,provider.sTBVCheck,provider.tTB,provider.tTBVCheck,provider.forthTB,provider.forthTBVCheck,provider.fiveTB,provider.fiveTBVCheck,WinnerUUID,matchsStatus!,json.encode(json1),provider.winnerTotalCount,provider.loserTotalCount,scoreStatus,dropdownValue!);
                          }else {
                            print("$WinnerUUID        ${matchsStatus!}      ${setEmptyValueSet.toString()}   $dropdownValue!",);
                            ScoreBottomDilog(context,WinnerUUID,matchsStatus!,setEmptyValueSet.toString(),scoreStatus,dropdownValue!);
                          }

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
  void saveData(BuildContext context,bool firstTieBreak,bool firstTBValue,bool secondTieBreak,bool secondTBValue,bool thirdTieBreak,bool thirdTBValue,bool forthTieBreak,bool forthTBValue,bool fiveTieBreak,bool fiveTBValue,String winnerUuid,String status,String score,int winnerCount,int loserCount,String scoreStatus,String winnerName){
    KeyboardUtil.hideKeyboard(context);
    if (dropdownSets == "Set 1"){
        if(firstTieBreak == true ){
          if(wTBSetF.text != '' && lTBSetF.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else {
          if(wSetF.text != '' && lSetF.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }else if (dropdownSets == "Set 2"){
      if(winnerCount == 1 && loserCount == 1){
        if(firstTieBreak == true && secondTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && superTieBWSet.text != '' && superTieBLSet.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wSetS.text != '' && lSetS.text != '' && superTieBWSet.text != '' && superTieBLSet.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else if(firstTieBreak == false && secondTieBreak == true){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wSetF.text != '' && lSetF.text != '' && superTieBWSet.text != '' && superTieBLSet.text != ''){
            if(secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && superTieBWSet.text != '' && superTieBLSet.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }else {
        if(firstTieBreak == true && secondTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wSetS.text != '' && lSetS.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else if(firstTieBreak == false && secondTieBreak == true){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wSetF.text != '' && lSetF.text != ''){
            if(secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }
    }else if (dropdownSets == "Set 3"){
      if(winnerCount == 1 && loserCount == 1){
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''&& wSetT.text != '' && lSetT.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == false){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wSetF.text != '' && lSetF.text != '' && wSetT.text != '' && lSetT.text != ''){
            if(secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetF.text != '' && lSetF.text != '' ){
            if(secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true){
          if(wTBSetT.text != '' && lTBSetT.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != ''){
            if(thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }

      }else {
        if(firstTieBreak == true && secondTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wSetS.text != '' && lSetS.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else if(firstTieBreak == false && secondTieBreak == true){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wSetF.text != '' && lSetF.text != ''){
            if(secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }

    }else if (dropdownSets == "Set 4"){
      if(winnerCount == 2 && loserCount == 2){
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != ''  && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true ){
          if(wTBSetF.text != '' && lTBSetF.text != ''  && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == false && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''  && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false ){
          if(wSetF.text != '' && lSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true ){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(secondTBValue == true && thirdTBValue == true && forthTBValue == true && fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true && forthTieBreak == true ){
          if( wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true ){
          if(wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            if(forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && secSuperTieBWSet.text != '' && secSuperTieBLSet.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }else if (winnerCount == 3 && loserCount == 0 || winnerCount == 0 && loserCount == 3){
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' ){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true ){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != ''  && wSetF.text != '' && lSetF.text != '' ){
            if(secondTBValue == true && thirdTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true ){
          if( wTBSetT.text != '' && lTBSetT.text != ''  && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' ){
            if(thirdTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == false ){
          if( wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' ){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' ){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }else {
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' ){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != ''  && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true ){
          if(wTBSetF.text != '' && lTBSetF.text != ''  && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' ){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == false && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''  && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false ){
          if(wSetF.text != '' && lSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true ){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' ){
            if(secondTBValue == true && thirdTBValue == true && forthTBValue == true && fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true && forthTieBreak == true ){
          if( wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' ){
            if(thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true ){
          if(wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' ){
            if(forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }
    }else if(dropdownSets == "Set 5"){
      if (winnerCount == 3 && loserCount == 0 || winnerCount == 0 && loserCount == 3){
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''&& wSetT.text != '' && lSetT.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == false){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wSetF.text != '' && lSetF.text != '' && wSetT.text != '' && lSetT.text != ''){
            if(secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetF.text != '' && lSetF.text != '' ){
            if(secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true){
          if(wTBSetT.text != '' && lTBSetT.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != ''){
            if(thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }

      }else if(winnerCount == 3 && loserCount == 1 || winnerCount == 1 && loserCount == 3){
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != ''){
            if(firstTBValue == true &&  forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false){
          if(wSetF.text != '' && lSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != ''){
            if(secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != ''  && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == false && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''  && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false ){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' ){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true ){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' ){
            if(secondTBValue == true && thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true && forthTieBreak == true ){
          if( wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' ){
            if(thirdTBValue == true && forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true ){
          if(wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' ){
            if(forthTBValue == true ){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        } else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }else {
        if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true && fiveTieBreak == true){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wTBSetFive.text != '' && lTBSetFive.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true && forthTBValue == true && fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == false && fiveTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != ''  && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && wSetFive.text != '' && lSetFive.text != ''){
            if(firstTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == false && forthTieBreak == false && fiveTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != ''  && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && wSetFive.text != '' && lSetFive.text != ''){
            if(firstTBValue == true && secondTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == false && fiveTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && wSetFive.text != '' && lSetFive.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == true && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true && fiveTieBreak == false){
          if(wTBSetF.text != '' && lTBSetF.text != '' && wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != '' && wSetFive.text != '' && lSetFive.text != ''){
            if(firstTBValue == true && secondTBValue == true && thirdTBValue == true && forthTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == true && thirdTieBreak == true && forthTieBreak == true && fiveTieBreak == true){
          if(wTBSetS.text != '' && lTBSetS.text != '' && wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != ''&& wTBSetFive.text != '' && lTBSetFive.text != '' && wSetF.text != '' && lSetF.text != '' ){
            if(secondTBValue == true && thirdTBValue == true && forthTBValue == true && fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == true && forthTieBreak == true && fiveTieBreak == true){
          if( wTBSetT.text != '' && lTBSetT.text != '' && wTBSetFourth.text != '' && lTBSetFourth.text != ''&& wTBSetFive.text != '' && lTBSetFive.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' ){
            if(thirdTBValue == true && forthTBValue == true && fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == true && fiveTieBreak == true){
          if(wTBSetFourth.text != '' && lTBSetFourth.text != ''&& wTBSetFive.text != '' && lTBSetFive.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' ){
            if(forthTBValue == true && fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }else if(firstTieBreak == false && secondTieBreak == false && thirdTieBreak == false && forthTieBreak == false && fiveTieBreak == true){
          if(wTBSetFive.text != '' && lTBSetFive.text != '' && wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != ''){
            if(fiveTBValue == true){
              ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
              print('api call true');
            }else {
              ScoreInvalideBottomDilog(context);
            }
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
        else {
          if(wSetF.text != '' && lSetF.text != '' && wSetS.text != '' && lSetS.text != '' && wSetT.text != '' && lSetT.text != '' && wSetFourth.text != '' && lSetFourth.text != '' && wSetFive.text != '' && lSetFive.text != ''){
            ScoreBottomDilog(context,winnerUuid,status,score,scoreStatus,winnerName);
            print('api call true');
          }else {
            ScoreInvalideBottomDilog(context);
          }
        }
      }

    }
  }

}
class ScoreCard{  //modal class
  String? winner, loser, tie_winner,tie_loser;
  ScoreCard({
   this.winner,
    this.loser,
    this.tie_winner,
    this.tie_loser
  });
}