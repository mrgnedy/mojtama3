import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FrendsItem extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String totalFriends;
  final String dash;

  FrendsItem(this.name, this.description, this.totalFriends, this.dash,
      this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: 
                
                    /**
                     *  CachedNetworkImage(
                              imageUrl:
                                  Utility.BaseURL + widget.room_model.image,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 40,
                              width: 40,

                              fit: BoxFit.fill,
                              //  width: MediaQuery.of(context).size.width/3-40,
                            )
                     */
                
                
                
                CachedNetworkImage(
                    height: MediaQuery.of(context).size.width/5,
                    width: MediaQuery.of(context).size.width/3.5,

                    placeholder: (context, url) =>
                                  CircularProgressIndicator(backgroundColor: Colors.teal,),
                 imageUrl:this.imageUrl
                    ,
                    fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top:5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // width: MediaQuery.of(context).size.width/1.7,
                    // alignment: Alignment.centerLeft,
                    child: Text(
                      this.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontFamily: "black",
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    this.description,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 10,
                        height: 1.5,
                        fontFamily: "thin",
                        color: Colors.black38),
                  ),
                  Row(
                    children: <Widget>[

                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        this.totalFriends,
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: "thin",
                            color: Colors.grey),
                      ),
                      Image.asset(
                        "assets/images/all_friends.png",
                        height: 15,
                        width: 15,
                      ),
                    ],
                  ),

//
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
