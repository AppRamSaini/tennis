import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/screens/auth/otp.dart';
import 'package:tennis/screens/auth/registor.dart';
import 'package:tennis/screens/score_card/winner.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: MyAppTheme.whiteColor,
        body: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                                height: height* 0.25,
                                width:  width * 0.60,
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/login_img.jpg",
                                  height: height,
                                  width: width,
                                  fit: BoxFit.cover,)
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0,top: 20.0),
                            child: Text(
                              login,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: MyAppTheme.TitleBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.80,
                            padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                            child: const Text(
                              loginDescription,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: MyAppTheme.DesBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            height: 50,
                            margin: const EdgeInsets.only(top: 15.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyAppTheme.MainColor,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5))
                            ),
                            child:  TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                              controller: phoneNumber,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter phone number';
                                }else if (value.length < 10){
                                  return 'Please enter 10 digit phone number';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  color: MyAppTheme.black_Color,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fonts.nunito,
                                  fontSize: 14),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: enterPhoneNumber,
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: MyAppTheme.DesBlackColor,
                                  fontFamily: Fonts.nunito,
                                ),
                                contentPadding: EdgeInsets.only(left: 10.0),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              if (_formKey.currentState!.validate()) {
                               provider.authLoginData(context, phoneNumber.text.toString());
                              }
                            },
                            child: Container(
                              width: width,
                              height: 50,
                              margin: const EdgeInsets.only(top: 30.0),
                              decoration: const BoxDecoration(
                                  color: MyAppTheme.MainColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: const Center(
                                child: Text(
                                  getOTP,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: MyAppTheme.whiteColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0,bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width* 0.40,
                                  height: 1,
                                  color: MyAppTheme.LineColor,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5.0,right: 5.0),
                                  child: Text(
                                    or,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width* 0.40,
                                  height: 1,
                                  color: MyAppTheme.LineColor,
                                ),
                              ],
                            ),),
                          InkWell(
                            onTap: (){
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Winner()),
                                );
                              }
                            },
                            child: Container(
                              width: width,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: MyAppTheme.GoogleLoginBgColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child:  Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    Image.asset(
                                      "assets/images/google_login.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Text(
                                      logInWithGoogle,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: MyAppTheme.DesBlackColor,
                                        fontFamily: Fonts.nunito,
                                      ),
                                    )
                                  ],
                                )
                                ,
                              ),
                            ),
                          ),
                          Container(
                        width: width,
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text(
                              donotHaveAccount,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: MyAppTheme.DesBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Registor()),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  registerNow,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: MyAppTheme.MainColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      )

                        ],
                      )),
                )
                ,
              ),
            );
          },
        ),
      ),
    );
  }
}
