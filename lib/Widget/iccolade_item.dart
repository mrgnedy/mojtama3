import 'package:flutter/material.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class Accolade extends StatelessWidget {
  final String imageUrl;

  Accolade(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,

      margin: EdgeInsets.only(right: 8, left: 8),
      //  width: MediaQuery.of(context).size.width / 6,
//color: Colors.red,
      child: ClipOval(
          child: ClipOval(
              child: FadeInImage.assetNetwork(

                  placeholder: "assets/images/reload2.gif",
                  image:
                  Utility.BaseURL+this.imageUrl,
                  fit: BoxFit.fill)))
    );
  }
}
