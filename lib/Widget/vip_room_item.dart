// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:cached_network_image/cached_network_image.dart';
class VipRoomItem extends StatelessWidget {
  final String name;
  final String description;
  final String totalFriends;
  final String dash;
  final String imageurl;
  int i = 0;

  VipRoomItem(this.name, this.description, this.totalFriends, this.dash,
      this.imageurl);

  @override
  Widget build(BuildContext context) {
    
    print(imageurl);
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5,bottom: 5),
      padding: EdgeInsets.only(right: 5, left: 5, top: 5),
      width: MediaQuery.of(context).size.width / 3.3,
      height: MediaQuery.of(context).size.height/3.5,
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
      //  height: MediaQuery.of(context).size.width/3-50,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/3,
                 height: MediaQuery.of(context).size.width/3-40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  
//                   child:Image.network(
//  this.imageurl,
 
//   fit: BoxFit.fill
// ),
//
               child:  CachedNetworkImage(
                   height: MediaQuery.of(context).size.width/3-40,
                   imageUrl: this.imageurl,
                   placeholder: (context, url) => CircularProgressIndicator(backgroundColor: Colors.black,),
                   errorWidget: (context, url, error) => Icon(Icons.error),
                     fit: BoxFit.fill
                 ),

//                    CachedNetworkImage(
//                      imageUrl :Utility.BaseURL+this.image_url,
//                      errorWidget: (context, url, error) => Icon(Icons.error),
//                    )
                ),
              ),
            ),
            //   child: Image.asset("assets/soud.jpg",fit: BoxFit.cover,)),
            Container(
              //alignment: Alignment.centerRight,
              child: Text(
                this.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: TextStyle(
                    height: 2,
                    fontSize: 10,
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
                    height: 1.5,
                    fontSize: 9,
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
      ),
    );
  }
}
