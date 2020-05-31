import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:photo_view/photo_view.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
class GalleryPage extends StatefulWidget {
  final String imagePath;
  GalleryPage({this.imagePath});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
 

  var progress = "";
  bool downloading = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: PhotoView(


              // /**
              //  * 
              //  *  CachedNetworkImage(
              //             imageUrl:  Utility.BaseURL + documentSnapshot.data['image_url'],
              //              placeholder: (context, url) =>
              //                     CircularProgressIndicator(backgroundColor: Colors.teal,),
              //                       errorWidget: (context, url, error) =>
              //                     Icon(Icons.error),
              //             fit: BoxFit.fitWidth,
              //           )
              //  */

              // Networ kImage(Utility.BaseURL+widget.imagePath)
              imageProvider:NetworkImage(Utility.BaseURL+widget.imagePath),
            ),
          ),
          // GestureDetector(
          //   onTap: (){
          //     print("---------bfor download-------");
          //     _download();
          //   },
          //             child: Align(
          //     alignment: Alignment.bottomCenter,
          //               child: Container(height: 50,width: 100,color: Colors.teal,
          //               alignment: Alignment.center,
          //               child: Text(
          //               downloading==false?  AppLocalizations.of(context).lbldownload:progress,
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(color: Colors.white,fontFamily: "thin"),
          //               ),),
          //   ),
          // ),
        ],
      ),
    );
  }
   Future<void> _download() async {
     

    Dio dio = Dio();
try {
    var dirToSave = await getApplicationDocumentsDirectory();
    print("---------------path---------------");
    print(dirToSave);

    await dio.download(Utility.BaseURL+widget.imagePath, "${dirToSave.path}/myImage.jpg",
        onReceiveProgress: (rec, total) {
      setState(() {
        downloading = true;
        progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
      });
    });

    } catch (e) {
      print("============");
      print(e);
      throw e;
    }
    setState(() {
      downloading = false;
      progress = "Complete";
    });
   }
}
