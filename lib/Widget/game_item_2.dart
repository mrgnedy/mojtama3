import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class GameItem2 extends StatelessWidget {
  final String name;
  final String link;
  final String imagePath;

  GameItem2(this.name, this.link, this.imagePath);

  @override
  Widget build(BuildContext context) {
    print(this.imagePath);
    return Padding(
      padding: const EdgeInsets.only(right: 7, left: 7),
      child: ClipRRect(

        borderRadius: BorderRadius.circular(10),
        child: GridTile(

                //  width: MediaQuery.of(context).size.width/3-40,
              
          child: CachedNetworkImage(
                imageUrl:
                    imagePath,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              
                 fit: BoxFit.fill,),
          footer: Container(
padding: EdgeInsets.all(5),
            color: Colors.black54,
            child: Text(

              name,style: TextStyle(
              height: 1.2,
              color: Colors.white,
fontFamily: "thin"
            ),
              textAlign: TextAlign.center,
            ),

          ),
        ),
      )
    );
  }
}
