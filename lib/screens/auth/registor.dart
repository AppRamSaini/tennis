import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Registor extends StatefulWidget {
  const Registor({Key? key}) : super(key: key);

  @override
  State<Registor> createState() => _RegistorState();
}

class _RegistorState extends State<Registor> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool onError = false;
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
                padding:  EdgeInsets.only(left: 10.0,right: 10.0,top: height * 0.05),
                child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                                height: height* 0.30,
                                width:  width * 0.70,
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/register.jpg",
                                  height: height,
                                  width: width,
                                  fit: BoxFit.cover,)
                            ),
                          ),
                           const Padding(
                            padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                            child: Text(
                              registerNow,
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
                            width: width,
                            height: 50,
                            margin: const EdgeInsets.only(top: 15.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyAppTheme.MainColor,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5))
                            ),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10.0),
                                  child:  SvgPicture.asset(
                                    'assets/icons/user_icon.svg',
                                    allowDrawingOutsideViewBox: true,
                                    height: 18,
                                    width: 18,
                                  ),),
                                Expanded(child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.left,
                                  controller: userName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter name';
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
                                    hintText: enterUserName,
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                    contentPadding: EdgeInsets.only(left: 10.0),),
                                ))
                                ,
                              ],
                            )
                            ,
                          ),
                          Container(
                            width: width,
                            height: 50,
                            margin: const EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyAppTheme.MainColor,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10.0),
                                  child:  SvgPicture.asset(
                                    'assets/icons/email_icon.svg',
                                    allowDrawingOutsideViewBox: true,
                                    height: 16,
                                    width: 16,
                                  ),),
                                Expanded(child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.left,
                                  controller: userEmail,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email ';
                                    }else if (Helpers.validateEmail(value)){
                                      return 'Please enter valid email id';
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
                                    hintText: enterEmail,
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                    contentPadding: EdgeInsets.only(left: 10.0),),
                                ))
                                ,
                              ],
                            )
                            ,
                          ),
                          Container(
                            width: width,
                            height: 50,
                            margin: const EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyAppTheme.MainColor,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5))
                            ),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10.0),
                                  child:  SvgPicture.asset(
                                    'assets/icons/phone_icon.svg',
                                    allowDrawingOutsideViewBox: true,
                                    height: 25,
                                    width: 25,
                                  ),),
                                Expanded(child: TextFormField(
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
                                ))
                                ,
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              if (_formKey.currentState!.validate()) {
                                provider.authRegistorData(context, userName.text.toString(), userEmail.text.toString(), phoneNumber.text.toString(),"registor");
                              }
                            },
                            child: Container(
                              width: width,
                              height: 50,
                              margin:  EdgeInsets.only(top: height * 0.05),
                              decoration: const BoxDecoration(
                                  color: MyAppTheme.MainColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child:  Center(
                                child: Text(
                                  getOTP.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: MyAppTheme.whiteColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        /*  Padding(
                            padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
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
                          ),*/
                          Container(
                            width: width,
                            margin:  EdgeInsets.only(top: height * 0.05),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Text(
                                  alreadyHaveAAccouny,
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
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      login,
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
