
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/scoreinvalide.dart';
import 'package:tennis/helpers/appconfig.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreAdd extends StatefulWidget {
  const ScoreAdd({Key? key}) : super(key: key);

  @override
  State<ScoreAdd> createState() => _ScoreAddState();
}

class _ScoreAddState extends State<ScoreAdd> {

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
  String WinnerUUID = "";
  late int selectSIndex;
  String? dropdownValue = AppConfig.AccepterName;
  String? dropdownSets;
  String? dropdownMStatus = 'Played Through';
  List setVlauest = [];
  List<Map<String, dynamic>> numOfSets = [];
  void setV(){
    setVlauest.clear();
    List<ScoreCard> firstSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      //  ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
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
    List<ScoreCard> fiveSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
      ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
      ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
      // ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    List<ScoreCard> sixSetValues = [
      ScoreCard(winner: wSetF.text.toString(), loser: lSetF.text.toString(), tie_winner: wTBSetF.text.toString(), tie_loser: lTBSetF.text.toString()),
      ScoreCard(winner: wSetS.text.toString(), loser: lSetS.text.toString(), tie_winner: wTBSetS.text.toString(), tie_loser: lTBSetS.text.toString()),
      ScoreCard(winner: wSetT.text.toString(), loser: lSetT.text.toString(), tie_winner: wTBSetT.text.toString(), tie_loser: lTBSetT.text.toString()),
      ScoreCard(winner: wSetFourth.text.toString(), loser: lSetFourth.text.toString(), tie_winner: wTBSetFourth.text.toString(), tie_loser: lTBSetFourth.text.toString()),
      ScoreCard(winner: wSetFive.text.toString(), loser: lSetFive.text.toString(), tie_winner: wTBSetFive.text.toString(), tie_loser: lTBSetFive.text.toString()),
      ScoreCard(winner: wSetSix.text.toString(), loser: lSetSix.text.toString(), tie_winner: wTBSetSix.text.toString(), tie_loser: lTBSetSix.text.toString()),
    ];
    if(dropdownSets == "Set 1"){
      setVlauest.addAll(firstSetValues);
    }else if (dropdownSets == "Set 2"){
      setVlauest.addAll(secondSetValues);
    }else if (dropdownSets == "Set 3"){
      setVlauest.addAll(thirdSetValues);
    }else if (dropdownSets == "Set 4"){
      setVlauest.addAll(fourthSetValues);
    }else if (dropdownSets == "Set 5"){
      setVlauest.addAll(fiveSetValues);
    }else if (dropdownSets == "Set 6"){
      setVlauest.addAll(sixSetValues);
    }
    print(setVlauest.map((e){
      return {
        e.winner,
        e.loser,
        e.tie_winner,
        e.tie_loser
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
    if(AppConfig.Sets == 1){
      dropdownSets = 'Set 1';
      numOfSets.addAll(oneSetsList);
    }else if (AppConfig.Sets == 2){
      dropdownSets = 'Set 2';
      numOfSets.addAll(twoSetsList);
    }else if (AppConfig.Sets == 3){
      dropdownSets = 'Set 3';
      numOfSets.addAll(threeSetsList);
    }else if (AppConfig.Sets == 4){
      dropdownSets = 'Set 4';
      numOfSets.addAll(fourSetsList);
    }else if (AppConfig.Sets == 5){
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
  ////////////////////////////////////show counting/////////////
  String winnerValue = '';
  String loserValue = '';
  bool fTB = false;
  void firstTieBreakWinner(String win,String los){
    print(win+"          "+los);
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) == 6 && int.parse(los) == 6){
        setState(() {
          winnerValue = win;
          loserValue = los;
          fTB = true;
        });
      }else {
        setState(() {
          winnerValue = win;
          loserValue = los;
          fTB = false;
        });
      }
    }
    loserTotalNumberValue();
  }
  void firstTieBreakLoser(String win,String los){
    print(win+"          "+los);
    if(win.isNotEmpty && los.isNotEmpty){
      if(int.parse(win) == 6 && int.parse(los) == 6){
        setState(() {
          winnerValue = win;
          loserValue = los;
          fTB = true;
        });
      }else {
        setState(() {
          winnerValue = win;
          loserValue = los;
          fTB = false;
        });
      }
    }
    winnerTotalNumberValue();
  }
  List<Map<String, dynamic>> winnerTotalNumber = [];
  List<Map<String, dynamic>> loserTotalNumber = [];
  void winnerTotalNumberValue(){
    List<Map<String, dynamic>> numberFive = [
      {
        "count": '7',
      },
    ];
    List<Map<String, dynamic>> numberSeven = [
      {
        "count": '5',
      },
    ];
    List<Map<String, dynamic>> numberSex = [
      {
        "count": '0',
      },
      {
        "count": '1',
      },
      {
        "count": '2',
      },
      {
        "count": '3',
      },
      {
        "count": '4',
      },
      {
        "count": '5',
      },
      {
        "count": '6',
      },
    ];
     if(loserValue == '5'){
       setState(() {
         winnerTotalNumber.clear();
         winnerTotalNumber.addAll(numberFive);
       });

     }else if (loserValue == '7'){
       setState(() {
         winnerTotalNumber.clear();
         winnerTotalNumber.addAll(numberSeven);
       });

     }else {
       setState(() {
         winnerTotalNumber.clear();
         winnerTotalNumber.addAll(numberSex);
       });

     }
  }
  void loserTotalNumberValue(){
    List<Map<String, dynamic>> numberFive = [
      {
        "count": '7',
      },
    ];
    List<Map<String, dynamic>> numberSeven = [
      {
        "count": '5',
      },
    ];
    List<Map<String, dynamic>> numberSex = [
      {
        "count": '0',
      },
      {
        "count": '1',
      },
      {
        "count": '2',
      },
      {
        "count": '3',
      },
      {
        "count": '4',
      },
      {
        "count": '5',
      },
      {
        "count": '6',
      },
    ];
    if(winnerValue == '5'){
      setState(() {
        loserTotalNumber.clear();
        loserTotalNumber.addAll(numberFive);
      });

    }else if (winnerValue == '7'){
      setState(() {
        loserTotalNumber.clear();
        loserTotalNumber.addAll(numberSeven);
      });

    }else {
      setState(() {
        loserTotalNumber.clear();
        loserTotalNumber.addAll(numberSex);
      });

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print(AppConfig.Sets);
    selectSIndex = AppConfig.Sets;
    setNoValue();
    winnerTotalNumberValue();
    loserTotalNumberValue();
    super.initState();
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
                            setState(() {
                              dropdownSets = newValue;
                            });
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
                            setState(() {
                              dropdownMStatus = newValue;
                            });
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
                                      margin: const EdgeInsets.only(top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 5.0,right: 5.0),
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
                                        child: Center(
                                          child: DropdownButton<String>(
                                            value: winnerValue == '' ? null : winnerValue,
                                            icon: const Icon(Icons.arrow_drop_down),
                                            elevation: 16,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyAppTheme.black_Color,
                                              fontFamily: Fonts.nunito,
                                            ),
                                            items: winnerTotalNumber.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                                              return DropdownMenuItem<String>(
                                                value: value['count'],
                                                child: Text(value['count']),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              if(loserValue != ''){
                                                firstTieBreakWinner(newValue!,loserValue);
                                              }else {
                                                setState((){
                                                  winnerValue = newValue!;
                                                  loserTotalNumberValue();
                                                });
                                              }

                                            },
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.20,
                                child: Center(
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: const EdgeInsets.only(top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 5.0,right: 5.0),
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
                                        child: Center(
                                          child: DropdownButton<String>(
                                            value: loserValue == '' ? null : loserValue,
                                            icon: const Icon(Icons.arrow_drop_down),
                                            elevation: 16,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyAppTheme.black_Color,
                                              fontFamily: Fonts.nunito,
                                            ),
                                            items: loserTotalNumber.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                                              return DropdownMenuItem<String>(
                                                value: value['count'],
                                                child: Text(value['count']),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              if(winnerValue != ''){
                                                firstTieBreakLoser(winnerValue,newValue!);
                                              }else {
                                                setState((){
                                                  loserValue = newValue!;
                                                  winnerTotalNumberValue();
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: width* 0.40,
                                child: fTB ==  true ?   Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          margin: const EdgeInsets.only(top: 5.0,right: 5.0),
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
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
                                            child: Center(
                                              child: DropdownButton<String>(
                                                value: winnerValue,
                                                icon: const Icon(Icons.arrow_drop_down),
                                                elevation: 16,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: MyAppTheme.black_Color,
                                                  fontFamily: Fonts.nunito,
                                                ),
                                                items: winnerTotalNumber.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value['count'],
                                                    child: Text(value['count']),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    winnerValue = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          )),
                                      Container(
                                          width: 50,
                                          height: 50,
                                          margin: const EdgeInsets.only(top: 5.0,left: 5.0),
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
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
                                            child: Center(
                                              child: DropdownButton<String>(
                                                value: winnerValue,
                                                icon: const Icon(Icons.arrow_drop_down),
                                                elevation: 16,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: MyAppTheme.black_Color,
                                                  fontFamily: Fonts.nunito,
                                                ),
                                                items: loserTotalNumber.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value['count'],
                                                    child: Text(value['count']),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    winnerValue = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ): SizedBox(),
                              ),

                            ],
                          ),
                        ),
                        dropdownSets == "Set 2" || dropdownSets == "Set 3" || dropdownSets == "Set 4"
                            || dropdownSets == "Set 5" || dropdownSets == "Set 6" ?
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
                        dropdownSets == "Set 3" || dropdownSets == "Set 4"
                            || dropdownSets == "Set 5" || dropdownSets == "Set 6" ?
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
                        dropdownSets == "Set 4" || dropdownSets == "Set 5" || dropdownSets == "Set 6" ?
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
                        dropdownSets == "Set 5" || dropdownSets == "Set 6" ?
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
                        dropdownSets == "Set 6" ?
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
                          print(wSetF.text.toString());
                          setV();
                          /*  print(setValues.map((e){
                             return {
                               "winner": e.winner,
                               "loser": e.loser,
                               "tie_winner": e.tie_winner,
                               "tie_loser": e.tie_loser
                             };
                           }).toList());*/
                          //KeyboardUtil.hideKeyboard(context);
                          // saveData(context,provider);
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
          child: Text("New Score card",
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
class ScoreCard{  //modal class
  String? winner, loser, tie_winner,tie_loser;
  ScoreCard({
    this.winner,
    this.loser,
    this.tie_winner,
    this.tie_loser
  });
}