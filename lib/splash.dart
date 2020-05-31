import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mojtam3/screens/language.dart';

import 'package:shared_preferences/shared_preferences.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
//  final FirebaseMessaging _fcm = FirebaseMessaging();

//  StreamSubscription iosSubscription;
  SharedPreferences prefs;
  @override
  void initState() {
//    Timer(
//        Duration(seconds: 5),
//        () => Navigator.pushAndRemoveUntil(context,
//                MaterialPageRoute(builder: (context) {
//              return Language();
//            }), (Route<dynamic> route) => false));
    // TODO: implement initState

    startTime();
  //  checkOSAndSaveToken();
    super.initState();
  }
  startTime() async
  {
    var _duration = new Duration(seconds: 4);
    prefs = await SharedPreferences.getInstance();
    print("mmmmmmmmmmmmmmmmmoooooooooooooooooosssssssssssssssss");

    return new Timer(_duration,  () async{
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  return Language();
}));
        // Navigator.pushAndRemoveUntil(context ,
        //     MaterialPageRoute(builder: (context) {
        //       return Language();
        //     }) , (Route<dynamic> route) => false);






    });
  }

//  void checkOSAndSaveToken() async
//  {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//
////    //------------------------Get Device Token --------------------------//
//
//    _fcm.getToken().then((token)
//    {
//      print('token------ $token');
//      prefs.setString(Utility.Device_Token, token);
//    });
//
//    if (Platform.isIOS)
//    {
//      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
//        print('ios subscription   $iosSubscription    finished');
//        // save the token  OR subscribe to a topic here
//      });
//
//      _fcm.requestNotificationPermissions(IosNotificationSettings());
//    }
//
//
//
//
//
//
//    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//
//    if (Platform.isAndroid)
//    {
//      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//      prefs.setString(Utility.OS_Platform, "isAndroid");
//
//
//    } else if (Platform.isIOS)
//    {
//      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//      prefs.setString(Utility.OS_Platform, "isIOS");
//      print("-----------------------This Ios ${iosInfo.model}---------------------");
//    }
//
//  }
  @override
  Widget build(BuildContext context) {
    print("---------------tiger---------------");
    return Scaffold(
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/splash.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset("assets/logo.png")),
      ),
    );
  }
}
