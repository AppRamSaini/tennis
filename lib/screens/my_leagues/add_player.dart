import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/bottomdilog/add_player.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/addplayer_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class AddPlayer extends StatefulWidget {
  String league_uuid;
  String league_name;
  AddPlayer({Key? key,required this.league_uuid,required this.league_name}) : super(key: key);

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  @override
  void initState() {
    // TODO: implement initState
    locator<AddPlayerProvider>().clearData();
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
    List playerList = Provider.of<AddPlayerProvider>(context).playerList;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Consumer<AddPlayerProvider>(
        builder: (context, provider, child) {
          return Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 15.0),
            child: Column(
              children: [
                Container(
                    height: 50,
                    width: width,
                    padding: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        color: MyAppTheme.whiteColor,
                        border: Border.all(
                          color: MyAppTheme.MainColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      onChanged: (value) => {
                       if(value.length > 3){
                         provider.searchPlayerList(context,widget.league_uuid,value)
                       }else {
                         provider.changePlayerInvite()
                       }
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'search player with whatsApp number',
                          suffixIcon: Icon(Icons.search,color: Colors.black,),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: MyAppTheme.DesBlackColor,
                            fontFamily: Fonts.nunito,
                          )),
                    )


                ),
                const SizedBox(height: 10,),
                playerList.isNotEmpty ?
                    Expanded(child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: playerList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Column (
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          playerList[index]['profile_photo_url'] != "" ? Container(
                                              width: 50,
                                              height: 50,
                                              margin: const EdgeInsets.only(right: 10.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: Center(
                                                    child: FadeInImage(
                                                      image: NetworkImage(playerList[index]['profile_photo_url']),
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                      height: 100,
                                                      placeholder: const AssetImage("assets/images/image_defult.png"),
                                                      imageErrorBuilder: (context,
                                                          error, stackTrace) {
                                                        return Image.asset(
                                                          "assets/images/image_defult.png",
                                                        );
                                                      },
                                                    )),
                                              )) :
                                          Container(
                                            width: 50,
                                            height: 50,
                                            margin: const EdgeInsets.only(right: 10.0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/image_defult.png"),
                                                  fit: BoxFit.fill
                                              ),
                                            ),
                                          ),
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children:  [
                                               Text(
                                                 '${playerList[index]['name']}',
                                                 style: const TextStyle(
                                                   fontWeight: FontWeight.w700,
                                                   fontSize: 16,
                                                   color: MyAppTheme.black_Color,
                                                   fontFamily: Fonts.nunito,
                                                 ),
                                               ),
                                               Text(
                                                 '+91 ${playerList[index]['phone']}',
                                                 style: const TextStyle(
                                                   fontWeight: FontWeight.w400,
                                                   fontSize: 14,
                                                   color: MyAppTheme.DesBlackColor,
                                                   fontFamily: Fonts.nunito,
                                                 ),
                                               ),
                                             ],
                                           )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: (){
                                          AddPlayerBottomDilog(context,widget.league_name,widget.league_uuid,'${playerList[index]['uuid']}');
                                          KeyboardUtil.hideKeyboard(context);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration:  BoxDecoration(
                                              color: MyAppTheme.MainColor,
                                              border: Border.all(
                                                  color: MyAppTheme.MainColor,
                                                  width : 1
                                              ),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(5))),
                                          child:  const Center(
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: MyAppTheme.whiteColor,
                                                fontFamily: Fonts.nunito,),
                                            ),
                                          ),
                                        ),
                                      )


                                    ],
                                  ),
                                  Container(
                                    width: width,
                                    height: 1,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    color: MyAppTheme.LineColor,
                                  )
                                ],
                              )

                          );
                        }))
                : provider.playerSearch == true ?
                Container(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:   [
                          Text(
                            '+91 '+provider.number,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: MyAppTheme.black_Color,
                              fontFamily: Fonts.nunito,
                            ),
                          ),
                          const Text(
                            'This user does not exist, please invite first and add after join Tennis Khelo',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: MyAppTheme.DesBlackColor,
                              fontFamily: Fonts.nunito,
                            ),
                          ),
                        ],
                      )),
                      provider.inviteBtn == true ?
                      InkWell(
                        onTap: (){
                          provider.shareWhatsApp(context, "+91"+provider.number,widget.league_name);
                          provider.addLeaguesInvitePlayer(context,widget.league_uuid,provider.number);
                        },
                        child:Container(
                          height: 30,
                          width: 80,
                          margin: EdgeInsets.only(left: 10.0),
                          decoration:  BoxDecoration(
                              color: MyAppTheme.AcceptBgColor,
                              border: Border.all(
                                  color: MyAppTheme.AcceptBgColor,
                                  width : 1
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5))),
                          child:  const Center(
                            child: Text(
                              'Invite',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: MyAppTheme.whiteColor,
                                fontFamily: Fonts.nunito,),
                            ),
                          ),
                        ),
                      ) : SizedBox(width: 80,)


                    ],
                  ),
                ) :SizedBox()
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
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text('Add Player',
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
