import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/myleagues_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/home/view_ranking_challenge.dart';
import 'package:tennis/screens/my_leagues/create_leagues.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class MyLeagues extends StatefulWidget {
  const MyLeagues({Key? key}) : super(key: key);

  @override
  State<MyLeagues> createState() => _MyLeaguesState();
}

class _MyLeaguesState extends State<MyLeagues> {
  @override
  void initState() {
    // TODO: implement initState
    locator<MyLeaguesProvider>().leaguesPermissionStatus(context);
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
    bool isLoading = Provider.of<MyLeaguesProvider>(context).isLoading;
    return Consumer<MyLeaguesProvider>(
      builder: (context, provider, child) {
        return (isLoading)
            ? Progressbar()
            :
          Scaffold(
          appBar: buildAppBar(context),
          backgroundColor: MyAppTheme.whiteColor,
          body: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10.0),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: MyAppTheme.listBorderColor, //New
                                  blurRadius: 5.0,
                                )
                              ],
                              color: MyAppTheme.whiteColor,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  const Text(
                                    'U-19 Jaipur Open 2022',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                  PopupMenuButton(
                                      child: SizedBox(width: 20,height: 20,
                                        child:  Image.asset("assets/images/more.png"),),
                                      itemBuilder: (context){
                                        return [
                                          PopupMenuItem(
                                              height: provider.userRequest == "Approved" ? 30 : 0,
                                              value: 1,
                                              child: provider.userRequest == "Approved" ?
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children:  <Widget>[
                                                    SvgPicture.asset(
                                                      'assets/icons/edit_details.svg',
                                                      allowDrawingOutsideViewBox: true,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    const Padding(padding: EdgeInsets.only(left: 10),
                                                      child: Text(editDetails,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 13,
                                                            color: MyAppTheme.black_Color,
                                                            fontFamily: Fonts.nunito,
                                                          )),)
                                                  ],
                                                ),
                                              ) : SizedBox()
                                          ),
                                          PopupMenuItem(
                                              height: provider.userRequest == "Approved" ? 30 : 0,
                                              value: 2,
                                              child: provider.userRequest == "Approved" ?
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children:  <Widget>[
                                                    SvgPicture.asset(
                                                      'assets/icons/add_player.svg',
                                                      allowDrawingOutsideViewBox: true,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    const Padding(padding: EdgeInsets.only(left: 10),
                                                      child: Text(addPlayer,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 13,
                                                            color: MyAppTheme.black_Color,
                                                            fontFamily: Fonts.nunito,
                                                          )),)
                                                  ],
                                                ),
                                              ) :SizedBox()
                                          ),
                                          PopupMenuItem(
                                              height: 30,
                                              value: 3,
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);

                                                },
                                                child: Row(
                                                  children:  <Widget>[
                                                    SvgPicture.asset(
                                                      'assets/icons/league_details.svg',
                                                      allowDrawingOutsideViewBox: true,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    const Padding(padding: EdgeInsets.only(left: 10),
                                                      child: Text(leagueDetails,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 13,
                                                            color: MyAppTheme.black_Color,
                                                            fontFamily: Fonts.nunito,
                                                          )),)
                                                  ],
                                                ),
                                              )
                                          ),
                                          PopupMenuItem(
                                              height: provider.userRequest == "Approved" ? 30 : 0,
                                              value: 4,
                                              child: provider.userRequest == "Approved" ?
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children:  <Widget>[
                                                    SvgPicture.asset(
                                                      'assets/icons/delete_league.svg',
                                                      allowDrawingOutsideViewBox: true,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    const Padding(padding: EdgeInsets.only(left: 10),
                                                      child: Text(deleteLeague,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 13,
                                                            color: MyAppTheme.CategoryBGSelectColor,
                                                            fontFamily: Fonts.nunito,
                                                          )),)
                                                  ],
                                                ),
                                              ) :SizedBox()
                                          ),

                                        ];
                                      })
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    '04 Members',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ViewRankingChallenge(name: 'Under 12',)),
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: width,
                                  margin: const EdgeInsets.only(right: 5.0,top: 10.0,),
                                  decoration: const BoxDecoration(
                                      color: MyAppTheme.MainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Center(
                                    child: Text(
                                      'View Rankings / challenge',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyAppTheme.whiteColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                 /* Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/empty_my_league.svg',
                        allowDrawingOutsideViewBox: true,
                      ),

                    ],
                  )),*/
                  SizedBox(height: provider.userRequest == "null" ? 130 :provider.userRequest == "Approved" ? 0 : 100,)
                ],
              )

          ),
          floatingActionButton: provider.userRequest == "Approved" ? FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateLeagues()),
              );
            },
            backgroundColor: MyAppTheme.MainColor,
            child: const Icon(Icons.add),
          ):const SizedBox(),
          bottomSheet: provider.userRequest == "Approved" ? const SizedBox(): Container(
            width: width,
            height: provider.userRequest == "null" ? 130 : 100,
            padding: EdgeInsets.all(5),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ques.svg',
                      allowDrawingOutsideViewBox: true,
                      height: 20,
                      width: 20,
                    ),
                     Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: provider.userRequest == "null" ? const Text(
                            requestForCreateLeagues,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: MyAppTheme.DesBlackColor,
                              fontFamily: Fonts.nunito,
                            )):const Text(
                            requestForSendCreateLeagues,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: MyAppTheme.DesBlackColor,
                              fontFamily: Fonts.nunito,
                            )))) ,
                  ],
                ),
                InkWell(
                  onTap: (){
                    if(provider.userRequest == "null"){
                     provider.requestLeaguePermission(context);
                    }

                  },
                  child: Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration:  BoxDecoration(
                        color: provider.userRequest == "null" ?  MyAppTheme.MainColor:MyAppTheme.PendingRequestBgColor,
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child:  Center(
                      child: provider.userRequest == "null" ? const Text(
                        requestNow,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: MyAppTheme.whiteColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ): const Text(
                        requestPending,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    )
      ;
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text('My Leagues',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: MyAppTheme.whiteColor,
                fontFamily: Fonts.nunito,
              ))),
      leading: IconButton(
        icon: SvgPicture.asset(
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
      actions: [],
      backgroundColor: MyAppTheme.MainColor,
    );
  }
}
