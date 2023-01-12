import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/drawer/drawer_bar.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.MainColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key, // Assign the key to Scaffold.
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/empty_upcoming.svg',
                allowDrawingOutsideViewBox: true,
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text('Coming Soon',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: MyAppTheme.DesBlackColor,
                        fontFamily: Fonts.nunito,
                      ))),
            ],
          ),
        /*ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Center(
                                    child: FadeInImage(
                                      image: NetworkImage("https://phpdemo.futureprofilez.com/ankesh/jdt/blogs/wp-content/uploads/2022/12/tenishimg02.jpg"),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width * 0.20,
                                      height: 70,
                                      placeholder: const AssetImage("assets/images/t_ball.png"),
                                      imageErrorBuilder: (context,
                                          error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/t_ball.png",
                                        );
                                      },
                                    )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.50,
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "U-19 Jaipur Open 2022",
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: SvgPicture.asset(
                                              'assets/icons/calender.svg',
                                              allowDrawingOutsideViewBox: true,
                                              height: 15,
                                              width: 15,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.40,
                                            child: const Text(
                                              "24-Nov-22  to  22-Jan-23",
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: MyAppTheme.DesBlackColor,
                                                fontFamily: Fonts.nunito,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: SvgPicture.asset(
                                              'assets/icons/map.svg',
                                              allowDrawingOutsideViewBox: true,
                                              height: 15,
                                              width: 15,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.40,
                                            child: const Text(
                                              "Pink City tennis course, Jaipur",
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: MyAppTheme.DesBlackColor,
                                                fontFamily: Fonts.nunito,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.20,
                                decoration:  const BoxDecoration(
                                    color: MyAppTheme.EditBgColor,
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "INR",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                        color: MyAppTheme.DesBlackColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                    Text(
                                      "2000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: MyAppTheme.black_Color,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                    Text(
                                      "Winner Price",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                        color: MyAppTheme.DesBlackColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                                },
                                child: Container(
                                  height: 40,
                                  decoration:   BoxDecoration(
                                      border: Border.all(
                                          color: MyAppTheme.DesBlackColor,
                                          width: 0.5
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(5))
                                  ),
                                  child:  const Center(
                                    child: Text(
                                      factsheet,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: MyAppTheme.DesBlackColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              Expanded(child: InkWell(
                                onTap: (){
                                },
                                child: Container(
                                  height: 40,
                                  margin:  const EdgeInsets.only(left: 5.0,right: 5.0),
                                  decoration:  const BoxDecoration(
                                      color: MyAppTheme.EditBgColor,
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child:  const Center(
                                    child: Text(
                                      viewRules,
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
                              Expanded(child: InkWell(
                                onTap: (){
                                },
                                child: Container(
                                  height: 40,
                                  decoration:  const BoxDecoration(
                                      color: MyAppTheme.CategoryBGSelectColor,
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child:  const Center(
                                    child: Text(
                                      participate,
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
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: width,
                      height: 1,
                      color: MyAppTheme.LineColor,
                    ),
                  ],
                );
              })*/

      ),
      drawer: DrawerBar(buildContext: context,),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _key.currentState!.openDrawer();
            }, // Image tapped
            child: Image.asset('assets/images/menu.png',width: 20,height: 15,),
          ),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            allowDrawingOutsideViewBox: true,
          ),
          const SizedBox(width: 20,height: 20,)

        ],

      ),
      backgroundColor: MyAppTheme.whiteColor,
    );
  }
}
