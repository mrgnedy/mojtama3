import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GameItem extends StatelessWidget {
  final String name;
  final String link;
  final String imagePath;

  GameItem(this.name, this.link, this.imagePath);

  @override
  Widget build(BuildContext context) {
    print("------------------image-----------------------");
    print(imagePath);
    return Padding(
      padding: const EdgeInsets.only(right: 7, left: 7),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width / 3,

              //child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: 
                ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                                                      child: CachedNetworkImage(
                imageUrl:
                    imagePath,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              
                 fit: BoxFit.cover,
                //  width: MediaQuery.of(context).size.width/3-40,
              ),
                                  )
                
                
                
                
                
                
           
            ),
          ),
          Container(
            //   alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            //  height: 30,
            width: MediaQuery.of(context).size.width / 3,

            child: Text(
              this.name,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  // fontWeight: FontWeight.w600,
                  height: 1,
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
    );
  }
}
