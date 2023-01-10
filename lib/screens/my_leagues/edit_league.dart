import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/createleagues_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class EditLeague extends StatefulWidget {
      String leagueUUID;
      String leagueName;
      String leagueType;
      String leagueDesc;
      int leagueSets;
     EditLeague({Key? key,required this.leagueUUID,required this.leagueName,required this.leagueType,required this.leagueDesc,required this.leagueSets}) : super(key: key);

  @override
  State<EditLeague> createState() => _EditLeagueState();
}

class _EditLeagueState extends State<EditLeague> {
  final maxLines = 5;
  TextEditingController leagueName = TextEditingController();
  TextEditingController leaguesDescription = TextEditingController();
  String? dropdownMStatus;
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
  void initState() {
    // TODO: implement initState
    locator<CreateLeaguesProvider>().SetValueUpdate(widget.leagueSets);
    dropdownMStatus = widget.leagueType;
    leagueName.text = widget.leagueName;
    leaguesDescription.text = widget.leagueDesc;
    super.initState();
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
                          maxLength: 100,
                          textCapitalization: TextCapitalization.words,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          controller: leagueName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter League Name';
                            }else if (value.length < 5){
                              return 'Please Enter minimum 5 Characters';
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
                            contentPadding: EdgeInsets.all(5.0),),
                        ),
                      ),
                      Container(
                          width: width,
                          height: 50,
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                          decoration:   BoxDecoration(
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
                                setState(() {
                                  dropdownMStatus = newValue;
                                });
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
                          maxLength: 655,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          controller: leaguesDescription,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter League Description';
                            }else if (value.length < 20){
                              return 'Please Enter minimum 20 Characters';
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
                            contentPadding: EdgeInsets.all(5.0),),
                        ),
                      ),
                      Container(
                        width: width,
                        margin: const EdgeInsets.only(top: 20.0),
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
                           if(dropdownMStatus != "Leagues Type"){
                             if(provider.NSet != 0){
                              provider.updateLeagueData(context,widget.leagueUUID,leagueName.text.toString(), dropdownMStatus!, leaguesDescription.text.toString(), provider.NSet);
                             }else {
                               Helpers.messageToastFalseBottom(context,'Select Number of Sets');
                             }
                           }else {
                             Helpers.messageToastFalseBottom(context,'Select League Type');
                           }
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
                            update,
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
