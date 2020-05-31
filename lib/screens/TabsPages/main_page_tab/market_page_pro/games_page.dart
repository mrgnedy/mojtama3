import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

import 'package:mojtam3/Widget/game_item_2.dart';

import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/GamePlayPage.dart';

import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:mojtam3/model/models/marketModel.dart';


class Games_page extends StatefulWidget {
        
        
      final List<Games> games;
  Games_page(this.games);

  @override
  _Games_pageState createState() => _Games_pageState();
}

class _Games_pageState extends State<Games_page> {
    DataUser _dataUser = DataUser.instance;
  @override
  Widget build(BuildContext context) {
  
   
        return Scaffold(
        backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
            appBar: AppBar(
              backgroundColor: Colors.grey[800],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,color: Colors.white,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                AppLocalizations.of(context).lblgamesandBots,
                style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white),
              ),
            ),
            body: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: widget.games.length,

                    itemBuilder: (ctx, i) => // WidgetANimator(
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
return GmaePlay_Page(url:widget.games[i]);
                        }));
                      },
                                          child: GameItem2(widget.games[i].name, "",
                          Utility.BaseURL+"/"+widget.games[i].image),
                    ),
                    //  ),
                    // builder: (c) => products[i],

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 2.5,
                      mainAxisSpacing: 5,
                    ),
                  )
               );
      
  }
}
