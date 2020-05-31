import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/myroomsPage.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/pay_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';


class ExcellencePage extends StatefulWidget {
 final  List<Places> places;
  ExcellencePage({this. places});

  @override
  _ExcellencePageState createState() => _ExcellencePageState();
}

class _ExcellencePageState extends State<ExcellencePage> {
    DataUser _dataUser = DataUser.instance;
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          appBar: new AppBar(
            backgroundColor: Colors.grey[800],
            title: Text(
              AppLocalizations.of(context).lblDistinguishedRoom,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "thin",
                  color: Colors.white),
            ),

            //todo need to fix search how to max leading width
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 25, left: 25, top: 40, bottom: 30),
                  child: Text(
                    AppLocalizations.of(context)
                        .lblDistinguishyourroomandplaceitintheviproomsForThreeDays,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "thin",
                        height: 1.5,
                        color: Colors.black),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyRoomsPage(spicial: 1,spicailid:  widget.places[0].id.toString(),pp: "1",);
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(14),

                            width: MediaQuery.of(context).size.width / 2.2,

                            //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                            decoration: BoxDecoration(
                              color: Colors.teal[800],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).lblFirstLevel,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      height: 2,
                                      fontFamily: "thin"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widget.places[0].value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          height: 1.5,
                                          color: Colors.white,
                                          fontFamily: "thin"),
                                    ),
                                    Text(
                                      "  " +
                                          AppLocalizations.of(context).lblCoins +
                                          "  ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          height: 1.5,
                                          color: Colors.white,
                                          fontFamily: "thin"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyRoomsPage(spicial: 1,spicailid:  widget.places[1].id.toString(),pp: "2",);
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(14),

                            width: MediaQuery.of(context).size.width / 2.2,

                            //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                            decoration: BoxDecoration(
                              color: Colors.teal[800],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).lblSecondLevel,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      height: 2,
                                      fontFamily: "thin"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                     widget.places[1].value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          height: 1.5,
                                          color: Colors.white,
                                          fontFamily: "thin"),
                                    ),
                                    Text(
                                      "  " +
                                          AppLocalizations.of(context).lblCoins +
                                          "  ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          height: 1.5,
                                          color: Colors.white,
                                          fontFamily: "thin"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                         onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyRoomsPage(spicial: 1,spicailid:  widget.places[2].id.toString(),pp: "3",);
                            }));
                          },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(14),

                        width: MediaQuery.of(context).size.width / 2.2,

                        //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                        decoration: BoxDecoration(
                          color: Colors.teal[800],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblThirdLevel,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  height: 2,
                                  fontFamily: "thin"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                 widget.places[2].value,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      height: 1.5,
                                      color: Colors.white,
                                      fontFamily: "thin"),
                                ),
                                Text(
                                  "  " +
                                      AppLocalizations.of(context).lblCoins +
                                      "  ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      height: 1.5,
                                      color: Colors.white,
                                      fontFamily: "thin"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
   
  }
}
