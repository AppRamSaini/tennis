import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/home_provider.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/providers/otp_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/screens/splash.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => locator<OtpProvider>()),
      ChangeNotifierProvider(create: (context) => locator<ScoreCardProvider>()),
      ChangeNotifierProvider(create: (context) => locator<HomeProvider>()),
      ChangeNotifierProvider(create: (context) => LoginProvider(),builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            "/": (_) => Splash(),
          },
        );
      },)
    ],);
  }
}

