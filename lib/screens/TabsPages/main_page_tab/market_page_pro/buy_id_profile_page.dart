import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

import 'package:mojtam3/Widget/ids_item.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/myroomsPage.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class BuyIdsProfilePage extends StatefulWidget {
  final List<SpecialIds> ids;
  final int isRoom;
  BuyIdsProfilePage({this.ids, this.isRoom});

  @override
  _BuyIdsProfilePageState createState() => _BuyIdsProfilePageState();
}

class _BuyIdsProfilePageState extends State<BuyIdsProfilePage> {
    DataUser _dataUser = DataUser.instance;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ApiRequests apiRequests = new ApiRequests();

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
            AppLocalizations.of(context).lblBuyIDs,
            style: TextStyle(
              fontFamily: "thin",
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: widget.ids.length,

          itemBuilder: (ctx, i) => GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return MyDialog(
                        id: widget.ids[i].id.toString(),
                        isRoom: widget.isRoom);
                  });
            }, //
            child: //WidgetANimator(
                IDSitem(
              widget.ids[i].coins,
              widget.ids[i].specialId.toString(),
            ),
            //   ),
          ),
          // builder: (c) => products[i],

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 2.5,
            mainAxisSpacing: 5,
          ),
        ));
    // ));
  }
}

class MyDialog extends StatefulWidget {
  final String id;
  final int isRoom;
  MyDialog({this.id, this.isRoom});

  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool _check = false;
  String Friend_ID;
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  // void _showE rrorDialog(String message) {
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: isloading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            )
          : SimpleDialog(
              backgroundColor: Colors.grey[800],
              title: Align(
                  alignment: Alignment.center,
                  child: new Text(
                    AppLocalizations.of(context).lblBuyIDs,
                    style: TextStyle(color: Colors.white, fontFamily: "thin"),
                  )),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _check ? Colors.grey[200] : Colors.green),
                      child: new SimpleDialogOption(
                        child: new Text("my self",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: "black",
                                height: 2)),
                        onPressed: () {
                          if (widget.isRoom == 0) {
                            setState(() {
                              print("hhhhhhhhhhhhhhhhhhjajsjjdas");
                              isloading = true;
                            });
                            ApiRequests apiRequests = new ApiRequests();
                            DataUser _dataUser = DataUser.instance;
                            print("lllllllllllllllllllllllll");
                            print(_dataUser.getKey(Utility.ID));

                            apiRequests
                                .butId(widget.id, _dataUser.getKey(Utility.ID))
                                .then((value) {
                              print("-------------gooood-----------------");
                            //  print(value);
                              setState(() {
                                isloading = false;
                              });
                              if(value==null){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                              }else if(value=="success"){
                                Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoubuyid,DialogType.SUCCES,context);
                              }
                              else if (value=="this id used before"){
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblthisIdusedbefor,DialogType.ERROR,context);
                              }else{
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouhavenocoin,DialogType.ERROR,context);
                              }
                             
  
                            });

                            setState(() {
                              _check = false;
                            });
                          } else if (widget.isRoom == 1) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyRoomsPage(gifid: widget.id, isid: 1);
                            }));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _check ? Colors.green : Colors.grey[200]),
                      child: new SimpleDialogOption(
                        child: new Text(
                            widget.isRoom == 0 ? "myFriend" : "FriendRoom",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: "black",
                                height: 2)),
                        onPressed: () {
                          print("mahmoud");
                          setState(() {
                            _check = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                _check
                    ? Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            margin: EdgeInsets.only(
                                bottom: 12, left: 8, right: 8, top: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              border: new Border.all(color: Colors.grey),
                            ),
                            child: TextFormField(
                              onSaved: (value) {
                                setState(() {
                                  Friend_ID = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .lblSerialNumber;
                                }
                                return null;
                              },

                              cursorColor: Colors.white,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              //  textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: "black"),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText:
                                      AppLocalizations.of(context).lblSerialNumber,
                                  contentPadding: EdgeInsets.all(8)),
                            ),
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200]),
                            child: new SimpleDialogOption(
                              child: new Text("Send",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: "black",
                                      height: 2)),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                  setState(() {
                                    isloading = true;
                                  });
                                  print("---------friend id");
                                  print(Friend_ID);
                                  if (widget.isRoom == 0) {
                                    ApiRequests apiRequests = new ApiRequests();
                                    apiRequests
                                        .butIdfriend(widget.id, Friend_ID)
                                        .then((value) {
                                      print(
                                          "-------------gooood-----------------");
                                     // print(value);
                                      setState(() {
                                        isloading = false;
                                      });
                                                                  if(value==null){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                              }else if(value=="success"){
                                Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoubuyidfriend,DialogType.SUCCES,context);
                              }else if(value =="user not have coins"){
                                   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouhavenocoin,DialogType.ERROR,context);
                              }else if (value=="this id used before"){
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblthisIdusedbefor,DialogType.ERROR,context);
                              }
                              else{
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendnotfound,DialogType.ERROR,context);
                              }
                                    });
                                  } else {
                                    ApiRequests apiRequests = new ApiRequests();
                                    apiRequests
                                        .butroomId(widget.id, Friend_ID)
                                        .then((value) {
                                      print(
                                          "-------------gooood-----------------");
                                      print(value);
                                      setState(() {
                                        isloading = false;
                                      });
                                                                                             if(value==null){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                              }else if(value=="success"){
                                Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoubuyidfriendroom,DialogType.SUCCES,context);
                              }else if(value =="user not have coins"){
                                   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouhavenocoin,DialogType.ERROR,context);
                              }else if (value=="this id used before"){
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblthisIdusedbefor,DialogType.ERROR,context);
                              }
                              else{
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblwrongroomid,DialogType.ERROR,context);
                              }
                                      // _showErrorDialog(value.toString());
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
    );
  }
}
