import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/buy_coins2_item.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/pay_page.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/paymentpage.dart';
import 'package:mojtam3/utillites/utillity_class.dart';


class BuyCoins2Page extends StatefulWidget {
  List<Coins> coins;
  BuyCoins2Page({this.coins});

  @override
  _BuyCoins2PageState createState() => _BuyCoins2PageState();
}

class _BuyCoins2PageState extends State<BuyCoins2Page> {
   DataUser _dataUser = DataUser.instance;
     bool isLoading=false;
    ApiRequests apiRequests = new ApiRequests();
    String value;
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
              AppLocalizations.of(context).lblBuyCoins,
              style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: GridView.count(
                //padding: EdgeInsets.only(top: 12),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                children: List.generate(widget.coins.length, (index) {
                  return GestureDetector(
                    onTap: () {
                       setState(() {
                              isLoading=true;
                            });
                          paymentfun(_dataUser.getKey(Utility.ID),widget.coins[index].id.toString());
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return PayPage();
                      // }));
                    },
                    child: BuyCoins2(
                      widget.coins[index].salary,
                       widget.coins[index].value.toString(),
                      "assets/images/money_Gold.png",
                    ),
                  );
                })),
          ),
        );
    
  }
   void paymentfun(key, String string) {
                           
                            apiRequests.payment(key, string).then((valuee){
                           setState(() {
                              isLoading=false;
                              print(valuee);
                              value=valuee;
                            });
                            print("---------------payment valu---------------");
                            print(value);
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                              return payment(url: value,);
                            }));
                            });
                            }
}
