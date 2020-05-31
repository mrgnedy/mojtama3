import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/game_item.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/buy_coins.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/buy_id_profile_page.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/buy_profile_gifs.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/excellence_page.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/games_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mojtam3/model/models/marketModel.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  DataUser _dataUser = DataUser.instance;
  MarketModel marketmodel;
  bool isLoading = false;
  ApiRequests apiRequests = new ApiRequests();
  @override
  void initState() {
    //imageCache.clear();
    isLoading = true;
    apiRequests.getMarketData().then((value) {
      print("---------------------------tiger---------------");
      print(value);
      setState(() {
        marketmodel = value;
        isLoading = false;
        print("--------------value");
        // print(marketmodel.data.inside);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(
        _dataUser.getKey(Utility.BackGroundColor),
      )),
      appBar: new AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          AppLocalizations.of(context).lblMarket,
          style:
              TextStyle(fontSize: 20, fontFamily: "thin", color: Colors.white),
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
          child: isLoading
              ?
                   Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.teal,
                      ),
                    ):
                    marketmodel==null?Center(
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
                            )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //todo thire is black container
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
                                      marketmodel.data.remains.toString(),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BuyCoins(
                                    inside: marketmodel.data.inside);
                              }));
                            },
                            child: Container(
                              height: 30,
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 15),
                              padding: EdgeInsets.only(right: 8, left: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment(-1.0, 1.0),
                                    colors: [
                                      Colors.teal[900],
                                      Colors.teal[200],
                                      Colors.teal[900],
                                    ]),
                              ),
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
                    ),
                    //todo thire is first game
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: CarouselSlider(
                        items:
                            List.generate(marketmodel.data.ads.length, (index) {
                          return Stack(
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
                                        marketmodel.data.ads[index].image,
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
                                padding: EdgeInsets.only(
                                    top: 10, right: 10, left: 8),
                                height: 100,
                                width: MediaQuery.of(context).size.width / 3,
                                margin: EdgeInsets.only(right: 4, left: 4),
                                child: Text(
                                  marketmodel.data.ads[index].desc,
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

              
                    ),
                    //todo thire is first احقصل المريد
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: Text(
                            AppLocalizations.of(context).lblBotsgames,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "thin",
                              color: Color(int.parse(
                                  _dataUser.getKey(Utility.FontColor))),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if(marketmodel.data.games.length == 0){
                                 Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Games_page(marketmodel.data.games);
                            }));
                            }
                         
                          },
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.only(right: 8, left: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment(-1.0, 1.0),
                                  colors: [
                                    Colors.teal[900],
                                    Colors.teal[200],
                                    Colors.teal[900],
                                  ]),
                            ),
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
                    //       height: 1.5,
                    //       fontSize: 11,
                    //       fontFamily: "thin",
                    //       color: Color(int.parse(
                    //         _dataUser.getKey(Utility.FontColor),
                    //       )),
                    //     ),
                    //   ),
                    // ),
                    Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Color(int.parse(
                          _dataUser.getKey(Utility.BackGroundColor),
                        )),
                        margin: EdgeInsets.only(top: 4, bottom: 12),
                        child:marketmodel.data.games.length == 0?Center(child:Text("NO DATA FOUNDED",style: TextStyle(color: Colors.yellow),)): ListView.builder(
                            itemCount: marketmodel.data.games.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return GameItem(
                                  marketmodel.data.games[index].name,
                                  "",
                                  Utility.BaseURL +
                                      "/" +
                                      marketmodel.data.games[index].image);
                            })),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            filttergifaccout(marketmodel.data.gifs);
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 2.2,

                                //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/text.gif"),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .lblBuyGifForYourAccount,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.w600,
                                      height: .8,
                                      fontSize: 12,
                                      fontFamily: "thin",
                                      color: Colors.white),
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
                        GestureDetector(
                          onTap: () {
                            filttergifroom(marketmodel.data.gifs);
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 2.2,

                                //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/text2.gif"),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              //                    Container(
                              //                        width: MediaQuery.of(context).size.width / 2.5,height: MediaQuery.of(context).size.height/6,
                              //                        decoration: BoxDecoration(
                              //                          borderRadius: BorderRadius.circular(15),
                              //                          image: DecorationImage(
                              //                            image:
                              //                            AssetImage("assets/images/text2.gif"),
                              //                            fit: BoxFit.fill,),)),

                              GestureDetector(
                                //           onTap: (){
                                //  //      Navigator.push(context,
                                //  //     MaterialPageRoute(builder: (context) {
                                //  //   return BuyProfileGifsPage(snapshot.data.data.gifs);
                                //  // }));
                                //    },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .lblBuyGifForYourRoom,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        // fontWeight: FontWeight.w600,
                                        height: .8,
                                        fontSize: 12,
                                        fontFamily: "thin",
                                        color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            filtteridsaccout(marketmodel.data.specialIds);
                            //  Navigator.push(context,
                            //      MaterialPageRoute(builder: (context) {
                            //        return BuyIdsProfilePage();
                            //      }));
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 2.2,

                                //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(-1.0, 1.0),
                                      colors: [
                                        Colors.teal[900],
                                        Colors.teal[200],
                                        Colors.teal[900],
                                      ]),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "ID",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                      fontFamily: "black"),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .lblBuyIdForAccount,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.w600,
                                      height: .8,
                                      fontSize: 13,
                                      fontFamily: "thin",
                                      color: Colors.white),
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
                        GestureDetector(
                          onTap: () {
                            //  Navigator.push(context,
                            //      MaterialPageRoute(builder: (context) {
                            //    return  BuyIdsProfilePage();
                            //  }));
                            filtteridsroom(marketmodel.data.specialIds);
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 2.2,

                                //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(-1.0, 1.0),
                                      colors: [
                                        Colors.teal[900],
                                        Colors.teal[200],
                                        Colors.teal[900],
                                      ]),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "ID",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                      fontFamily: "black"),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  AppLocalizations.of(context).lblBuyIdForRoom,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      height: .8,
                                      fontSize: 13,
                                      fontFamily: "thin",
                                      color: Colors.white),
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
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: 20, right: 10, left: 10, bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, 1.0),
                            colors: [
                              Colors.teal[900],
                              Colors.teal[200],
                              Colors.teal[900],
                            ]),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: FlatButton(
                        child: Text(
                          AppLocalizations.of(context)
                              .lblDistinguishyourroomandplaceitintheviprooms,
                          style: TextStyle(
                              fontFamily: "thin",
                              color: Colors.white,
                              fontSize: 13),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ExcellencePage(
                                places: marketmodel.data.places);
                          }));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )),
    );
  }

  void filttergifaccout(List<Gifs> gifs) {
    List<Gifs> itrator = [];
    for (int i = 0; i < gifs.length; i++) {
      if (gifs[i].type == 'دردشة') {
        itrator.add(gifs[i]);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BuyProfileGifsPage(
        gifs: itrator,
        isRoom: 0,
      );
//return BuyProfileGifsPage(itrator,0);
    }));
  }

  void filtteridsaccout(List<SpecialIds> specialIds) {
    List<SpecialIds> itrator = [];
    for (int i = 0; i < specialIds.length; i++) {
      if (specialIds[i].type == 'دردشة') {
        itrator.add(specialIds[i]);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BuyIdsProfilePage(
        ids: itrator,
        isRoom: 0,
      );
//return BuyProfileGifsPage(itrator,0);
    }));
  }

  void filttergifroom(List<Gifs> gifs) {
    List<Gifs> itrator = [];
    for (int i = 0; i < gifs.length; i++) {
      if (gifs[i].type == 'غرف') {
        itrator.add(gifs[i]);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BuyProfileGifsPage(
        gifs: itrator,
        isRoom: 1,
      );
    }));
  }

  void filtteridsroom(List<SpecialIds> specialIds) {
    List<SpecialIds> itrator = [];
    for (int i = 0; i < specialIds.length; i++) {
      if (specialIds[i].type == 'غرف') {
        itrator.add(specialIds[i]);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BuyIdsProfilePage(
        ids: itrator,
        isRoom: 1,
      );
    }));
  }
}
/*
ListView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return GameItem(
                            "اسم اللعبة", "", "assets/images/small.jpeg");
                      }),
 */
