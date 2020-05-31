import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/screens/TabsPages/contact_us_tab/Technicalsupport.dart';
import 'package:mojtam3/screens/TabsPages/contact_us_tab/systen_message.dart';
import 'package:mojtam3/screens/authScreen/login_page.dart';

import 'package:mojtam3/screens/TabsPages/contact_us_tab/friends_request_page.dart';

import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _formKey = GlobalKey<FormState>();
  ApiRequests apiRequests = new ApiRequests();
  DataUser _dataUser = DataUser.instance;
  String friendId;
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("-------------contact us-------------------");
    print(Utility.BaseURL + _dataUser.getKey(Utility.ProfileImage));
    return Form(
        key: _formKey,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(int.parse(
            _dataUser.getKey(Utility.BackGroundColor),
          )),
          appBar: AppBar(
            backgroundColor: Colors.grey[800],
            leading: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: Utility.BaseURL +
                        _dataUser.getKey(Utility.ProfileImage),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Color(int.parse(
                        _dataUser.getKey(Utility.FontColor),
                      )),
                    ),
                    fit: BoxFit.fill,
                  ),
                )),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    _resetDialogBox();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Image.asset(
                      "assets/images/add_frinds.png",
                      width: 25,
                      height: 25,
                    ),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FrendRequessPage(
                          AppLocalizations.of(context).lblFriendsRequest, 0);
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(bottom: 18, top: 20),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, top: 6, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblFriendsRequest,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "black",
                                  color: Colors.black),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FrendRequessPage(
                          AppLocalizations.of(context).lblActivefriend, 1);
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(bottom: 18),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, top: 6, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblActivefriend,
                              style:
                                  TextStyle(fontSize: 14, fontFamily: "black"),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FrendRequessPage(
                          AppLocalizations.of(context).lblNonactivefriend, 2);
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(bottom: 18),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, top: 6, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblNonactivefriend,
                              style:
                                  TextStyle(fontSize: 14, fontFamily: "black"),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Row(
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).lblcontactus,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "black",
                            color: Color(int.parse(
                              _dataUser.getKey(Utility.FontColor),
                            ))),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Technicalsupport();
                  })),
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(bottom: 18),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, top: 6, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblTechnicalsupport,
                              style:
                                  TextStyle(fontSize: 14, fontFamily: "black"),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SystemMessage();
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(bottom: 18),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, top: 6, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblSystemmessage,
                              style:
                                  TextStyle(fontSize: 14, fontFamily: "black"),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    logout();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment(-1.0, 1.0), colors: [
                        Colors.teal[900],
                        Colors.teal[100],
                        Colors.teal[900],
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(AppLocalizations.of(context).lblsignout,
                        style: TextStyle(
                          fontFamily: "black",
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void logout() async {
    print("mahmoud");
    ApiRequests apiRequests = new ApiRequests();
    apiRequests.logoutapi().then((value) {
      print("----------------------------");
      print(value.toString());
      if (value == true) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }), (Route<dynamic> route) => false);
      } else {
        print("-------------contact false---------------");
        Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
  //  setState(() {
  //    _isLoading=false;
  //  });
        //  Utility.showAlert(context, "checkYourCOnnection");
      }
    });
  }

  // void _showErro rDialog(String message) {
  //   showDialog(
  //       context: context,
  //       builder: (ctx) => AlertDialog(
  //             title: Text('An Error Occurred!'),
  //             content: Text(message),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text(
  //                   'Okay',
  //                   style: TextStyle(color: Colors.teal),
  //                 ),
  //                 onPressed: () {
  //                   // setState(() {
  //                   //   _isLoading = false;
  //                   // });
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           ));
  // }
//   void requestfrienfun() async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       // var response =  apiRequests.requestfriend(friendId);
//       print("friend id :------------------" + friendId.toString());

//       ///    ApiRequests apiRequests = new ApiRequests();
// ////    String authToken = await userRepository.getAuthToken(
//       try {
//         var requestResponse = await apiRequests
//             .requestfriend("23")
//             .timeout(const Duration(seconds: 10));
//         showInternetSnackbar(requestResponse); //requestResponse.toString());
//       } catch (e) {
//         showInternetSnackbar("بص ع النت ياله");
//       }
// ////

