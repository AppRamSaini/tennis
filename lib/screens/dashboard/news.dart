import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tennis/drawer/drawer_bar.dart';
import 'package:tennis/helpers/helpers.dart';
import 'package:tennis/loaders/progress_bar.dart';
import 'package:tennis/locators.dart';
import 'package:tennis/providers/news_provider.dart';
import 'package:tennis/screens/webviewscreens/webviewpage.dart';
import 'package:tennis/styles/fonts.dart';
import 'package:tennis/styles/my_app_theme.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News>{
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  String savePath = "";
  int tabIndex = 0;
  final ScrollController _scrollController = new ScrollController();
  Future ShareProduct(String image,String title,String desc,String link) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context)!.insert(loader);
    String shareBody = "Title: $title\n\nDescription: $desc \n\nClick Here to Read More Details\n\n$link \n\nThank you";
    try {
      Dio dio = Dio();
      String fileName = image.substring(image.lastIndexOf("/") + 1);
      savePath = await getFilePath(fileName);
      print(savePath);
      await dio.download(image, savePath).then((value) {
        print(value);
        dio.close();
      }).catchError((Object e) {
        print(e.toString());
      });
      Helpers.hideLoader(loader);
      Share.shareFiles([savePath], text: shareBody);
    } catch (e) {
      print(e.toString());
    }
  }
  Future<String> getFilePath(uniqueFileName) async {
    String path = '';
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/$uniqueFileName';
    return path;
  }
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    setState(() {
      tabIndex = 0;
    });
    locator<NewsProvider>().getNewsCategoryList(context);
    locator<NewsProvider>().getCategoryNewsList(context,"0");
    return null;
  }
  @override
  void initState() {
    locator<NewsProvider>().getNewsCategoryList(context);
    locator<NewsProvider>().getCategoryNewsList(context,"0");
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
    bool isLoading = Provider.of<NewsProvider>(context).isLoading;
    bool isNewsLoading = Provider.of<NewsProvider>(context).isNewsLoading;
    List newsCateAllList = Provider.of<NewsProvider>(context).newsCateAllList;
    List catNewsList = Provider.of<NewsProvider>(context).catNewsList;
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: refreshList,
      child: Scaffold(
        key: _key, // Assign the key to Scaffold.
        appBar: buildAppBar(context),
        backgroundColor: MyAppTheme.whiteColor,
        body: (isLoading)
            ? const Progressbar()
            : Consumer<NewsProvider>(
          builder: (context, provider, child) {
            return Container(
                width: width,
                height: height,
                padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: width,
                      alignment: Alignment.center,
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsCateAllList.length,
                          controller: _scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){
                                provider.getCategoryNewsList(context, newsCateAllList[index]['id'].toString());
                                setState(() {
                                  tabIndex = index;
                                  _scrollController.animateTo(0.25 * width * (index - 1),
                                      curve: Curves.easeOut,
                                      duration: const Duration(milliseconds: 500));
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 5.0),
                                height: 40,
                                decoration: BoxDecoration(
                                    color: tabIndex == index ? MyAppTheme.CategoryBGSelectColor: MyAppTheme.CategoryBGUNSelectColor,
                                    border: Border.all(
                                      color: tabIndex == index ? MyAppTheme.CategoryBGSelectBorderColor: MyAppTheme.CategoryBGUNSelectBorderColor,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:  const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                                    child: Text(newsCateAllList[index]['category'],style:  TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: tabIndex == index ? MyAppTheme.whiteColor : MyAppTheme.DesBlackColor,
                                      fontFamily: Fonts.nunito,),),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 10,),
                    (isNewsLoading)
                        ? const Expanded(child: Center(
                      child:  CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyAppTheme.errorMessageTextColor)),
                    ))
                        : Expanded(
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: catNewsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 2,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(top: 5.0),
                                decoration: const BoxDecoration(
                                    color: MyAppTheme.whiteColor,
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height *
                                            0.22,
                                        width: MediaQuery.of(context).size.width,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Center(
                                              child: catNewsList[index]['image'] !=
                                                  null
                                                  ? FadeInImage(
                                                image: NetworkImage(
                                                    catNewsList[index]['image']!),
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.22,
                                                placeholder: const AssetImage(
                                                    "assets/images/t_ball.png"),
                                                imageErrorBuilder: (context,
                                                    error, stackTrace) {
                                                  return Image.asset(
                                                    "assets/images/t_ball.png",
                                                  );
                                                },
                                              )
                                                  : Image.asset(
                                                "assets/images/t_ball.png",
                                              )),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        '${catNewsList[index]['title']}',
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: MyAppTheme.black_Color,
                                          fontFamily: Fonts.nunito,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        '${catNewsList[index]['description']}',
                                        textAlign: TextAlign.left,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: MyAppTheme.DesBlackColor,
                                          fontFamily: Fonts.nunito,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => WebViewPage(url: '${catNewsList[index]['link']}', title: '',)),
                                        );
                                      },
                                      child: const Padding(padding: EdgeInsets.only(top: 5.0),
                                        child:  Text(
                                          'Click Here to Read More Details of News',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: MyAppTheme.DesBlackColor,
                                            fontFamily: Fonts.nunito,
                                          ),
                                        ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text(
                                            '${catNewsList[index]['time']}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: MyAppTheme.DesBlackColor,
                                              fontFamily: Fonts.nunito,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              ShareProduct(catNewsList[index]['image'],catNewsList[index]['title'],catNewsList[index]['description'],catNewsList[index]['link']);
                                            },
                                            child: Row (
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/share.svg',
                                                  allowDrawingOutsideViewBox: true,
                                                  height: 15,
                                                  width: 15,
                                                  color: MyAppTheme.DesBlackColor,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 5.0),
                                                  child: Text(
                                                    'share',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      color: MyAppTheme.DesBlackColor,
                                                      fontFamily: Fonts.nunito,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                            ,
                                          )
                                          ,
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            ;
                          }),
                    ),
                  ],
                )

            );
          },
        ),
        drawer: const DrawerBar(),
      ),
    );

  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _key.currentState!.openDrawer();
            }, // Image tapped
            child: Image.asset('assets/images/menu.png',width: 20,height: 15,),
          ),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            allowDrawingOutsideViewBox: true,
          ),
          const SizedBox(width: 20,height: 20,)

        ],

      ),
      backgroundColor: MyAppTheme.whiteColor,
    );
  }
}
