import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
class TermsWebView extends StatefulWidget {
  const TermsWebView({Key? key}) : super(key: key);

  @override
  State<TermsWebView> createState() => _TermsWebViewState();
}

class _TermsWebViewState extends State<TermsWebView> {
  bool isLoading=true;
  final _key = UniqueKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          backgroundColor: MyAppTheme.whiteColor,
          appBar: buildAppBar(context),
          body: Stack(
            children: [
              WebView(
                key: _key,
                initialUrl: "https://flutter.dev",
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              isLoading ? Center( child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyAppTheme.confirmbgColor)),)
                  : Stack(),
            ],
          ),
        )
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title:  const Padding(
          padding:  EdgeInsets.only(left: 0.0),
          child: Text('Terms & Conditions',
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
