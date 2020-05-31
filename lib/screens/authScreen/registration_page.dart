import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/screens/authScreen/login_page.dart';
import 'package:mojtam3/tabs_page.dart';
import 'dart:io' show Platform;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool check = false;
  bool checkBox = false;
  String Email, Password, Name;
  bool visable = true;
   String _goodleToken;
  var _isLoading = false;
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   void firebaseCloudMessaging_Listeners() {
  if (Platform.isIOS) iOS_Permission();

  _firebaseMessaging.getToken().then((token){
    print("--------------gooogle token ------------------");
    print(token);
    if (this.mounted) {
      setState(() {
        print("token-----------------------token");
    _goodleToken=token ;
  });
    }
 
 
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
//  Auth _auth = new Auth();
 void iOS_Permission() {
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
    firebaseCloudMessaging_Listeners();
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Stack(
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
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                ///----------logo----------
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

                  ///--------signuo logo ---------
                  Container(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 10, bottom: 16),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 12),
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Rectangle2.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Text(AppLocalizations.of(context).lblsignup,
                        style: TextStyle(
                          fontFamily: "black",
                        )),
                  ),

                  ///----------Name--------
                  // WidgetANimator(
                  TextFormField(
                    onSaved: (value) {
                      if (this.mounted) {
                        setState(() {
                        Name = value;
                      });
                      }
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context).lblname;
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    //          textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: "black"),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: AppLocalizations.of(context).lblname,
                        contentPadding: EdgeInsets.all(10)),
                  ),
                  // ),
                  ///----Email-------
                  // WidgetANimator(
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        Email = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context).lblemail;
                      } else if (!EmailValidator.validate(value, true)) {
                        return "هذا ليس ايميل";
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    // textAlign: TextAlign.right,
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
                  ///------password---------
                  // WidgetANimator(
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        Password = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context).lblpassword;
                      } else if (value.length < 7) {
                        return "كلمة المرور لابد ان تكون اكبر من 7 احرف";
                      }
                      return null;
                    },
                    obscureText: visable,
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    //   textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: visable
                              ? Image.asset(
                                  "assets/images/hide.png",
                                  height: 20,
                                  width: 20,
                                )
                              : Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                ),
                          onPressed: () {
                            setState(() {
                              visable = !visable;
                            });
                          },
                        ),
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
                  //),
                  ///----------------check Box------------------
                  //  WidgetANimator(
                  // Container(
                  //   margin: EdgeInsets.only(top: 25),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       Checkbox(
                  //         value: checkBox,
                  //         onChanged: (val) {
                  //           setState(() {
                  //             checkBox = val;
                  //           });
                  //         },
                  //       ),
                  //       Text(
                  //         AppLocalizations.of(context)
                  //             .lblagreetothetermsandconditions,
                  //         style: TextStyle(
                  //             fontSize: 10,
                  //             color: Colors.white,
                  //             fontFamily: "black"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //  ),
                  ///----------------- signup bottom ----------------
                  _isLoading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.teal,
                        )
                      : //WidgetANimator(
                      GestureDetector(
                          onTap: () {
                            _valdatite();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 8,
                                right: 5,
                                left: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              AppLocalizations.of(context).lblsignup,
                              style: TextStyle(fontFamily: "black"),
                            ),
                          ),
                        ),
                  //   ),

                  Center(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }), (Route<dynamic> route) => false);
                        },
                        child: Text(
                          AppLocalizations.of(context).lblyouhavenot,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void _valdatite() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      ApiRequests apiRequests = new ApiRequests();
var SignupResponse =await apiRequests.signup(Name, Email, Password,_goodleToken);

if(SignupResponse.msg=="success"){

print("----------------------sucess-----------------------");
setState(() {
  _isLoading = false;
});

Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) {
      return TabsPage();
    }), (Route<dynamic> route) => false);

}else if (SignupResponse.msg=="error"){

  setState(() {
    _isLoading = false;
  });
  print("regester page error ");
 // print(SignupResponse.toString());
  
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblemailalreadyused,DialogType.ERROR,context);
   setState(() {
     _isLoading=false;
   });
  print("----------------------error-----------------------");
// SignupResponse.data[0].toString()
 // print();
  // setState(() {
  //   _isLoading = true;
  // });
}
else{
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
   setState(() {
     _isLoading=false;
   });
}

    }
  }

  // void _showErr orDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //         title: Text('An Error Occurred!'),
  //         content: Text(message),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Okay',style: TextStyle(
  //               color: Colors.teal
  //             ),),
  //             onPressed: () {
  //               setState(() {
  //                 _isLoading=false;
  //               });
  //               Navigator.of(ctx).pop();
  //             },
  //           )
  //         ],
  //       )

  //   );
  // }
}
