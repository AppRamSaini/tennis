import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/providers/createleagues_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class CreateLeagues extends StatefulWidget {
  const CreateLeagues({Key? key}) : super(key: key);

  @override
  State<CreateLeagues> createState() => _CreateLeaguesState();
}

class _CreateLeaguesState extends State<CreateLeagues> {
  final maxLines = 5;
  TextEditingController userEmail = TextEditingController();
  TextEditingController leaguesDescription = TextEditingController();
  String? dropdownMStatus = 'Leagues Type';
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> mStatusList = [
    {
      "title": 'Leagues Type',
    },
    {
      "title": 'Single Women',
    },
    {
      "title": 'Single Men',
    },
    {
      "title": 'Double Women',
    },
    {
      "title": 'Double Men',
    },
  ];
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
      body: Consumer<CreateLeaguesProvider>(
        builder: (context, provider, child) {
          return Container(
              width: width,
              height: height,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        child:  TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          controller: userEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email ';
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
                            hintText: leagues,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.DesBlackColor,
                              fontFamily: Fonts.nunito,
                            ),
                            contentPadding: EdgeInsets.only(left: 10.0),),
                        ),
                      ),
                      Container(
                          width: width,
                          height: 50,
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                          decoration:   BoxDecoration(
                            color: MyAppTheme.listBGColor,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              width: 1,
                              color: MyAppTheme.MainColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child:
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownMStatus,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: MyAppTheme.black_Color,
                                fontFamily: Fonts.nunito,
                              ),
                              items: mStatusList.map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                                return DropdownMenuItem<String>(
                                  value: value['title'],
                                  child: Text(value['title']),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {

                              },
                            ),
                          )),
                      Container(
                        width: width,
                        height: maxLines * 25.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyAppTheme.MainColor,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(5))
                        ),
                        child:  TextFormField(
                          maxLines: maxLines,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          controller: leaguesDescription,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: MyAppTheme.black_Color,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.nunito,
                              fontSize: 16),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: description,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: MyAppTheme.DesBlackColor,
                              fontFamily: Fonts.nunito,
                            ),
                            contentPadding: EdgeInsets.only(left: 10.0),),
                        ),
                      ),
                      Container(
                        width: width,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text(numberOfSets,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: MyAppTheme.black_Color,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fonts.nunito,
                                  fontSize: 16),),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: MyAppTheme.listBorderColor,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      provider.MinsNSet();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                        color: MyAppTheme.listBorderColor,
                                        border: Border(
                                          right: BorderSide(width: 1, color: MyAppTheme.listBorderColor),
                                        ),
                                      ),
                                      child:   Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                          'assets/icons/mins.svg',
                                          allowDrawingOutsideViewBox: true,
                                          height: 10,
                                          width: 10,
                                          color: MyAppTheme.DesBlackColor,
                                        ),
                                      ),
                                    ),
                                  )
                                  ,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                    child: Text(provider.NSet.toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: MyAppTheme.black_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.nunito,
                                          fontSize: 16),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      provider.AddNSet();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                        color: MyAppTheme.listBorderColor,
                                        border: Border(
                                          left: BorderSide(width: 1, color: MyAppTheme.listBorderColor),
                                        ),
                                      ),
                                      child:   Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/add.svg',
                                          allowDrawingOutsideViewBox: true,
                                          height: 15,
                                          width: 15,
                                          color: MyAppTheme.DesBlackColor,
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        if (_formKey.currentState!.validate()) {

                        }
                      },
                      child: Container(
                        width: width,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: const BoxDecoration(
                            color: MyAppTheme.MainColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
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
                  )
                  ,
                ],
              ),
            )

            ,
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
          child: Text('Create Leagues',
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
          Navigator.pop(context);
        },
      ),
      actions: [],
      backgroundColor: MyAppTheme.MainColor,
    );
  }
}
