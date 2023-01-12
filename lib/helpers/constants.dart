
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
const String login = "Log In";
const String welcomeTo = "Welcome to";
const String pleaseFillInformation = "Please fill in the form below for basic information to complete your profile";
const String pleaseEnterWhatsAppNumber = "Please enter your WhatsApp number to get OTP";
const String  requestNow = " Request Now";
const String  requestPending = " Request Pending";
const String getOTP = "Get OTP";
const String editProfile = "Edit Profile";
const String factsheet = "Factsheet";
const String viewRules = "View Rules";
const String participate = "Participate";
const String or = "OR";
const String next = "Next";
const String save = "Save";
const String update = "Update";
const String cancel = "Cancel";
const String yes = "Yes";
const String editDetails = "Edit Details";
const String addPlayer = "Add Player";
const String leagueDetails = "League Details";
const String deleteLeague = "Delete League";
const String alreadyHaveAAccouny = "Already have a account?";
const String challengerName = "Challenger name";
const String opponent = "Opponent";
const String matchStatus = "Match Status";
const String winner = "Winner";
const String numberOfSets = "Number of Sets";
const String scoreCard = "Score Card";
const String selectNumberOfSet = "Select number of set";
const String selectTheEndResultOfTheMatch = "Select the end result of the match";
const String selectWinnerPlayerName = "Select a prayer to enter the score";
const String tennisKhelo = "Tennis Khelo";
const String myAcademy = "My Leagues & Request";
const String myChallenge = "My Challenge";
const String upcomingTournament = "Upcoming Tournament";
const String canReport = "Reports";
const String myResult = "My Result";
const String allMatch = "All Matchs";
const String oneTimePassword = "One time password";
const String fourDigitCodeHaveBeenSent = "A 4 digit code have been sent to";
const String logInWithGoogle = "Log in with google";
const String reSendCodeIn = "Re-send code in ";
const String resendOtp = "Resend OTP";
const String donotHaveAccount = "Don't have account? ";
const String loginDescription = "Please sign in to continue";
const String enterPhoneNumber = "Enter Phone Number";
const String enterUserName = "Enter Name";
const String enterEmail = "Enter Email";
const String termConditions = "Term & Conditions";
const String privacyPolicy = "Privacy & Policy";
const String rateTheApp = "Rate The App";
const String logout = "Logout";
const String name = "Name";
const String dateOfBirth = "Date of birth";
const String phoneNumber = "Phone Number";
const String email = "Email";
const String gender = "Gender";
const String male = "Male";
const String female = "Female";
const String leagues = "Leagues Name";
const String description = "Description";
const String noRecordData = "No Record Data";
const String recevieWhatsAppAlerts = "Receive WhatsApp Message Alerts";
const String recevieEmailAlerts = "Receive Email Message Alerts";
const String requestForCreateLeagues = "Currently, you don't have permission for creating your own league. Send a request to the admin for creating an league.";
const String requestForSendCreateLeagues = "Your Request Send for Admin Creating a Leagues";

