import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/screens/dashboard/home.dart';
import 'package:tennis/screens/dashboard/news.dart';
import 'package:tennis/screens/dashboard/setting.dart';
import 'package:tennis/screens/dashboard/upcoming.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
class DashBoard extends StatefulWidget {
  int selectedIndex;
  DashBoard({Key? key,required this.selectedIndex}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool press = false;
  DateTime pre_backpress = DateTime.now();
  List<Widget> screens = [
    Home(),
    News(),
    Upcoming(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);

        pre_backpress = DateTime.now();
        if (cantExit) {
          //show snackbar
          const snack = SnackBar(
            content: Text('Press Back button again to Exit'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: screens[widget.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                widget.selectedIndex == 0
                    ? 'assets/icons/select_home.svg'
                    : 'assets/icons/unselect_home.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                widget.selectedIndex == 1
                    ? 'assets/icons/select_news.svg'
                    : 'assets/icons/unselect_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                widget.selectedIndex == 2
                    ? 'assets/icons/select_upcoming.svg'
                    : 'assets/icons/unselect_upcoming.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
              ),
              label: 'Upcoming',
            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(
                widget.selectedIndex == 3
                    ? 'assets/icons/select_setting.svg'
                    : 'assets/icons/unselect_setting.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
              ),
              label: 'Setting',
            ),

          ],
          currentIndex: widget.selectedIndex,
          backgroundColor: MyAppTheme.whiteColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontSize: 13,
            color: MyAppTheme.MainColor,
            fontFamily: Fonts.nunito,
          ),
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontSize: 13,
            color: MyAppTheme.black_Color,
            fontFamily: Fonts.nunito,
          ),
          selectedItemColor: MyAppTheme.MainColor,
          unselectedItemColor: MyAppTheme.DesBlackColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

}

