import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: const Center(
            child: Text('upcoming',style: TextStyle(fontSize: 25,color: MyAppTheme.black_Color),),
          )

      ),
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
          Image.asset('assets/images/home_logo.png'),
          GestureDetector(
            onTap: () {}, // Image tapped
            child: Image.asset('assets/images/user_icon.png'),
          )

        ],

      ),
      backgroundColor: MyAppTheme.whiteColor,
    );
  }
}
