import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/score_card/add_score.dart';
import 'package:tennis/screens/score_card/sets.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Winner extends StatefulWidget {

  const Winner({Key? key}) : super(key: key);

  @override
  State<Winner> createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  List<String> playerList = [
    'Ram',
    'Raju'
  ];
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
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                      child: const Text(selectWinnerPlayerName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: MyAppTheme.black_Color,
                          fontFamily: Fonts.nunito,
                        ),),
                    ),
                    Expanded(child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: playerList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              provider.selectWinnerIndex(index,playerList[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(top: 10.0),
                              decoration:  BoxDecoration(
                                color: MyAppTheme.listBGColor,
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  width: 1,
                                  color: provider.selectWIndex == index ? MyAppTheme.MainColor : MyAppTheme.listBorderColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    playerList[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.black_Color,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                  provider.selectWIndex == index ?
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.MainColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/check.svg',
                                        allowDrawingOutsideViewBox: true,
                                        height: 20,
                                        width: 20,
                                        color: MyAppTheme.whiteColor,
                                      ),
                                    ),
                                  ):
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration:  BoxDecoration(
                                      color: MyAppTheme.listBGColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: MyAppTheme.listBorderColor,
                                        style: BorderStyle.solid,
                                      ),
                                    ),

                                  )
                                ],
                              ),
                            ),
                          )
                            ;
                        }))
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sets()),
                      );

                    },
                    child: Container(
                      width: width,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      decoration:  BoxDecoration(
                          color: provider.selectWIndex == -1 ? MyAppTheme.listNextBgColor : MyAppTheme.MainColor,
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: const Center(
                        child: Text(
                          next,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: MyAppTheme.whiteColor,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )

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
          child: Text('Winner',
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
}
