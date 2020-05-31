
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/remeber_password_page.dart';
import 'package:mojtam3/screens/TabsPages/discover_tab/discover_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'registration_page.dart';
import '../../tabs_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email,_password;
  bool visable =true;
  bool _isLoading=false;
  String _goodleToken;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
 void iosPermission() {
  _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true)
  );
  _firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings)
  {
    print("Settings registered: $settings");
  });
}
@override
  void initState() {
    // TODO: implement initState
   
    super.initState();
     firebaseCloudMessagingListeners();
  } 
 void firebaseCloudMessagingListeners() {
  if (Platform.isIOS) iosPermission();

  _firebaseMessaging.getToken().then((token){
    print("--------------gooogle token ------------------");
    print(token);
   // if (this.mounted) {
      setState(() {
    _goodleToken=token ;
  });
    //}
 
 
  });

  // _firebaseMessaging.configure(
  //   onMessage: (Map<String, dynamic> message) async {
  //     print('on message $message');
  //   },
  //   onResume: (Map<String, dynamic> message) async {
  //     print('on resume $message');
  //   },
  //   onLaunch: (Map<String, dynamic> message) async {
  //     print('on launch $message');
  //   },
  // );
}
  @override
  Widget build(BuildContext context) {
    var sizeQuery =MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          Container(
            height: sizeQuery.height,
            width: sizeQuery.width,
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
                  ///-------------logo---------------
               //   WidgetANimator(
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(
                              top: sizeQuery.height / 15,
                              bottom: sizeQuery.height / 16),
                          height: sizeQuery.height * .25,
                          width: sizeQuery.width * .5,
                          child: Image.asset("assets/logo.png")),
                    ),
               //   ),
                  ///---------logindesign------------------
                //  WidgetANimator(
                   Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                      width:sizeQuery.width,
                      margin: EdgeInsets.only(bottom: 30),
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Rectangle2.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Text(AppLocalizations.of(context).lbllogin,
                          style: TextStyle(
                            fontFamily: "black",
                          )),
                    ),
                 // ),

                  //phone number text faild
                  ///-------Email and password -------
                  //password text faild
                 // WidgetANimator(
                   /////////////////////////////////////////////
                    TextFormField(
                      onSaved: (value){
                      setState(() {
                        _email = value;
                      });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context).lblemail;
                        }
                        else if (  !EmailValidator.validate(value, true))
                          {
                            return "هذا ليس ايميل";
                          }
                        return null;
                      },
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                      //s textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: "black"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: AppLocalizations.of(context).lblemail,
                          contentPadding: EdgeInsets.all(10)),
                    ),
                 // ),

                  //login button

                //  WidgetANimator(
                    TextFormField(
                      onSaved: (value){
                        setState(() {
                         _password = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context).lblpassword;
                        }
                        return null;
                      },
                      obscureText: visable,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                      //  textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(icon:visable?Image.asset("assets/images/hide.png",height: 20,width: 20,):Icon(Icons.remove_red_eye,color: Colors.grey,),onPressed: (){
                            setState(() {
                              visable=!visable;
                            });
                          },),
                          hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: "black"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: AppLocalizations.of(context).lblpassword,
                          contentPadding: EdgeInsets.all(8)),
                    ),
                //  ),
                  ///////////////
                  SizedBox(
                    height: 10,
                  ),
                  /////////////////////////////
               //   WidgetANimator(
                    Center(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RememberPasswordPage();
                            }));
                          },
                          child: Text(
                            AppLocalizations.of(context).lbldidforgetpassword,
                            style: TextStyle(
                                fontFamily: "black",
                                fontSize: 10,
                                color: Colors.white),
                          )),
                    ),
                 // ),
               //   WidgetANimator(
                    _isLoading?CircularProgressIndicator(backgroundColor: Colors.teal,):   GestureDetector(
                      onTap: () {
                        valdatite();

                      },
                      child: Container(
                        width:sizeQuery.width,
                        height: 45,
                        margin: EdgeInsets.only(
                            top:sizeQuery.height / 8,
                            right: 5,
                            left: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          AppLocalizations.of(context).lbllogin,
                          style: TextStyle(fontFamily: "black"),
                        ),
                      ),
                    ),
               //   ),

                 // WidgetANimator(
                    Center(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegistrationPage();
                            }));
                          },
                          child: Text(
                            AppLocalizations.of(context).lblyouhavenot,
                            style: TextStyle(
                                fontFamily: "black",
                                fontSize: 10,
                                color: Colors.white),
                          )),
                    ),
                //  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void valdatite() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      setState(() {
        _isLoading=true;
      });
      ApiRequests apiRequests = new ApiRequests();
       if (Platform.isIOS) iosPermission();

      var _loginResponse =await apiRequests.login( _email, _password,_goodleToken);
