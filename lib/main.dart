import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mojtam3/Lozalization/Local_helper.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:flutter/services.dart';
import 'package:mojtam3/splash.dart';
import 'package:mojtam3/test/local_notications_helper.dart';
import 'package:mojtam3/test/widget/local_notfication_widget.dart';
import 'package:mojtam3/testchat/home/home.dart';
import 'package:mojtam3/tetst2.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:mojtam3/splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    // This widget is the root of your application.

    @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    SpecificLocalizationDelegate _specificLocalizationDelegate;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   final notifications = FlutterLocalNotificationsPlugin();

  Future onSelectNotification(String payload){}
   
    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        requestPermissions();
        helper.onLocaleChanged = onLocaleChange;
        _specificLocalizationDelegate = SpecificLocalizationDelegate(Locale("ar"));
        WidgetsFlutterBinding.ensureInitialized();
    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
             _firebaseMessaging.configure(
       onMessage: (Map<String, dynamic> message) async {
         print("onMessage main : ${message}");
         showOngoingNotification(notifications,
                  title:message["notification"]["title"].toString(), body:message["notification"]["body"].toString());
        // _showItemDialog(message);
       },
    //   onBackgroundMessage: myBackgroundMessageHandler,
       onLaunch: (Map<String, dynamic> message) async {
         print("onLaunch: $message");
        // _navigateToItemDetail(message);
       },
       onResume: (Map<String, dynamic> message) async {
         print("onResume: $message");
         // getMessage();
        // _navigateToItemDetail(message);
       },
     );
    }

    onLocaleChange(Locale locale) {
        setState(() {
            _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
        });

    }

  @override
  void dispose() {
    super.dispose();
  }
  requestPermissions() async {
    bool audioRes =
        await PermissionHandler().requestPermissions([PermissionGroup.microphone]) == PermissionStatus.granted;
    bool readRes = await PermissionHandler()
        .requestPermissions([PermissionGroup.storage]) == PermissionStatus.granted;
    // bool writeRes = await SimplePermissions
    //     .requestPermission(Permission.WriteExternalStorage) == PermissionStatus.authorized;
    return (audioRes && readRes );//&& writeRes);
  }
    @override
    Widget build(BuildContext context) {
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown,
   ]);

      return  MaterialApp(

//        color: Colors.white,
                theme: new ThemeData(
                    primaryColor: Colors.white,
                    accentColor: Colors.white,
                    backgroundColor: Colors.white,

                ),
                localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    new FallbackCupertinoLocalisationsDelegate(),
                    //app-specific localization
                    _specificLocalizationDelegate
                ],
                supportedLocales: [Locale('en'), Locale('ar')],
                locale: _specificLocalizationDelegate.overriddenLocale,
                debugShowCheckedModeBanner: false,

                home: Splash(),
            );       
    }
}
