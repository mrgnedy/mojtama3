import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/buy_coins2.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/pay_page.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/paymentpage.dart';
import 'package:mojtam3/utillites/utillity_class.dart';


class BuyCoins extends StatefulWidget {
final Inside inside;
  BuyCoins({this.inside});

  @override
  _BuyCoinsState createState() => _BuyCoinsState();
}

class _BuyCoinsState extends State<BuyCoins> {
  DataUser _dataUser = DataUser.instance;
  bool isLoading=false;
    ApiRequests apiRequests = new ApiRequests();
    String value;
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          appBar: new AppBar(
            backgroundColor: Colors.grey[800],
            title: Text(
              AppLocalizations.of(context).lblBuyCoins,
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
                size: 35,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child:isLoading?Center(child:CircularProgressIndicator(backgroundColor: Colors.teal,)): Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/money.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  widget.inside.remains.toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "thin",
                                      color: Colors.white),
                                ),
                                Text(
                                  AppLocalizations.of(context).lblBalance,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "thin",
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: CarouselSlider(
                            items: List.generate( widget.inside.ads.length,
                                (index) {
                              return  
                               Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                         Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(right: 4, left: 4),

                                //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // image: DecorationImage(
                                  //     image:NetworkImage(Utility.BaseURL+snapshot.data.data.ads[index].image),
                                  //     fit: BoxFit.cover)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: Utility.BaseURL +
                                        widget.inside.ads[index].image,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),

                                    fit: BoxFit.cover,
                                    //  width: MediaQuery.of(context).size.width/3-40,
                                  ),
                                ),
                              ),
                        Container(
                          // alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10, right: 10, left: 8),
                          height: 100,
                          width: MediaQuery.of(context).size.width / 3,
                          margin: EdgeInsets.only(right: 4,left: 4),
                          child: Text(
                           widget.inside.ads[index].desc,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                // fontWeight: FontWeight.w600,
                                height: 1.5,
                                fontSize: 12,
                                fontFamily: "thin",
                                color: Colors.white),
                          ),

                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                        ),
                      ],
                    );
                            }),
                            height: 100,
                            viewportFraction: .8,
                            autoPlay: true,
                            reverse: true,
                            enableInfiniteScroll: true,
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            autoPlayInterval: Duration(seconds: 4),

                           // autoPlayAnimationDuration: Duration(seconds: 5),
                            autoPlayCurve: Curves.linear,
                            
                          ),
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    // Stack(
                    //   alignment: Alignment.centerRight,
                    //   children: <Widget>[
                    //     Container(
                    //       height: 100,
                    //       width: MediaQuery.of(context).size.width,

                    //       //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(15),
                    //           image: DecorationImage(
                    //               image:NetworkImage(),
                    //               fit: BoxFit.cover)),
                    //     ),
                    //     Container(
                    //       // alignment: Alignment.center,
                    //       padding: EdgeInsets.only(top: 10, right: 10, left: 8),
                    //       height: 100,
                    //       width: MediaQuery.of(context).size.width / 3,
                    //       child: Text(
                    //         snapshot.data.data.ads[0].desc,
                    //         textAlign: TextAlign.center,
                    //         textDirection: TextDirection.rtl,
                    //         style: TextStyle(
                    //             // fontWeight: FontWeight.w600,
                    //             height: 1.5,
                    //             fontSize: 12,
                    //             fontFamily: "thin",
                    //             color: Colors.white),
                    //       ),

                    //       decoration: BoxDecoration(
                    //           color: Colors.black54,
                    //           borderRadius: BorderRadius.only(
                    //               bottomRight: Radius.circular(12),
                    //               topRight: Radius.circular(12))),
                    //     ),
                    //   ],
                    // ),
                  ),
                // Padding(
                //   padding: const EdgeInsets.all(15),
                //   child: Stack(
                //     alignment: Alignment.centerRight,
                //     children: <Widget>[
                //       // Container(
                //       //   height: 120,
                //       //   width: MediaQuery.of(context).size.width,

                //       //   //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                //       //   decoration: BoxDecoration(
                //       //       borderRadius: BorderRadius.circular(15),
                //       //       image: DecorationImage(
                //       //           image: AssetImage("assets/images/big.jpeg"),
                //       //           fit: BoxFit.fill)),
                //       // ),
                //       // Container(
                //       //   // alignment: Alignment.center,
                //       //   padding: EdgeInsets.only(top: 10, right: 10, left: 8),
                //       //   height: 120,
                //       //   width: MediaQuery.of(context).size.width / 3,
                //       //   child: Text(
                //       //     "عليك بالوصول الي علي قمه الجبل thdsnfnsjnaisjoidjasoijdoijas",
                //       //     textAlign: TextAlign.center,
                //       //     textDirection: TextDirection.rtl,
                //       //     style: TextStyle(
                //       //         // fontWeight: FontWeight.w600,
                //       //         height: 1.5,
                //       //         fontSize: 12,
                //       //         fontFamily: "thin",
                //       //         color: Colors.white),
                //       //   ),

                //       //   decoration: BoxDecoration(
                //       //       color: Colors.black54,
                //       //       borderRadius: BorderRadius.only(
                //       //           bottomRight: Radius.circular(12),
                //       //           topRight: Radius.circular(12))),
                //       // ),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblBuyCoins,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "thin",
                            color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BuyCoins2Page(coins:widget.inside.coins);
                        }));
                      },
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.only(left: 8, right: 8),
                        padding: EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(

                             borderRadius: BorderRadius.circular(15),
                          gradient:  LinearGradient(
                              begin: Alignment(-1.0, 1.0), colors: [
                            Colors.teal[900],
                            Colors.teal[200],
                            Colors.teal[900],
                          ]
                          ),),
                        child: Text(
                          AppLocalizations.of(context).lblGetmore,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "thin",
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 12, left: 12),
                //   child: Text(
                //     "هذا النص هو مثال لنص ممكن ان يستبدل ف نفس المكان لقد تم توليد",
                //     overflow: TextOverflow.clip,
                //     textAlign: TextAlign.right,
                //     // textAlign: TextAlign.right,
                //     textDirection: TextDirection.rtl,
                //     style: TextStyle(
                //         height: 1.5,
                //         fontSize: 11,
                //         fontFamily: "thin",
                //         color: Colors.grey),
                //   ),
                // ),
                Container(
                  height: 110,
                  margin: EdgeInsets.only(top: 4, bottom: 12),
                  child: ListView.builder(
                      itemCount: widget.inside.coins.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading=true;
                            });
                          paymentfun(_dataUser.getKey(Utility.ID),widget.inside.coins[index].id.toString());
                                                 
                                                      // Navigator.push(context,
                                                      //     MaterialPageRoute(builder: (context) {
                                                      //   return PayPage();
                                                      // }));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 4, right: 4),
                                                      child: Stack(
                                                        alignment: Alignment.bottomCenter,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 110,
                                                            width: MediaQuery.of(context).size.width / 3,
                          
                                                            //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                              border: new Border.all(color: Colors.grey),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 35),
                                                            child: Container(
                                                                width: 60,
                                                                height: 60,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/images/money_Gold.png"),
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                )),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(context).size.width / 3,
                                                            padding: EdgeInsets.all(8),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[
                                                                Text(
                                                                  "${widget.inside.coins[index].salary} ر.س  ",
                                                                  textAlign: TextAlign.center,
                                                                  textDirection: TextDirection.rtl,
                                                                  style: TextStyle(
                                                                      // fontWeight: FontWeight.w600,
                                                                      height: .8,
                                                                      fontSize: 13,
                                                                      fontFamily: "thin",
                                                                      color: Colors.white),
                                                                ),
                                                                  Text(
                                                                  widget.inside.coins[index].value.toString(),
                                                                  textAlign: TextAlign.center,
                                                                  textDirection: TextDirection.rtl,
                                                                  style: TextStyle(
                                                                      // fontWeight: FontWeight.w600,
                                                                      height: .8,
                                                                      fontSize: 13,
                                                                      fontFamily: "thin",
                                                                      color: Colors.white),
                                                                ),
                                                                
                                                              ],
                                                            ),
                                                            decoration: BoxDecoration(
                                                                color: Colors.black54,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomRight: Radius.circular(12),
                                                                    bottomLeft: Radius.circular(12))),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: (){
                                                if(widget.inside.offers.length!=0&&widget.inside.offers.length!=null){
setState(() {
                              isLoading=true;
                            });

 paymentfun2(_dataUser.getKey(Utility.ID),widget.inside.offers[0].id.toString());
                                                }
 

                                              },
                                                                                          child: Container(
                                                
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(top: 20),
                                                height: MediaQuery.of(context).size.height / 6,
                                                width: MediaQuery.of(context).size.width / 1.1,
                                                decoration: BoxDecoration(
                                                  gradient:  LinearGradient(
                                                      begin: Alignment(-1.0, 1.0), colors: [
                                                    Colors.teal[900],
                                                    Colors.teal[200],
                                                    Colors.teal[900],
                                                  ]
                                                  ),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: 
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: <Widget>[
                                                      Image.asset(
                                                          "assets/images/money.png",
                                                          width: 50,
                                                          height: 50,
                                                        ),
                                                      widget.inside.offers.length==0? Text(
                                                  "  " +"لا يوجد" + "  ",
                                                  textAlign: TextAlign.center,
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      // fontWeight: FontWeight.w600,
                                                      height: 1,
                                                      fontSize: 15,
                                                      fontFamily: "thin",
                                                      color: Colors.white),
                                                ):       Column(
                                                             mainAxisAlignment: MainAxisAlignment.center,
                                                             children: <Widget>[
                                                               Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "  " + AppLocalizations.of(context).lblRS + "  ",
                                                  textAlign: TextAlign.center,
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      // fontWeight: FontWeight.w600,
                                                      height: 1,
                                                      fontSize: 20,
                                                      fontFamily: "thin",
                                                      color: Colors.white),
                                                ),   Text(
                                              widget.inside.offers[0].value.toString(),
                                                  textAlign: TextAlign.center,
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      // fontWeight: FontWeight.w600,
                                                      height: 1,
                                                      fontSize: 20,
                                                      fontFamily: "thin",
                                                      color: Colors.white),
                                                ),
                                              
                                              ],
                                          ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                               Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "  " + AppLocalizations.of(context).lblCoins + "  ",
                                                  textAlign: TextAlign.center,
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      // fontWeight: FontWeight.w600,
                                                      height: 1,
                                                      fontSize: 15,
                                                      fontFamily: "thin",
                                                      color: Colors.white),
                                                ),  
                                                 Text(
                                                  widget.inside.offers[0].salary.toString(),
                                                  textAlign: TextAlign.center,
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      // fontWeight: FontWeight.w600,
                                                      height: 1,
                                                      fontSize: 15,
                                                      fontFamily: "thin",
                                                      color: Colors.white),
                                                ),
                                              
                                              ],
                                          ),
                                                             ],
                                                           ),
                                                        
                                                        
                                                  ],
                                                )
                                                // Text(
                                                //   AppLocalizations.of(context).lblChargeOffer,
                                                //   textAlign: TextAlign.center,
                                                //   style: TextStyle(
                                                //       fontSize: 25,
                                                //       fontFamily: "thin",
                                                //       color: Colors.white),
                                                // ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                              void paymentfun2(key, String string) {
                           
                            apiRequests.paymentoffer(key, string).then((valuee){
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
