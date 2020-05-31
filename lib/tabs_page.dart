import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/screens/TabsPages/contact_us_tab/contact_us.dart';

import 'package:mojtam3/screens/TabsPages/discover_tab/discover_page.dart';
import 'package:mojtam3/screens/TabsPages/desction_tab/discustion_page(.dart';
import 'package:mojtam3/screens/TabsPages/frinds_tab/friends_page.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/main_page.dart';
import 'package:mojtam3/test/local_notications_helper.dart';


class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>  {
   final notifications = FlutterLocalNotificationsPlugin();
  int _selectedPage = 2;
  int currentIdex = 1;
   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _options = [
    ContactsPage(),
    FriendsPage(),
    DiscoverPage(),
    MainPage(),
    DiscustionPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        // helper.onLocaleChanged = onLocaleChange;
        // _specificLocalizationDelegate = SpecificLocalizationDelegate(Locale("ar"));

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
     _firebaseMessaging.configure(
       onMessage: (Map<String, dynamic> message) async {
         print("onMessage tabs: $message");
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
          getMessage();
        // _navigateToItemDetail(message);
       },
     );
   
  }
//    Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
//    if (message.containsKey('data')) {
//      // Handle data message
//      final dynamic data = message['data'];
//    }

//    if (message.containsKey('notification')) {
//      // Handle notification message
//      final dynamic notification = message['notification'];
//    }

//    // Or do other work.
//  }
  Future onSelectNotification(String payload) async {

  }
 
  void getMessage(){
        final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
    // _appPushNotifications.notificationSubject.stream
    //     .listen((Map<dynamic, dynamic> data) {


    //   // print(data is Map);

    //   setState(() {
    //     _messagesList.add(
    //       Message(
    //         senderData: prefix0.SenderData(
    //           id: int.parse(data['data']['sender_id']),
    //           username: "",
    //           profileImage: data['data']['sender_image'],
    //         ),
    //         messageType: data['data']['type'],
    //         message: data['data']['body'],
    //       ),
    //     );
    //   });
    // });
  
   }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
        body: _options[_selectedPage],
        backgroundColor: Colors.blue,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: showFab
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPage = 4;
                    currentIdex = 2;
                  });
                },
                child: Container(
                  height: 80,
                  padding: EdgeInsets.all(8),
                  width: 80,
                  child: Hero(
                      tag: "logo",
                      child: Image.asset(
                        "assets/images/botton_chat.png",
                        fit: BoxFit.fill,
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
//image: DecorationImage(image: AssetImage("assets/images/botton_chat.png"),fit: BoxFit.cover),
                      color: Colors.grey[800]),
                ),
              )
            : null,
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.grey[800]
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light

              ),
          child: BottomNavigationBar(
            //  type: BottomNavigationBarType.fixed,

            currentIndex: currentIdex,
            onTap: (index) {
              if (index == 0) {
                setState(() {
                  _selectedPage = 3;
                  currentIdex = 0;
                });
              } else if (index == 1) {
                setState(() {
                  _selectedPage = 2;
                  currentIdex = 1;
                });
              } else if (index == 4) {
                setState(() {
                  _selectedPage = 1;
                  currentIdex = 4;
                });
              } else if (index == 5) {
                setState(() {
                  _selectedPage = 0;
                  currentIdex = 5;
                });
              }
            },
            //backgroundColor: Colors.grey,
            // fixedColor: Colors.red,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/home.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lblMain,
                    style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        fontFamily: "thin",
                        color: Colors.teal),
                  ),
                  icon: Image.asset(
                    "assets/images/home_off.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  )),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/groups.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lblDescover,
                    style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        fontFamily: "thin",
                        color: Colors.teal),
                  ),
                  icon: Image.asset(
                    "assets/images/groups_off.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  )),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.remove,color: Colors.grey[800],),
                  title: Text(""),
                  icon: Icon(Icons.remove,color: Colors.grey[800],)),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.remove,color: Colors.grey[800],),
                  title: Text(""),
                  icon: Icon(Icons.remove,color: Colors.grey[800],)),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/friends.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lblFrinds,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "thin",
                        color: Colors.teal,
                        height: 1.5),
                  ),
                  icon: Image.asset(
                    "assets/images/friends_off.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  )),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/contact.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lblContacts,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "thin",
                        color: Colors.teal,
                        height: 1.5),
                  ),
                  icon: Image.asset(
                    "assets/images/contact_off.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  )),
            ],
          ),

//      ),
        ));
  }
}
