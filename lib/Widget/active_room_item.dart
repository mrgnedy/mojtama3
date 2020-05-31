import 'package:flutter/material.dart';

class ActiveRoomItem extends StatelessWidget {
  final String name;
  final String description;
  final String totalFriends;
  final String dash;
  final String imageUrl;

  ActiveRoomItem(this.name, this.description, this.totalFriends, this.dash,
      this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
      padding: EdgeInsets.only(right: 5, left: 5, top: 5),
      width: MediaQuery.of(context).size.width / 3.3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        border: new Border.all(color: Colors.grey),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
        //color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage.assetNetwork(
                  height: MediaQuery.of(context).size.width/3-40,
                  placeholder: "assets/images/reload2.gif",
                  image:this.imageUrl
                  ,
                  fit: BoxFit.fill),
            ),
          ),
          //   child: Image.asset("assets/soud.jpg",fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              this.name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                  height: 2,
                  fontSize: 12,
                  fontFamily: "black",
                  color: Colors.black),
            ),
          ),

          Container(
            // width: MediaQuery.of(context).size.width/1.7,
            alignment: Alignment.centerRight,
            child: Text(
              this.description,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                  height: 2,
                  fontSize: 10,
                  fontFamily: "thin",
                  color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    this.dash,
                    style: TextStyle(fontSize: 8, color: Colors.grey),
                  ),
                  Image.asset(
                    "assets/images/flash.png",
                    height: 10,
                    width: 10,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    this.totalFriends,
                    style: TextStyle(fontSize: 8, color: Colors.grey),
                  ),
                  Image.asset(
                    "assets/images/all_friends.png",
                    height: 10,
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