//     }
//   }

  // showInternetSnackbar(String message) {
  //   var snackbar = new SnackBar(
  //     action: new SnackBarAction(
  //       label: 'Retry',
  //       textColor: Colors.red,
  //       onPressed: () {
  //         requestfrienfun();
  //       },
  //     ),
  //     content: new Text(message),
  //     duration: new Duration(seconds: 2),
  //     backgroundColor: Colors.black45,
  //   );
  //   scaffoldKey.currentState.showSnackBar(snackbar);
  // }
  Future<String> _resetDialogBox() {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomAlertDialog();
      },
    );
  }
}

class CustomAlertDialog extends StatefulWidget {
  // final String title;
  //final FirebaseAuth auth;

  const CustomAlertDialog({Key key}) : super(key: key);

  @override
  CustomAlertDialogState createState() {
    return new CustomAlertDialogState();
  }
}

class CustomAlertDialogState extends State<CustomAlertDialog> {
  final _resetKey = GlobalKey<FormState>();
  final _resetEmailController = TextEditingController();
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  String _frindeId;
  bool _resetValidate = false;
  ApiRequests apiRequests = new ApiRequests();
  bool _isLoading = false;

  void _validateData() {
    _frindeId = _resetEmailController.text;
    if (_resetKey.currentState.validate()) {
      _resetKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFFFF),
      body: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
        ),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: new SingleChildScrollView(
            child: Form(
              key: _resetKey,
              autovalidate: _resetValidate,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                ),
                child: ListBody(
                  children: <Widget>[
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12)),
                      ),
                      child: Text(
                        AppLocalizations.of(context).lblFriendRequest,
                        style:
                            TextStyle(color: Colors.white, fontFamily: "thin"),
                      ),
                    ),
                    TextFormField(
                      validator: validateEmail,
                      onSaved: (String val) {
                        _frindeId = val;
                      },
                      controller: _resetEmailController,
                      // keyboardType:te,
                      autofocus: true,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context).lblSerialNumber,
                          contentPadding:
                              EdgeInsets.only(left: 70.0, top: 15.0),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14.0)),
                      style: TextStyle(color: Colors.black),
                    ),
                    Divider(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        new FlatButton(
                          child: Text(
                            AppLocalizations.of(context).lblCancel,
                            style: TextStyle(
                                color: Colors.teal, fontFamily: "black"),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop("");
                          },
                        ),
                        new FlatButton(
                          child: Text(
                            AppLocalizations.of(context).lblAdd,
                            style: TextStyle(
                                color: Colors.teal, fontFamily: "black"),
                          ),
                          onPressed: () {
                            _validateData();
                          },
                        ),
                      ],
                    ),
                    _isLoading
                        ? FutureBuilder(
                            future: apiRequests.requestfriend(_frindeId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.teal,
                                ));
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                     if (snapshot.data ==null)
                                        return Text(
                                  AppLocalizations.of(context)
                                      .lblNoInternetConnection,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: "thin"),
                                );
                                if (snapshot.data == "success")
                                  return Text(
                                    AppLocalizations.of(context)
                                        .lblTheFriendShipRequestHasBeenSent,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "thin"),
                                  );
                               else
                                  return Text(
                             snapshot.data=="user not found"?AppLocalizations.of(context).lblfriendnotfound :      AppLocalizations.of(context).lblYouAreAlreadyFriend,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "thin"),
                                  );
                             
                              }

                              // return Text(
                              //   "تاكد من معلوماتك يا حبيبي",
                              //   textAlign: TextAlign.center,
                              //   style:
                              //       TextStyle(fontSize: 8, fontFamily: "thin"),
                              // );
                            })
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showInternetSnackbar(String message) {
    var snackbar = new SnackBar(
      // action: new SnackBarAction(
      //     label: 'Retry',
      //     textColor: Colors.red, onPressed: () {requestfrienfun();},
      //   ),
      content: new Text(message),
      duration: new Duration(seconds: 2),
      backgroundColor: Colors.black45,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  String validateEmail(String value) {
    if (value.length == 0) {
      return AppLocalizations.of(context)
                                      .lblSerialNumber;
    } else {
      return null;
    }
  }

  //      requestFriend(String frindeId) {
  //           print("-------------------------------frind id ;");
  //        print("-------------------------------frind id ; "+frindeId.toString());
  //       String requestResponse =
  //  apiRequests.requestfriend(frindeId)
  //   .timeout(const Duration(seconds: 10));
  //    print("-------------------------------frind id ;");
  //     print("-------------------------------frind id ;"+requestResponse);
  //   return requestResponse;
  //  // showInternetSnackbar(requestResponse);
  //     }
}
