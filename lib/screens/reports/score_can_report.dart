import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis/helpers/constants.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/reports_provider.dart';
import 'package:tennis/screens/reports/update_score.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class ScoreCanReport extends StatefulWidget {
  const ScoreCanReport({Key? key}) : super(key: key);

  @override
  State<ScoreCanReport> createState() => _ScoreCanReportState();
}

class _ScoreCanReportState extends State<ScoreCanReport> {
  @override
  void initState() {
    // TODO: implement initState
    locator<ReportsProvider>().leaguesScorePendingReports(context);
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
    bool isLoading = Provider.of<ReportsProvider>(context).isLoading;
    List reportsList = Provider.of<ReportsProvider>(context).reportsList;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: MyAppTheme.whiteColor,
      body: Consumer<ReportsProvider>(
        builder: (context, provider, child) {
          return (isLoading)
              ? const Progressbar()
              : reportsList.isNotEmpty ?
            Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: reportsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: MyAppTheme.listBorderColor, //New
                            blurRadius: 5.0,
                          )
                        ],
                        color: MyAppTheme.whiteColor,
                        borderRadius:
                        BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Container(
                           width: width,
                           child: Text(
                            '${reportsList[index]['league']['name']}',
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: MyAppTheme.TitleBlackColor,
                              fontFamily: Fonts.nunito,
                            ),
                        ),
                         ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Container(
                                width : width * 0.30,
                                child: const Text(
                                  'Add Score by : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.55,
                                child: Text(
                                  '${reportsList[index]['user']['name']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyAppTheme.TitleBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              SizedBox(
                                width : width * 0.30,
                                child: const Text(
                                  'Details : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyAppTheme.DesBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.55,
                                child: Text(
                                  '${reportsList[index]['details']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyAppTheme.TitleBlackColor,
                                    fontFamily: Fonts.nunito,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      provider.setValueLoserWinner('${reportsList[index]['score']['winner']['uuid']}', '${reportsList[index]['score']['winner']['name']}', '${reportsList[index]['challenge']['challenger']['uuid']}', '${reportsList[index]['challenge']['challenger']['name']}', '${reportsList[index]['challenge']['accepter']['uuid']}', '${reportsList[index]['challenge']['accepter']['name']}');
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                             UpdateScore(reportUUID: '${reportsList[index]['uuid']}', sets: '${reportsList[index]['score']['sets']}', status: '${reportsList[index]['score']['status']}', score: reportsList[index]['score']['score'])),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      margin:
                                      const EdgeInsets.only(right: 5.0),
                                      decoration: BoxDecoration(
                                          color: MyAppTheme.MainColor,
                                          border: Border.all(
                                              color:
                                              MyAppTheme.MainColor,
                                              width: 1),
                                          borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Center(
                                        child: Text(
                                          'Update',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                            MyAppTheme.whiteColor,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  child: InkWell(
                                    onTap: () {
                                       provider.leaguesScoreReportUpdate(context,'${reportsList[index]['uuid']}','reject','${reportsList[index]['score']['winner']['uuid']}','${reportsList[index]['score']['sets']}','${reportsList[index]['score']['status']}',reportsList[index]['score']['score'].toString());
                                    },
                                    child: Container(
                                      height: 50,
                                      margin:
                                      const EdgeInsets.only(left: 5.0),
                                      decoration: BoxDecoration(
                                          color:
                                          MyAppTheme.AcceptBgColor,
                                          border: Border.all(
                                              color: MyAppTheme
                                                  .AcceptBgColor,
                                              width: 1),
                                          borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Center(
                                        child: Text(
                                          'Rejected',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                            MyAppTheme.whiteColor,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ) : Container(
            width: width,
            height: height,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/empty_image.svg',
                allowDrawingOutsideViewBox: true,
              ),
            ),
          );
        },
      )
      ,

    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(canReport,
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
