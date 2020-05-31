import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/profileModel.dart';

import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/invite_friends.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/settings_page.dart';

import 'package:mojtam3/utillites/circle_progess.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/profile_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiRequests apiRequests = new ApiRequests();
  DataUser _dataUser = DataUser.instance;
  bool isLoading = false;
  PrfileModel profileData;

  @override
  void initState() {
    //imageCache.clear();
    isLoading = true;
    apiRequests.getProfile().then((value) {
      print("---------------------------tiger---------------");
      
      print(value);
      setState(() {
        profileData = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//                   if (snapshot.connectionState == ConnectionState.waiting)
//                   {  return Scaffold(
// //                      appBar: AppBar(backgroundColor: Colors.grey[800],),
//                       body: Center(
//                           child: CircularProgressIndicator(
//                             backgroundColor: Colors.teal,
//                           )),
//                     );}

    return Scaffold(
      backgroundColor: Color(int.parse(
        _dataUser.getKey(Utility.BackGroundColor),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30),
              color: Colors.grey[800],
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SettingsPage();
                            }));
                          },
                          child: Container(
                              margin:
                                  EdgeInsets.only(top: 20, left: 20, right: 20),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Image.asset(
                                "assets/images/settings.png",
                                height: 20,
                                width: 20,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            AppLocalizations.of(context).lblActivenow,
                            style: TextStyle(
                                fontFamily: "black",
                                fontSize: 10,
                                height: 1.5,
                                color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                    //      color: Colors.blue,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                 isLoading?Container(height: MediaQuery.of(context).size.height/5,child: Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,),)):profileData==null? 
                 Container(
                   height: MediaQuery.of(context).size.height/5,
                   child: Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .lblNoInternetConnection,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "thin",
                                    color: Color(int.parse(
                                      _dataUser.getKey(Utility.FontColor),
                                    ))),
                              ),
                            ),
                 ):
                  Column(
                    children: <Widget>[
                      Container(
                        //  color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: Text(
                                profileData.level.toString(),
                                softWrap: false,
                                style: TextStyle(
                                    fontFamily: "black",
                                    fontSize: 17,
                                    color: Colors.grey),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfilePage(profileData);
                                }));
                              },
                              child: Container(
                                child: CustomPaint(
                                  foregroundPainter: CircleProgress(
                                      MediaQuery.of(context).size.height / 5,
                                      MediaQuery.of(context).size.height * .3 * .2,
                                      double.parse(profileData.precent.toString())),
                                  child: ClipOval(
                                      child: CachedNetworkImage(
                                    imageUrl: Utility.BaseURL +
                                        _dataUser.getKey(Utility.ProfileImage),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    height: MediaQuery.of(context).size.height *
                                        .3 *
                                        .3,
                                    width: MediaQuery.of(context).size.height /
                                        5 *
                                        .44,

                                    fit: BoxFit.fill,
                                    //  width: MediaQuery.of(context).size.width/3-40,
                                  )),
                                ),
                              ),
                            ),

                            Container(
                              //color: Colors.red,
                              // margin: EdgeInsets.only(
                              //     left: 50 , right: 50) ,
                              margin: EdgeInsets.only(top: 12),
                              child: Text(
                                (profileData.level + 1).toString(),
                                style: TextStyle(
                                    fontFamily: "black",
                                    fontSize: 17,
                                    color: Colors.grey),
                              ),
                            ),

                          
                          ],
                        ),
                      ),
                        Container(
                    ///color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              profileData.name,
                              style: TextStyle(
                                  fontFamily: "black", color: Colors.grey),
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Text(
                            "${profileData.precent}%",
                            style: TextStyle(
                                height: 1,
                                fontFamily: "black",
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                    ],
                  ),
                
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MarketPage();
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .17,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/recta.png"),
                              fit: BoxFit.fill),

                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4),

                          //color: Colors.black,
                        ),
                        margin: EdgeInsets.only(
                            right: 15, left: 9, top: 10, bottom: 10),
                        child: Text(
                          AppLocalizations.of(context).lblMarket,
                          style: TextStyle(
                              fontSize: 25,
                              //fontWeight: FontWeight.bold ,
                              fontFamily: "black"),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * .17,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            margin:
                                EdgeInsets.only(right: 5, left: 5, bottom: 30),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    height: 25,
                                    child: ListView.builder(
                                        itemCount: 4,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.5, right: 2.5),
                                            child: Image.asset(
                                              "assets/images/tag.png",
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).lblAccolade,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: "black"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InviteFriends();
                              }));
                            },
                            child: Card(
                              margin: EdgeInsets.only(right: 3, left: 3),
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 12, bottom: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                        "assets/images/add.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .lblInvitefriends,
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: "black"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // return Center(
  //     child: CircularProgressIndicator(
  //       backgroundColor: Colors.red,
  //     ));

  @override
  void dispose() {
    super.dispose();
  }
}

/*
 */
