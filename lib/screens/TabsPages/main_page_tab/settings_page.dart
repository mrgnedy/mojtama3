import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/condetions.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'change_email_password.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //bool _value1 = false;
ApiRequests apiRequests = new ApiRequests();
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
 DataUser _dataUser = DataUser.instance;
  //void _onChanged1(bool value) => setState(() => _value1 = value);

  void _onChanged3(bool value) => setState(() => _value3 = value);

  void _onChanged4(bool value) => setState(() => _value4 = value);

  void _onChanged5(bool value) => setState(() => _value5 = value);
  bool isLoading =false;

  @override
  Widget build(BuildContext context) {

  
      return Scaffold(
        backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            AppLocalizations.of(context).lblSetting,
            style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white),
            
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child:isLoading?Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,)): Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Text(
                    AppLocalizations.of(context).lblPublic,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "black",
                        color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(right: 8, left: 8),
                //   margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.circular(8),
                //     border: new Border.all(color: Colors.grey),
                //   ),
                //   child: Row(
                //     //crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Text(
                //         AppLocalizations.of(context)
                //             .lblAcceptToReceiveMessageFromAllUsers,
                //         overflow: TextOverflow.ellipsis,
                //         style: TextStyle(fontSize: 11.5, fontFamily: "thin"),
                //       ),
                //       Switch(
                //         value: _value1,
                //         onChanged: _onChanged1,
                //         activeColor: Colors.green,
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: new Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).lblChangeEmailandPassword,
                        style: TextStyle(fontSize: 12, fontFamily: "thin"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChangeEmailPassword();
                          }));
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: new Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Text(
                          AppLocalizations.of(context).lblTermsandConditions,
                          style: TextStyle(fontSize: 12, fontFamily: "thin"),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: Colors.black,
                        ),
                        onPressed: (){
                             Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return condtions();
                          }));
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: new Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).lblversion,
                          style: TextStyle(fontSize: 12, fontFamily: "thin"),
                        ),
                        Text(
                          "  1.1.9 ",
                          style: TextStyle(fontSize: 14, fontFamily: "black"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Text(
                    AppLocalizations.of(context).lblTheAppearance,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "black",
                        color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: new Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Text(
                          AppLocalizations.of(context).lblDarkMode,
                          style: TextStyle(fontSize: 12, fontFamily: "thin"),
                        ),
                      ),
                      Switch(
                        value:  _dataUser.getKey(Utility.DarkMode)=="false"?false:true,

                        onChanged: (value) async {
                           if (value == true){
                           
                                                     SharedPreferences pref = await SharedPreferences.getInstance();
                             pref.setString(Utility.BackGroundColor,Utility.BlackColor);
                             pref.setString(Utility.FontColor,Utility.WhiteColor);
                              _dataUser.setKey({'key': Utility.BackGroundColor, 'value': Utility.BlackColor});
                              _dataUser.setKey({'key': Utility.FontColor, 'value': Utility.WhiteColor});
                              pref.setString(Utility.DarkMode,"true");
                               _dataUser.setKey({'key': Utility.DarkMode, 'value': "true"});
                             
                             setState(() {
                               
                             });
                                                          
                                                        }else{
                                                          SharedPreferences pref = await SharedPreferences.getInstance();
                             pref.setString(Utility.BackGroundColor,Utility.WhiteColor);
                             pref.setString(Utility.FontColor,Utility.BlackColor);
                              _dataUser.setKey({'key': Utility.BackGroundColor, 'value': Utility.WhiteColor});
                              _dataUser.setKey({'key': Utility.FontColor, 'value': Utility.BlackColor});
                              pref.setString(Utility.DarkMode,"false");
                               _dataUser.setKey({'key': Utility.DarkMode, 'value': "false"});
                                                       setState(() {
                               
                             });
                                                       
                                                        }
                             
                                                       // if (value == true){
                                                       //   stetype(value);
                                                       //   ui.coloreOFbackground = Colors.grey[900];
                                                       //  // ui.coloreball = Colors.grey[400];
                                                       //   ui.coloreofFont = Colors.white;
                                                       //   ui.darkmodecheck = value;
                             
                                                       //   setState(() {});
                             
                                                       // } else {
                                                       //   stetype(value);
                                                       //   ui.coloreOFbackground = Colors.white;
                                                       //   //ui.coloreball = Colors.grey[400];
                                                       //   ui.coloreofFont = Colors.black;
                                                       //   ui.darkmodecheck = value;
                             
                                                       //   setState(() {});
                                                       // }
                                                     },
                                                     activeColor: Colors.green,
                                                   )
                                                 ],
                                               ),
                                             ),
                                             Container(
                                               padding: EdgeInsets.only(right: 8, left: 8),
                                               margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                                               decoration: BoxDecoration(
                                                 color: Colors.grey[300],
                                                 shape: BoxShape.rectangle,
                                                 borderRadius: BorderRadius.circular(8),
                                                 border: new Border.all(color: Colors.grey),
                                               ),
                                               child: Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: <Widget>[
                                                   Padding(
                                                     padding: const EdgeInsets.only(
                                                         left: 8, right: 8, top: 8, bottom: 8),
                                                     child: Text(
                                                       AppLocalizations.of(context).lblChatBackgroundColor,
                                                       style: TextStyle(fontSize: 12, fontFamily: "thin"),
                                                     ),
                                                   ),
                                                   IconButton(
                                                     icon: Icon(
                                                       Icons.chevron_right,
                                                       size: 30,
                                                     ),
                                                     onPressed: () {},
                                                   )
                                                 ],
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(right: 12, left: 12),
                                               child: Text(
                                                 AppLocalizations.of(context).lblAlerts,
                                                 style: TextStyle(
                                                     fontSize: 15,
                                                     fontFamily: "black",
                                                     color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                                               ),
                                             ),
                                             Container(
                                               padding: EdgeInsets.only(right: 8, left: 8),
                                               margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                                               decoration: BoxDecoration(
                                                 color: Colors.grey[300],
                                                 shape: BoxShape.rectangle,
                                                 borderRadius: BorderRadius.circular(8),
                                                 border: new Border.all(color: Colors.grey),
                                               ),
                                               child: Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: <Widget>[
                                                   Padding(
                                                     padding: const EdgeInsets.only(
                                                         left: 8, right: 8, top: 8, bottom: 8),
                                                     child: Text(
                                                       AppLocalizations.of(context).lblSoundsOfAlerts,
                                                       style: TextStyle(fontSize: 12, fontFamily: "thin"),
                                                     ),
                                                   ),
                                                   Switch(
                                                    value:  _dataUser.getKey(Utility.messageNotify).toString()=="1"?true:false,
                                                     onChanged: (value){
                                                           if (value == true){
                             
                               changenotifcation("1","message_notify","http://mojtama3.life/api/upmessagenotify",1);
                             
                             
                             //                         SharedPreferences pref = await SharedPreferences.getInstance();
                             // pref.setString(Utility.BackGroundColor,Utility.BlackColor);
                             // pref.setString(Utility.FontColor,Utility.WhiteColor);
                             //  _dataUser.setKey({'key': Utility.BackGroundColor, 'value': Utility.BlackColor});
                             //  _dataUser.setKey({'key': Utility.FontColor, 'value': Utility.WhiteColor});
                             //  pref.setString(Utility.DarkMode,"true");
                             //   _dataUser.setKey({'key': Utility.DarkMode, 'value': "true"});
                             
                             // setState(() {
                               
                             // });
                                                          
                                                        }else{
                                changenotifcation("0","message_notify","http://mojtama3.life/api/upmessagenotify",1);                      
                                                        }
                                                     },
                                                     activeColor: Colors.green,
                                                   )
                                                 ],
                                               ),
                                             ),
                                             Container(
                                               padding: EdgeInsets.only(right: 8, left: 8),
                                               margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                                               decoration: BoxDecoration(
                                                 color: Colors.grey[300],
                                                 shape: BoxShape.rectangle,
                                                 borderRadius: BorderRadius.circular(8),
                                                 border: new Border.all(color: Colors.grey),
                                               ),
                                               child: Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: <Widget>[
                                                   Padding(
                                                     padding: const EdgeInsets.only(
                                                         left: 8, right: 8, top: 8, bottom: 8),
                                                     child: Text(
                                                       AppLocalizations.of(context).lblSoundsOfPrivateAlerts,
                                                       style: TextStyle(fontSize: 12, fontFamily: "thin"),
                                                     ),
                                                   ),
                                                   Switch(
                                                     value:  _dataUser.getKey(Utility.chatNotify).toString()=="1"?true:false,
                                                     onChanged: (value){
                                                           if (value == true){
                             
                               changenotifcation("1","chat_notify","http://mojtama3.life/api/upchatnotify",2);
                             
                             
                             //                         SharedPreferences pref = await SharedPreferences.getInstance();
                             // pref.setString(Utility.BackGroundColor,Utility.BlackColor);
                             // pref.setString(Utility.FontColor,Utility.WhiteColor);
                             //  _dataUser.setKey({'key': Utility.BackGroundColor, 'value': Utility.BlackColor});
                             //  _dataUser.setKey({'key': Utility.FontColor, 'value': Utility.WhiteColor});
                             //  pref.setString(Utility.DarkMode,"true");
                             //   _dataUser.setKey({'key': Utility.DarkMode, 'value': "true"});
                             
                             // setState(() {
                               
                             // });
                                                          
                                                        }else{
                                changenotifcation("0","chat_notify","http://mojtama3.life/api/upchatnotify",2);               
                                                        }
                                                     },
                                                     activeColor: Colors.green,
                                                   )
                                                 ],
                                               ),
                                             ),
                                             Container(
                                               padding: EdgeInsets.only(right: 8, left: 8),
                                               margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                                               decoration: BoxDecoration(
                                                 color: Colors.grey[300],
                                                 shape: BoxShape.rectangle,
                                                 borderRadius: BorderRadius.circular(8),
                                                 border: new Border.all(color: Colors.grey),
                                               ),
                                               child: Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: <Widget>[
                                                   Padding(
                                                     padding: const EdgeInsets.only(
                                                         left: 8, right: 8, top: 8, bottom: 8),
                                                     child: Text(
                                                       AppLocalizations.of(context).lblSoundsOfRoomAlerts,
                                                       style: TextStyle(fontSize: 12, fontFamily: "thin"),
                                                     ),
                                                   ),
                                                   Switch(
                                                     value:  _dataUser.getKey(Utility.roomNotify).toString()=="1"?true:false,
                                                         onChanged: (value){
                                                           if (value == true){
                             
                               changenotifcation("1","room_notify","http://mojtama3.life/api/uproomnotify",3);
                             
                             
                             //                         SharedPreferences pref = await SharedPreferences.getInstance();
                             // pref.setString(Utility.BackGroundColor,Utility.BlackColor);
                             // pref.setString(Utility.FontColor,Utility.WhiteColor);
                             //  _dataUser.setKey({'key': Utility.BackGroundColor, 'value': Utility.BlackColor});
                             //  _dataUser.setKey({'key': Utility.FontColor, 'value': Utility.WhiteColor});
                             //  pref.setString(Utility.DarkMode,"true");
                             //   _dataUser.setKey({'key': Utility.DarkMode, 'value': "true"});
                             
                             // setState(() {
                               
                             // });
                                                          
                                                        }else{
                                            changenotifcation("0","room_notify","http://mojtama3.life/api/uproomnotify",3);             
                                                        }
                                                     },
                                                     activeColor: Colors.green,
                                                   )
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                             //        body: SingleChildScrollView(
                             //          child: Column(
                             //            children: <Widget>[
                             //              Row(
                             //                children: <Widget>[
                             //          Padding(
                             //          padding: const EdgeInsets.all(5.0),
                             //          child: ClipOval(
                             //              child: Image.asset(
                             //                "assets/images/profile.jpg",
                             //                fit: BoxFit.fill,
                             //              )),
                             //        ),
                             //                  Column(
                             //                    children: <Widget>[
                             //                      TextFormField(
                             //                        validator: (value) {
                             //                          if (value.isEmpty) {
                             //                            return"اضف المستخدم";
                             //                          }
                             //                          return null;
                             //                        },
                             //                        cursorColor: Colors.white,
                             //                        style: TextStyle(fontSize: 12, color: Colors.white),
                             //                        keyboardType: TextInputType.number,
                             //                        //s textAlign: TextAlign.right,
                             //                        decoration: InputDecoration(
                             //                            hintStyle: TextStyle(fontSize: 12, color: Colors.white,fontFamily: "black"),
                             //                            focusedBorder: UnderlineInputBorder(
                             //                              borderSide: BorderSide(color: Colors.blue),
                             //                            ),
                             //                            hintText: "",
                             //                            labelText: "رقم المستخدم",labelStyle: TextStyle(
                             //                            fontSize: 12,
                             //                            fontFamily: "thin",
                             //                            color: Colors.blue
                             //
                             //                        ),
                             //                            contentPadding: EdgeInsets.all(10)
                             //
                             //                        ),
                             //                      ),
                             //                      TextFormField(
                             //                        validator: (value) {
                             //                          if (value.isEmpty) {
                             //                            return"اضف المستخدم";
                             //                          }
                             //                          return null;
                             //                        },
                             //                        cursorColor: Colors.white,
                             //                        style: TextStyle(fontSize: 12, color: Colors.white),
                             //                        keyboardType: TextInputType.number,
                             //                        //s textAlign: TextAlign.right,
                             //                        decoration: InputDecoration(
                             //                            hintStyle: TextStyle(fontSize: 12, color: Colors.white,fontFamily: "black"),
                             //                            focusedBorder: UnderlineInputBorder(
                             //                              borderSide: BorderSide(color: Colors.blue),
                             //                            ),
                             //                            hintText: "",
                             //                            labelText: "رقم المستخدم",labelStyle: TextStyle(
                             //                            fontSize: 12,
                             //                            fontFamily: "thin",
                             //                            color: Colors.blue
                             //
                             //                        ),
                             //                            contentPadding: EdgeInsets.all(10)
                             //
                             //                        ),
                             //                      ),
                             //                    ],
                             //                  )
                             //                ],
                             //              )
                             //
                             //            ],
                             //          ),
                             //        ),
                                   );
                              
                               }
                              void stetype(bool value)async{
                                 SharedPreferences prefs = await SharedPreferences.getInstance();
                                 print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
                                 prefs.setBool("darkmode", value);
                                 print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                               }
                             
                               void changenotifcation(String s, String t, String u, int i) {
setState(() {
  isLoading=true;
});
apiRequests.changenotifcation(s, t, u).then((value){
  if(value!=null){
if(value=="success"){
  if(i==1){
     _dataUser.setKey({'key': Utility.messageNotify, 'value': s});
         setState(() {
                      isLoading = false;
                    });
     s=="1"?        Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblacceptnotfromrooms,DialogType.SUCCES,context):     Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblrefusefromrooms,DialogType.SUCCES,context);
    // _showErrorDialog("success","success");
  }else if(i==2){
 _dataUser.setKey({'key': Utility.chatNotify, 'value': s});
     setState(() {
                      isLoading = false;
                    });
 s=="1"?        Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblacceptnotfromchats,DialogType.SUCCES,context):     Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblrefusefromchats,DialogType.SUCCES,context);
    // _showErrorDialog("success","success");
  }else{
     _dataUser.setKey({'key': Utility.roomNotify, 'value': s});
      setState(() {
                      isLoading = false;
                    });
         s=="1"?        Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblacceptnotfromsystemmessage,DialogType.SUCCES,context):     Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblrefusefromsystemmessage,DialogType.SUCCES,context);
    // _showErrorDialog("success","success");
  }
  
}
  }else{
    // _showErrorDialog("error",AppLocalizations.of(context)
    //                                 .lblNoInternetConnection);
                                      Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
  }

});





                               }
                               
  // void _showE rrorDialog(String titel,String message) {
  //   showDialog(
  //       context: context,
  //       builder: (ctx)=>
  //           AlertDialog(
  //             title: Text(
  //                              titel ,
  //                               style: TextStyle(
  //                                   fontSize: 18,
  //                                   fontFamily: "thin",
  //                                   // color: Color(int.parse(
  //                                   //   _dataUser.getKey(Utility.FontColor),
  //                                   // ))
  //                                   ),
  //                             ),
  //             content:Text(
  //                              message ,
  //                               style: TextStyle(
  //                                   fontSize: 18,
  //                                   fontFamily: "thin",
  //                                   // color: Color(int.parse(
  //                                   //   _dataUser.getKey(Utility.FontColor),
  //                                   // ))
  //                                   ),
  //                             ),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('Okay',style: TextStyle(
  //                     color: Colors.teal
  //                 ),),
  //                 onPressed: () {
  //                   setState(() {
  //                     isLoading = false;
  //                   });
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           )

  //   );
  // }

}
