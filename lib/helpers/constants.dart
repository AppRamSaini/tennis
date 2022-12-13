
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String login = "Login";
const String getOTP = "Get OTP";
const String or = "OR";
const String next = "Next";
const String save = "Save";
const String alreadyHaveAAccouny = "Already have a account?";
const String challengerName = "Challenger name";
const String opponent = "Opponent";
const String matchStatus = "Match Status";
const String winner = "Winner";
const String numberOfSets = "Number of sets";
const String scoreCard = "Score Card";
const String selectNumberOfSet = "Select number of set";
const String selectTheEndResultOfTheMatch = "Select the end result of the match";
const String selectWinnerPlayerName = "Select a prayer to enter the score";
const String registerNow = "Register now";
const String myAcademy = "My Academy";
const String myChallenge = "My Challenge";
const String upcomingTournament = "Upcoming Tournament";
const String myResult = "My Result";
const String allMatch = "All Match";
const String oneTimePassword = "One time password";
const String fourDigitCodeHaveBeenSent = "A 4 digit code have been sent to";
const String logInWithGoogle = "Log in with google";
const String reSendCodeIn = "Re-send code in ";
const String resendOtp = "Resend OTP";
const String donotHaveAccount = "Don't have account? ";
const String loginDescription = "Please enter your registered phone number and valid password to log in";
const String enterPhoneNumber = "Enter phone number";

