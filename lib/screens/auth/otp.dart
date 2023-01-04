import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class OTP extends StatefulWidget {
  String number;
  int time;
  OTP({Key? key,required this.number,required this.time}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController _pinPutController = TextEditingController();
  Timer? _timer;
  bool resend = false;
  formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }
  void startTimer() {
    setState(() {
      resend = false;
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (widget.time == 0) {
          setState(() {
            _pinPutController.text='';
            resend = true;
            timer.cancel();
          });
        } else {
          setState(() {
            widget.time--;
          });
        }
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();

  }
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
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/otp_logo.png",
                      width: 100,
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(oneTimePassword,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: MyAppTheme.black_Color,
                          fontFamily: Fonts.nunito,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('$fourDigitCodeHaveBeenSent\n +91 '+ widget.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(
                          width * 0.10,height * 0.02,width * 0.10,height * 0.03,),
                        color: MyAppTheme.whiteColor,
                        child: PinCodeTextField(
                          appContext: context,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: MyAppTheme.black_Color,
                            fontFamily: Fonts.nunito,
                          ),
                          length: 4,
                          controller: _pinPutController,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 55,
                              fieldWidth: 55,
                              borderWidth: 1,
                              activeFillColor: MyAppTheme.whiteColor,
                              inactiveColor: MyAppTheme.black_Color,
                              inactiveFillColor: MyAppTheme.whiteColor,
                              selectedFillColor: MyAppTheme.whiteColor,
                              selectedColor: MyAppTheme.MainColor,
                              activeColor: MyAppTheme.MainColor),
                          cursorColor: MyAppTheme.black_Color,
                          enableActiveFill: true,
                          // controller: provider.pinPutController,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {

                          },
                        )),
                    InkWell(
                      onTap: (){
                        if(resend){
                          // re-send otp send
                          provider.authLoginData(context, widget.number);
                          startTimer();
                        }else{

                        }
                      },
                      child: Text(
                        resend == false ?
                        reSendCodeIn+ formatedTime(timeInSecond: widget.time) : resendOtp,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.DesBlackColor,
                          fontFamily: Fonts.nunito,
                        ),),
                    )
                    ,
                    InkWell(
                      onTap: (){
                        if (_pinPutController.text.isNotEmpty) {
                         provider.authOTPData(context,widget.number,_pinPutController.text.toString());
                        }
                      },
                      child: Container(
                        width: width,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20.0),
                        decoration: const BoxDecoration(
                            color: MyAppTheme.MainColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child:  Center(
                          child: Text(
                            login.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: MyAppTheme.whiteColor,
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
        ),
      ),
    );
  }
}
