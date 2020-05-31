import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

class BuyCoins2 extends StatelessWidget {
  final String price;
final String value;
  final String imagePath;

  BuyCoins2(this.price,this.value, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7, left: 7),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 5.5,
            width: MediaQuery.of(context).size.width / 2,

            //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  this.imagePath,
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  
                     Text(
                      this.price,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          // fontWeight: FontWeight.w600,
                          height: 1,
                          fontSize: 15,
                          fontFamily: "thin",
                          color: Colors.white),
                    ),   Text(
                      "  " + AppLocalizations.of(context).lblRS + "  ",
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
                  Text(
                      "("+ this.value+")",
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
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
          ),
        ],
      ),
    );
  }
}
