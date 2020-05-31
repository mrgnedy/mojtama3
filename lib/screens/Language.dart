import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/Local_helper.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/screens/authScreen/login_page.dart';

import 'package:mojtam3/tabs_page.dart';

import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  
  DataUser _dataUser=DataUser.instance;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 15,
                            bottom: MediaQuery.of(context).size.height / 16),
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Image.asset("assets/logo.png")),
                  ),
                 // WidgetANimator(
                    Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Rectangle2.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Text(AppLocalizations.of(context).lblLanguage,
                          style: TextStyle(
                            fontFamily: "black",
                          )),
                    ),
                //  ),
                 // WidgetANimator(
                    GestureDetector(
                      onTap: () {
                        this.setState(() {
                          helper.onLocaleChanged(new Locale("ar"));
                        });
                        _valdaite(context);
//                        Navigator.pushAndRemoveUntil(context,
//                            MaterialPageRoute(builder: (context) {
//                          return LoginPage();
//                        }), (Route<dynamic> route) => false);

                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 6.5,
                            right: 5,
                            left: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "العربيه",
                          style: TextStyle(fontFamily: "black"),
                        ),
                      ),
                    ),
               //   ),
               //   WidgetANimator(
                    GestureDetector(
                      onTap: () {
                        this.setState(() {
                          helper.onLocaleChanged(new Locale("en"));
                        });
                        _valdaite(context);
//                        Navigator.pushAndRemoveUntil(context,
//                            MaterialPageRoute(builder: (context) {
//                          return LoginPage();
//                        }), (Route<dynamic> route) => false);
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "english",
                          style: TextStyle(fontFamily: "black"),
                        ),
                      ),
                    ),
                //  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _valdaite(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("------------language screen ------------------");
    print(prefs.get(Utility.ID));
    String token=prefs.get(Utility.TOKEN);
    String image=prefs.get(Utility.ProfileImage);
    String id=prefs.get(Utility.ID);
     String name=prefs.get(Utility.Name);
    String background =prefs.get(Utility.BackGroundColor);
    String fontcolor = prefs.get(Utility.FontColor);
    String darkmode = prefs.get(Utility.DarkMode);
      String roomNotify = prefs.get(Utility.roomNotify);
     String chatNotify = prefs.get(Utility.chatNotify);
       String messageNotify = prefs.get(Utility.messageNotify);

   if( token != null){
     print("image ------------------"+image);
     _dataUser.setKey({'key':Utility.TOKEN,'value':token});
     _dataUser.setKey({'key':Utility.ProfileImage,'value':image});
     _dataUser.setKey({'key':Utility.ID,'value':id});
     _dataUser.setKey({'key':Utility.Name,'value':name});
     _dataUser.setKey({'key': Utility.BackGroundColor, 'value': background});
   _dataUser.setKey({'key': Utility.FontColor, 'value': fontcolor});
   _dataUser.setKey({'key': Utility.DarkMode, 'value': darkmode});
   _dataUser.setKey({'key': Utility.roomNotify, 'value': roomNotify});
    _dataUser.setKey({'key': Utility.chatNotify, 'value': chatNotify});
     _dataUser.setKey({'key': Utility.messageNotify, 'value': messageNotify});
print("hhhhhhhhhhhhhh");
print( token);


//     FutureBuilder<bool>(
//  future: Provider.of<Auth>(context, listen: false).getUser() ,
//
//
//  builder: (context,snapshot){
//
//    //////////////////
//    print(snapshot.connectionState.toString());
//    if(snapshot.data==false)
//    {
//      print("wait");
//      return CircularProgressIndicator(backgroundColor: Colors.teal,);
//    }
//
//
//    return CircularProgressIndicator(backgroundColor: Colors.teal,);
//
//
//
//
//
//
//    ///)///////////////////
//    });

Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) {

      return TabsPage();
    }), (Route<dynamic> route) => false);
    }
     else{
     
     Navigator.pushAndRemoveUntil(context,
         MaterialPageRoute(builder: (context) {
           return LoginPage();
         }), (Route<dynamic> route) => false);
   }
  }

}