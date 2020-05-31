import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/pay_page2.dart';
import 'package:mojtam3/utillites/utillity_class.dart';


class PayPage extends StatefulWidget {
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
      DataUser _dataUser = DataUser.instance;
  @override
  Widget build(BuildContext context) {
 
        return Scaffold(
         backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          appBar: AppBar(
            backgroundColor: Colors.grey[800],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              AppLocalizations.of(context).lblpay,
              style: TextStyle(fontFamily: "thin", fontSize: 14,color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PayPage2("assets/images/visa.png");
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: new Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/4.0x/visa.png",
                              width: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              child: Text(
                                AppLocalizations.of(context).lblwithVisa,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "thin"),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.chevron_right,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PayPage2(
                          "assets/images/4.0x/1024px-Mada_Logo.svg.png");
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: new Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/4.0x/1024px-Mada_Logo.svg.png",
                              width: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              child: Text(
                                AppLocalizations.of(context).lblwithMada,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "thin"),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.chevron_right,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PayPage2("assets/images/master-card.png");
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    margin: EdgeInsets.only(bottom: 12, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: new Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/master-card.png",
                              width: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              child: Text(
                                AppLocalizations.of(context).lblMastercart,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "thin"),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.chevron_right,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
   
  }
}
