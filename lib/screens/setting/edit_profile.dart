import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tennis/config/sharedpref.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/helpers/keyboard.dart';
import 'package:tennis/providers/createleagues_provider.dart';
import 'package:tennis/providers/editprofile_provider.dart';
import 'package:tennis/repository/edit_profile.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController userName = TextEditingController();
  TextEditingController calender = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  File? category_fill;
  CroppedFile? _croppedFile;
  File? imageFile;
  String? user_profile;
  String? user_name;
  String? user_email;
  String? user_phone;
  @override
  void dispose() {
    super.dispose();
  }
  _FromCamera(BuildContext context) async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        category_fill = pickedFile != null ? File(pickedFile.path) : null;
        _cropImage();
      });
    }
  }
  Future<void> _cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: category_fill!.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: MyAppTheme.MainColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );

    if (category_fill != null) {
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
        final path = _croppedFile!.path;
        try {
          Helpers.verifyInternet().then((intenet) {
            if (intenet != null && intenet) {
              getEditProfile(context,File(path))
                  .then((response) {
                setState(() {
                  if (response != null) {
                    SharedPref.setProfileImage(response);
                    user_profile = response;
                    print('updateicondata');
                  } else {
                    Helpers.createErrorSnackBar(context, response);
                  }
                });
              });
            } else {
              Helpers.createErrorSnackBar(
                  context, "Please check your internet connection");
            }
          });
        } catch (err) {
          print('Something went wrong');
        }
      }
    }
  }

  _FromGallery(BuildContext context) async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        category_fill = pickedFile != null ? File(pickedFile.path) : null;
        _cropImage();
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: MyAppTheme.black_Color,
                      ),
                      title: new Text(
                        'Photo Library',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: Fonts.nunito,
                            fontWeight: FontWeight.w400,
                            color: MyAppTheme.black_Color),
                      ),
                      onTap: () {
                        _FromGallery(context);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,
                        color: MyAppTheme.black_Color),
                    title: new Text(
                      'Camera',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: Fonts.nunito,
                          fontWeight: FontWeight.w400,
                          color: MyAppTheme.black_Color),
                    ),
                    onTap: () {
                      _FromCamera(context);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  initState() {
    checkPermission();
    SharedPref.getProfileImage("user_profile").then((value) => setState(() {
      user_profile = value;
    }));
    SharedPref.getUserName("user_name").then((value) => setState(() {
      user_name = value;
      userName.text = value;
    }));
    SharedPref.getUserEmail("user_email").then((value) => setState(() {
      user_email = value;
      userEmail.text = value;
    }));
    SharedPref.getUserPhone("user_phone").then((value) => setState(() {
      user_phone = value;
      userPhone.text = value;
      print(user_phone);
    }));
    super.initState();
  }

  void checkPermission() async {
    if (Permission.microphone == Permission.microphone.isDenied ||
        Permission.microphone == Permission.microphone.isLimited ||
        Permission.microphone == Permission.microphone.isRestricted) {
      await Permission.camera.request();
    }
    if (Permission.storage == Permission.storage.isRestricted ||
        Permission.storage == Permission.storage.isLimited ||
        Permission.storage == Permission.storage.isDenied) {
      await Permission.storage.request();
    }
  }
  Future<void> selectDate(BuildContext context,String type) async{
    DateTime? newDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    var formatter = DateFormat('dd-MMMM-yyyy');
    String formattedDate = formatter.format(newDateTime!);
    setState(() {
      calender.text = formattedDate;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.MainColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Consumer<EditProfileProvider>(
        builder: (context, provider, child) {
          return Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              user_profile != "" ?
                          Container(
                            width: 100,
                            height: 100,
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(user_profile!)),
                              border: Border.all(color: MyAppTheme.CategoryBGSelectColor,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                            ),
                          ): Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/profile_image.png"),
                                      fit: BoxFit.fill
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  _showPicker(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5.0, right: 5.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        // Border radius
                                        child: ClipOval(
                                            child: SvgPicture.asset(
                                              'assets/icons/edit.svg',
                                              allowDrawingOutsideViewBox: true,
                                              height: 12,
                                              width: 12,
                                              color: MyAppTheme.whiteColor,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          name,
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
                        margin: const EdgeInsets.only(top: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyAppTheme.MainColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: SvgPicture.asset(
                                'assets/icons/user_icon.svg',
                                allowDrawingOutsideViewBox: true,
                                height: 18,
                                width: 18,
                              ),
                            ),
                            Expanded(
                                child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              controller: userName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter user name';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: MyAppTheme.TitleBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          dateOfBirth,
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
                        margin: const EdgeInsets.only(top: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyAppTheme.MainColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: InkWell(
          onTap: (){
            selectDate(context,'start');
            KeyboardUtil.hideKeyboard(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(
                  'assets/icons/calender.svg',
                  allowDrawingOutsideViewBox: true,
                  height: 18,
                  width: 18,
                ),
              ),
              Expanded(
                  child: TextFormField(
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    controller: calender,
                    enabled: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: MyAppTheme.TitleBlackColor,
                      fontFamily: Fonts.nunito,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0),
                    ),
                  )),
            ],
          ),
          )
                        ,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          phoneNumber,
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
                        margin: const EdgeInsets.only(top: 2.0),
                        decoration: BoxDecoration(
                            color: MyAppTheme.LineColor,
                            border: Border.all(
                              color: MyAppTheme.MainColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: SvgPicture.asset(
                                'assets/icons/phone_icon.svg',
                                allowDrawingOutsideViewBox: true,
                                height: 18,
                                width: 18,
                              ),
                            ),
                            Expanded(
                                child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              controller: userPhone,
                              enabled: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter user name';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: MyAppTheme.TitleBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          email,
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
                        margin: const EdgeInsets.only(top: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyAppTheme.MainColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: SvgPicture.asset(
                                'assets/icons/email_icon.svg',
                                allowDrawingOutsideViewBox: true,
                                height: 18,
                                width: 18,
                              ),
                            ),
                            Expanded(
                                child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              controller: userEmail,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter user name';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: MyAppTheme.TitleBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          gender,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: MyAppTheme.DesBlackColor,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                            width: width,
                            height: 50,
                            margin: const EdgeInsets.only(top: 2.0, right: 5.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyAppTheme.MainColor,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                              onTap: () {
                                provider.getGender("male");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: provider.gender == "male"
                                        ? Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                                color: MyAppTheme.MainColor,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/check.svg',
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                height: 20,
                                                width: 20,
                                                color: MyAppTheme.whiteColor,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: MyAppTheme.listBGColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1,
                                                color:
                                                    MyAppTheme.listBorderColor,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                          ),
                                  ),
                                  const Expanded(
                                      child: Text(
                                    male,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            width: width,
                            height: 50,
                            margin: const EdgeInsets.only(top: 2.0, left: 5.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyAppTheme.MainColor,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                              onTap: () {
                                provider.getGender("female");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: provider.gender == "female"
                                        ? Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                                color: MyAppTheme.MainColor,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/check.svg',
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                height: 20,
                                                width: 20,
                                                color: MyAppTheme.whiteColor,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: MyAppTheme.listBGColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1,
                                                color:
                                                    MyAppTheme.listBorderColor,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                          ),
                                  ),
                                  const Expanded(
                                      child: Text(
                                    female,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: MyAppTheme.TitleBlackColor,
                                      fontFamily: Fonts.nunito,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              recevieWhatsAppAlerts,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: MyAppTheme.DesBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                provider.getWhatsApp(provider.whatsApp);
                              },
                              child: provider.whatsApp == true
                                  ? Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.MainColor,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/check.svg',
                                    allowDrawingOutsideViewBox:
                                    true,
                                    height: 20,
                                    width: 20,
                                    color: MyAppTheme.whiteColor,
                                  ),
                                ),
                              )
                                  : Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: MyAppTheme.listBGColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color:
                                    MyAppTheme.listBorderColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              recevieEmailAlerts,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: MyAppTheme.DesBlackColor,
                                fontFamily: Fonts.nunito,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                provider.getEmailApp(provider.emailApp);
                              },
                              child: provider.emailApp == true
                                  ? Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.MainColor,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/check.svg',
                                    allowDrawingOutsideViewBox:
                                    true,
                                    height: 20,
                                    width: 20,
                                    color: MyAppTheme.whiteColor,
                                  ),
                                ),
                              )
                                  : Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: MyAppTheme.listBGColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color:
                                    MyAppTheme.listBorderColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: width,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: const BoxDecoration(
                          color: MyAppTheme.MainColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                        child: Text(
                          save,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: MyAppTheme.whiteColor,
                            fontFamily: Fonts.nunito,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text('Edit Profile',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: MyAppTheme.whiteColor,
                fontFamily: Fonts.nunito,
              ))),
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/black_back_arrow.svg',
          allowDrawingOutsideViewBox: true,
          height: 20,
          width: 20,
          color: MyAppTheme.whiteColor,
        ),
        onPressed: () {
          Navigator.pop(context,user_profile);
        },
      ),
      actions: [],
      backgroundColor: MyAppTheme.MainColor,
    );
  }
}
