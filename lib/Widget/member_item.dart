import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/utillites/utillity_class.dart';


class MemberItem extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
DataUser _dataUser = DataUser.instance;

  MemberItem(this.name, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
print("--------------request page----------");
print(Utility.BaseURL+ this.imageUrl);
        return Container(
          margin:  const EdgeInsets.all(8),
          color: Colors.white,
                  child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipOval(
                      child:          CachedNetworkImage(
                           width: 60,
                        height: 60,
        imageUrl: Utility.BaseURL+ this.imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.fill
     )
                      
                      
                      
                      
                      // Image.network(
                      //  Utility.BaseURL+ this.imageUrl,
                      //   width: 60,
                      //   height: 60,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              this.name,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontFamily: "thin",
                                  fontSize: 14,
                                   color:Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              this.description,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                       color:Colors.black,
                                fontFamily: "thin",
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: Colors.black,
                )
              ],
            ),
          ),
        );
     
  }
}
