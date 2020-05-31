import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GroubItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String descrption1;
  final String description2;
  final String time;
  final String count;

  GroubItem(this.imageUrl, this.name, this.descrption1, this.description2,
      this.time, this.count);

  @override
  Widget build(BuildContext context) {
    print("roooom");
    print(name);
    print(imageUrl);
    print(descrption1);
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /////////////////////
            Container(
              // width: 90,
              // height: 80,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     image: DecorationImage(
              //         image: AssetImage(this.image_url), fit: BoxFit.fill))
              height: MediaQuery.of(context).size.width/5,
                    width: MediaQuery.of(context).size.width/3.5,
                    child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                /**
                 * 
                                                 CachedNetworkImage(
        imageUrl: this.image_url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
                 */
                child:           CachedNetworkImage(
        imageUrl: this.imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
              ),
            ),
            ///////////////
            Flexible(
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
                          fontSize: 14,
                          height: 1,
                          fontFamily: "black",
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    //   alignment: Alignment.centerLeft,
                    child: Text(
                      this.descrption1,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          fontFamily: "thin",
                          color: Colors.black54),
                    ),
                  ),
                  Text(
                    this.description2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 10,
                        height: 1.5,
                        fontFamily: "thin",
                        color: Colors.black38),
                  ),

//
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
