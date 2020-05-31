import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/frinds_item.dart';
import 'package:mojtam3/model/models/joinedRoom.dart';

import 'package:mojtam3/model/provider/SelectedRoom.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/TabsPages/frinds_tab/add_group.dart';
import 'package:mojtam3/screens/TabsPages/frinds_tab/searchRoom2.dart';
import 'package:mojtam3/tabs_page.dart';

import 'package:mojtam3/utillites/utillity_class.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
    with AutomaticKeepAliveClientMixin {
  int _check = 1;

  // Design d = new Design();
  TextEditingController _textController;

  DataUser _dataUser = DataUser.instance;

  // final List<String> _listViewData = [
  //   "Inducesmile.com",
  //   "Flutter Dev",
  //   "Android Dev",
  //   "iOS Dev!",
  //   "React Native Dev!",
  //   "React Dev!",
  //   "express Dev!",
  //   "Laravel Dev!",
  //   "Angular Dev!",
  // ];

  Future<String> _resetDialogBox() {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomAlertDialog();
      },
    );
  }
  // _onChanged(String value) {
  //   if(value.length!=0){

  //     setState(() {
  //       _newData = _listViewData
  //           .where((string) => string.toLowerCase().contains(value.toLowerCase()))
  //           .toList();

  //     });}
  //   else{
  //     setState(() {
  //       _newData =null;
  //     });

  //   }

  // }
  ApiRequests apiRequests = new ApiRequests();
  List<String> _newData = [];
  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height -
        kBottomNavigationBarHeight -
        60 -
        kToolbarHeight -
        50;
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12)),
                ),
                child: Text(
                  AppLocalizations.of(context).lblJoinToRoom,
                  style: TextStyle(
                      fontFamily: "black",
                      fontSize: 15,
                      color: Colors.white,
                      height: 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Text(
                AppLocalizations.of(context).lblEnterTheNameOfRoomOrIDToJoin,
                style: TextStyle(fontSize: 12, fontFamily: "black"),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocalizations.of(context)
                      .lblEnterTheNameOfRoomOrIDToJoin;
                }
                return null;
              },

              cursorColor: Colors.white,
              style: TextStyle(fontSize: 12, color: Colors.white),

              //s textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 12, color: Colors.white, fontFamily: "black"),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: "",
                  labelText: "ادخل رقم الغرفة",
                  labelStyle: TextStyle(
                      fontSize: 12, fontFamily: "thin", color: Colors.blue),
                  contentPadding: EdgeInsets.all(10)),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      // _dismissDialog();
                    },
                    child: Text(
                      AppLocalizations.of(context).lblJoin,
                      style: TextStyle(color: Colors.blue, fontFamily: "thin"),
                    )),
                FlatButton(
                    onPressed: () {
                      //  _dismissDialog();
                    },
                    child: Text(
                      AppLocalizations.of(context).lblCancel,
                      style: TextStyle(color: Colors.blue, fontFamily: "thin"),
                    )),
              ],
            )
          ],
        ),
      ),
    );

    print("-------------friends-------------------");
    print(Utility.BaseURL + _dataUser.getKey(Utility.ProfileImage));

    return Scaffold(
          backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  Utility.BaseURL + _dataUser.getKey(Utility.ProfileImage),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
               
               fit: BoxFit.fill,
              //  width: MediaQuery.of(context).size.width/3-40,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    icon: Image.asset(
                      "assets/images/loupe.png",
                      height: 20,
                      width: 20,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchRoomPage2();
                      }));
                    }),
                IconButton(
                    icon: Image.asset(
                      "assets/images/add_frinds.png",
                      fit: BoxFit.fill,
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () => _resetDialogBox()
                    // showDialog(
                    //     context: context ,
                    //     builder: (
                    //         BuildContext context) => errorDialog) ,
                    ),
                IconButton(
                  icon: Image.asset(
                    "assets/images/edit.png",
                    fit: BoxFit.fill,
                    width: 20,
                    height: 20,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddGroup();
                    }));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder<JoinedRoom>(
          future: apiRequests.getjoindRoom(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
            {

          
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              ));
          
            }
            else{
              if(snapshot.data==null)
{
  return Center(child: Text(AppLocalizations.of(context).lblNoInternetConnection,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
}
              return snapshot.data.data.roomswherejoined.length == 0
                  ? Center(child:Text(AppLocalizations.of(context).lblnoroomsyet,textAlign: TextAlign.center,style: TextStyle( fontFamily: "thin",fontSize: 18,color: Color(int.parse(
                                    _dataUser.getKey(Utility.FontColor), )))))
                  : Column(
                      children: <Widget>[
                  
                        Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).lblRooms,
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 1,
                                      fontFamily: "thin",
                                      color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _check == 1 ? _check = 0 : _check = 1;
                                        print(_check);
                                      });
                                    },
                                    icon: Image.asset(
                                      _check == 1
                                          ? "assets/images/arrow-point-to-up.png"
                                          : "assets/images/arrow-point-to-dowen.png",
                                      height: 15,
                                      width: 15,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              _newData != null && _newData.length > 0
                                  ? ListView(
                                      padding: EdgeInsets.all(10.0),
                                      children: _newData.map((data) {
                                        return ListTile(title: Text(data));
                                      }).toList(),
                                    )
                                  : ListView.builder(
                                      itemCount: _check == 1
                                          ? snapshot.data.data.roomswherejoined
                                                  .length +
                                              1
                                          : 0,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return index !=
                                                snapshot.data.data
                                                    .roomswherejoined.length
                                            ? //WidgetANimator(
                                            GestureDetector(
                                                onTap: () {
                                                  print(
                                                      "---------------------------- active rooom------------");
                                                  // print(requestsList
                                                  //     .data.active[index].userImage);
                                                  // print(requestsList.data.active[index].image);
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return ChatPage(
                                                      title: snapshot
                                                          .data
                                                          .data
                                                          .roomswherejoined[
                                                              index]
                                                          .roomName,
                                                      chatId: snapshot
                                                          .data
                                                          .data
                                                          .roomswherejoined[
                                                              index]
                                                          .roomId
                                                          .toString(),
                                                      room_model: snapshot
                                                              .data
                                                              .data
                                                              .roomswherejoined[
                                                          index],
                                                      check: 1,

                                                      //    snapshot.data.data.active[index]
                                                      //snapshot.data.data.special[index]
                                                    );
                                                  }));
                                                },
                                                child: FrendsItem(
                                                  snapshot
                                                      .data
                                                      .data
                                                      .roomswherejoined[index]
                                                      .roomName,
                                                  snapshot
                                                      .data
                                                      .data
                                                      .roomswherejoined[index]
                                                      .description,
                                                  snapshot
                                                      .data
                                                      .data
                                                      .roomswherejoined[index]
                                                      .users
                                                      .toString(),
                                                  snapshot
                                                      .data
                                                      .data
                                                      .roomswherejoined[index]
                                                      .level
                                                      .toString(),
                                                  Utility.BaseURL +
                                                      snapshot
                                                          .data
                                                          .data
                                                          .roomswherejoined[
                                                              index]
                                                          .image,
                                                ),
                                              )

                                            //  )
                                            : Container(
                                                height: 100,
                                              );
                                      }),
                            ],
                          ),
                        ),
                      ],
                    );
          }}),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
  String _roomId;
  bool _resetValidate = false;
  ApiRequests apiRequests = new ApiRequests();
  var _response;
  bool _isLoading = false;
  // StreamController<bool> rebuild = StreamController<bool>();

  void _sendResetEmail() {
    _roomId = _resetEmailController.text;
    print("hgpdslflkjhsdkjfhjksdhfkjhdskjfhdskjfhkjsdhkjfds");
    if (_resetKey.currentState.validate()) {
      _resetKey.currentState.save();

      // You could consider using async/await here
      //widget.auth.sendPasswordResetEmail(email: _resetEmail);
//           _response
// =  requestFriend(_frindeId);
//         showInternetSnackbar(_response.toString());
//        // print("---------------tiger------");
//         print(_response.toString());
      // print("response:--------------"+requestFriend());
      setState(() {
        _isLoading = true;
      });
    }
  }

  var scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFFFF),
      body: Container(
        //  width: 260.0,
        //   height: 230.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          // borderRadius:
          //     new BorderRadius.all(new Radius.circular(32.0)),
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
                    // new Text(
                    //   'Enter the Email Address associated with your account.',
                    //   style: TextStyle(fontSize: 14.0),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(10.0),
                    // ),
                    Container(
                      //  width: MediaQuery.of(context).size.width / 1.2,
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
                        _roomId = val;
                      },
                      controller: _resetEmailController,
                      // keyboardType:te,
                      autofocus: true,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "ادخل رقم الغرفة",
                          // contentPadding:
                          // EdgeInsets.only(left: 70.0, top: 15.0),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14.0)),
                      style: TextStyle(color: Colors.black),
                    ),
                    // new Row(children: <Widget>[
                    //   Container(
                    //     decoration: new BoxDecoration(
                    //         border: new Border(
                    //             bottom: new BorderSide(
                    //                 width: 0.5, color: Colors.black))),
                    //   )
                    // ]),
                    Divider(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        new FlatButton(
                          child: Text(
                            AppLocalizations.of(context).lblCancel,
                            style: TextStyle(
                                fontFamily: "black",
                                fontSize: 10,
                                color: Colors.black,
                                height: 1),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop("");
                          },
                        ),
                        new FlatButton(
                          child: Text(
                            AppLocalizations.of(context).lblJoinToRoom,
                            style: TextStyle(
                                fontFamily: "black",
                                fontSize: 10,
                                color: Colors.black,
                                height: 1),
                          ),
                          onPressed: () {
                            _sendResetEmail();
                            //     showInternetSnackbar("تاكد من معلومات الصديق");
                          },
                        ),
                      ],
                    ),
                    _isLoading
                        ? FutureBuilder(
                            future: apiRequests.requestroom(_roomId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return CircularProgressIndicator(backgroundColor: Colors.teal,);
                              if (snapshot.connectionState ==
                                  ConnectionState.done){
                                    // if(snapshot.data.toString()=="success")
                                    // {
                                    //   print("----------------------suceese");
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context){
                                    //     return TabsPage();
                                    //   }));
                                    // }

if(snapshot.data==null){
  return Text(
                               AppLocalizations.of(context).lblNoInternetConnection,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: "black"),
                                ); 
}


    return Text(
                                  snapshot.data =="room not found"? AppLocalizations.of(context).lblwrongroomid:snapshot.data =="The user has already been existed"?AppLocalizations.of(context).lblyouarealreadyinroom: snapshot.data=="suspend"?AppLocalizations.of(context).lblyouaresusbended:AppLocalizations.of(context).lblyoujoindroom,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: "black"),
                                );
                                  }
                            
                              return Text(
                                "تاكد من معلوماتك يا حبيبي",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 8, fontFamily: "thin"),
                              );
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
      return "برجاء ادخل رقم الراجل ";
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
