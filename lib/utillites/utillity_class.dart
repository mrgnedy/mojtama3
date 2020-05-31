



//import 'package:connectivity/connectivity.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
class Utility {
  //===================Status for Verification Code================//

DataUser _dataUser = DataUser.instance;
  static String TOKEN="token";
  static String Name="Platform";
  static String Email="DeviceToken";
  static String Password="password";
  static String BlackColor="0xDD000000";
   static String WhiteColor="0xFFFFFFFF";
   static String DarkMode="DarkMode";

  static String BackGroundColor="background";
  static String FontColor="fontcolor";
  static String ProfileImage="ProfileImage";
  static String BaseURL="http://mojtama3.life/public/images/";
  static String Imageurl="ProfileImage";
  static String ID="id";
  static String roomNotify="room_notify";
   static String chatNotify="chat_notify";
 static String messageNotify="message_notify";
//  static void showAlert(BuildContext context, String text) {
//     var alert = new AlertDialog(
//       content: Container(
//         child: Row(
//           children: <Widget>[Text(text)],
//         ),
//       ),
//       actions: <Widget>[
//         new FlatButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               "OK",
//               style: TextStyle(color: Colors.blue),
//             ))
//       ],
//     );}
  ///-------------------------- check connection ----------------
//  static Future<bool> checkInternetConnection(BuildContext context)async
//  {
//
//    var connectivityResult = await (Connectivity().checkConnectivity());
//
//    if (connectivityResult == ConnectivityResult.mobile)
//    {
//      // I am connected to a mobile network.
//      print("======================= // I am connected to a mobile network.=================") ;
//
//      return  true;
//
//    } else if (connectivityResult == ConnectivityResult.wifi)
//    {
//      // I am connected to a wifi network
//      print("======================= // I am connected to a wifi network ====================") ;
//
//      return  true;
//
//    }else if (connectivityResult == ConnectivityResult.none)
//    {
//      //Utility.showToast("تأكد من اتصال الانترنت",context: context,duration:Toast.LENGTH_LONG,chooseColor: 1,gravity:Toast.BOTTOM);
//
//      return   false;
//    }
//
//  }

// static Future<String> gehttimage() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   String token = pref.getString(Utility.ProfileImage);
//   print("----------------image from token ");
//   print(Utility.BaseURL+token);
//   return token;
// }
static void showErrorDialog(String tittel,String message,DialogType type,BuildContext contextc) {

        AwesomeDialog(context: contextc,
        
                dialogType: type,
                animType: AnimType.BOTTOMSLIDE,
                tittle: tittel,
                body:Column(
                  children: <Widget>[
                    Text(tittel,style: TextStyle(fontWeight:FontWeight.bold,fontFamily: "black",fontSize: 20)),
                   
                   Text(message,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontFamily: "thin",fontSize: 16)),
                   GestureDetector(
                     onTap: (){
  //                       setState(() {
  //   _isLoading = false;
  // });
      Navigator.of(contextc).pop();
                     },
                                        child: Container(
                       
                       width: 120,
                       height: 50,

                      // padding: EdgeInsets.all(8),
                       margin: EdgeInsets.only(top: 8),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: Colors.teal,
                         borderRadius: BorderRadius.all(Radius.circular(30))
                       ),
                       child: Text("ok",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontFamily: "black",fontSize: 18),),
                     ),
                   )
                  ],
                ),
                desc:message, //'message',
  //               btnCancelOnPress: () {
  //                   setState(() {
  //   _isLoading = false;
  // });
  //               },
  //               btnOkOnPress: () {

  //               }
                ).show();
        // showDialog(
        //   context: context,
        //   builder: (ctx)=>
        //          AlertDialog(
        //            backgroundColor: Colors.grey[200],
        //            shape:  RoundedRectangleBorder(
        //             borderRadius:
        //                 BorderRadius.circular(20.0)),
        //           title: Center(child: Text('An Error Occurred!')),
        //           content: Text(message),
        //           actions: <Widget>[
        //             FlatButton(
        //               child: Text('Okay',style: TextStyle(
        //                 color: Colors.teal
        //               ),),
        //               onPressed: () {
        //                 setState(() {
        //                   _isLoading = false;
        //                 });
        //                 Navigator.of(ctx).pop();
        //               },
        //             )
        //           ],
        //         )
    
        // );
      }
}