try{   if(_loginResponse.msg=="success"){

  print("----------------------sucess-----------------------");
  setState(() {
    _isLoading = false;
  });

  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) {
        return TabsPage();
      }), (Route<dynamic> route) => false);

}else if (_loginResponse.msg=="error"){

   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblwronginfo,DialogType.ERROR,context);
   setState(() {
     _isLoading=false;
   });
  print("----------------------error-----------------------");
  // print(_loginResponse.data.toString());

}}catch(e){ Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
 setState(() {
     _isLoading=false;
   });}



    }
  }
  // void _showErrorDialog(String tittel,String message,DialogType type,BuildContext contextc) {

  //       AwesomeDialog(context: contextc,
        
  //               dialogType: type,
  //               animType: AnimType.BOTTOMSLIDE,
  //               tittle: tittel,
  //               body:Column(
  //                 children: <Widget>[
  //                   Text("tittel",style: TextStyle(fontWeight:FontWeight.bold,fontFamily: "black",fontSize: 20)),
                   
  //                  Text("titشسيسشيشسيسشيشسيسشtel",textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontFamily: "thin",fontSize: 16)),
  //                  GestureDetector(
  //                    onTap: (){
  //                       setState(() {
  //   _isLoading = false;
  // });
  //     Navigator.of(context).pop();
  //                    },
  //                                       child: Container(
                       
  //                      width: 120,
  //                      height: 50,

  //                     // padding: EdgeInsets.all(8),
  //                      margin: EdgeInsets.only(top: 8),
  //                      alignment: Alignment.center,
  //                      decoration: BoxDecoration(
  //                        color: Colors.teal,
  //                        borderRadius: BorderRadius.all(Radius.circular(30))
  //                      ),
  //                      child: Text("ok",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontFamily: "black",fontSize: 18),),
  //                    ),
  //                  )
  //                 ],
  //               ),
  //               desc:message, //'message',
  // //               btnCancelOnPress: () {
  // //                   setState(() {
  // //   _isLoading = false;
  // // });
  // //               },
  // //               btnOkOnPress: () {

  // //               }
  //               ).show();
  //       // showDialog(
  //       //   context: context,
  //       //   builder: (ctx)=>
  //       //          AlertDialog(
  //       //            backgroundColor: Colors.grey[200],
  //       //            shape:  RoundedRectangleBorder(
  //       //             borderRadius:
  //       //                 BorderRadius.circular(20.0)),
  //       //           title: Center(child: Text('An Error Occurred!')),
  //       //           content: Text(message),
  //       //           actions: <Widget>[
  //       //             FlatButton(
  //       //               child: Text('Okay',style: TextStyle(
  //       //                 color: Colors.teal
  //       //               ),),
  //       //               onPressed: () {
  //       //                 setState(() {
  //       //                   _isLoading = false;
  //       //                 });
  //       //                 Navigator.of(ctx).pop();
  //       //               },
  //       //             )
  //       //           ],
  //       //         )
    
  //       // );
  //     }
    
      
}
