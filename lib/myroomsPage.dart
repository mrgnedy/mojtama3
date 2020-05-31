import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Widget/frinds_item.dart';
import 'package:mojtam3/model/models/myRoomsModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:toast/toast.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

class MyRoomsPage extends StatefulWidget {
  final String gifid;
  final String spicailid;
  final int isid;
  final int spicial;
  final String pp;
  MyRoomsPage({this.gifid, this.isid, this.spicial, this.spicailid, this.pp});

  @override
  _MyRoomsPageState createState() => _MyRoomsPageState();
}

class _MyRoomsPageState extends State<MyRoomsPage> {
  ApiRequests apiRequests = new ApiRequests();
  bool isLoading = false;
  MyRoomsModel my_rooms;
  int _check = 1;
  DataUser _dataUser = DataUser.instance;
    final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    isLoading = true;
    apiRequests.getmyRooms().then((value) {
      print("-----------------my room ");
      // print(value.toJson());
      setState(() {
        my_rooms = value;
        isLoading = false;
      });
    });
    super.initState();
  }

@override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(int.parse(
          _dataUser.getKey(Utility.BackGroundColor),
        )),
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
            AppLocalizations.of(context).lblmyrooms,
            style: TextStyle(
              fontFamily: "thin",
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: Form(
          key:_formKey ,
                  child: isLoading
              ? CircularProgressIndicator(
                  backgroundColor: Colors.teal,
                )
              : my_rooms == null
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context).lblNoInternetConnection,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "thin",
                            color: Color(int.parse(
                              _dataUser.getKey(Utility.FontColor),
                            ))),
                      ),
                    )
                  : my_rooms.data.rooms.length == 0
                      ? Center(
                          child: Text(
                            AppLocalizations.of(context).lblnoroomsyet,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "thin",
                                color: Color(int.parse(
                                  _dataUser.getKey(Utility.FontColor),
                                ))),
                          ),
                        )
                      : Column(
                          children: <Widget>[
                            Container(
                              height: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context).lblRooms,
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: 1,
                                          fontFamily: "thin",
                                          color: Colors.black),
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
                              child: ListView.builder(
                                  itemCount: _check == 1
                                      ? my_rooms.data.rooms.length + 1
                                      : 0,
                                  itemBuilder: (BuildContext contextt, index) {
                                    return index != my_rooms.data.rooms.length
                                        ? //WidgetANimator(
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isLoading = true;
                                              });

                                              print(
                                                  "-------------------------click ----------------------");
                                              if (widget.spicial == 0 ||
                                                  widget.spicial == null) {
                                                if (widget.isid == 0) {
                                                  print("-----mahmoud");
                                                  print(widget.gifid);
                                                  print(my_rooms
                                                      .data.rooms[index].roomId
                                                      .toString());

                                                  apiRequests
                                                      .butroomGIF(
                                                          widget.gifid,
                                                          my_rooms.data
                                                              .rooms[index].roomId
                                                              .toString())
                                                      .then((value) {
                                                    //     setState(() {
                                                    //    is_Loading=false;
                                                    // setState(() {
                                                    //   isLoading = true;
                                                    // });
                                                    if (value == null) {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblerror,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblNoInternetConnection,
                                                          DialogType.WARNING,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (value ==
                                                        "success") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblsuccess,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblyoubuygifroom,
                                                          DialogType.SUCCES,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (value ==
                                                        "user not have coins") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblerror,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblyouhavenocoin,
                                                          DialogType.ERROR,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    }

                                                    // else{
                                                    //     Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblwrongroomid,DialogType.ERROR,context);
                                                    // }
                                                    //  });butroomGIF
                                                    // _showErrorDialog(value == null
                                                    //     ? AppLocalizations.of(
                                                    //             context)
                                                    //         .lblNoInternetConnection
                                                    //     : value);
                                                  });
                                                } else if (widget.isid == 1) {
                                                  print("-----mahmoud");
                                                  print(widget.gifid);
                                                  print(my_rooms
                                                      .data.rooms[index].roomId
                                                      .toString());
                                                  print(
                                                      "------------------------------------- befor buy room gif -------------------------");
                                                  apiRequests
                                                      .butroomId(
                                                          widget.gifid,
                                                          my_rooms.data
                                                              .rooms[index].roomId
                                                              .toString())
                                                      .then((value) {
                                                    print(
                                                        "-------buy my room gif-------------");
                                               
                                                    //   print(value);
                                                    //     setState(() {
                                                    //    is_Loading=false;

                                                    //  });
                                                    if (value == null) {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblerror,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblNoInternetConnection,
                                                          DialogType.WARNING,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (value ==
                                                        "success") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblsuccess,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblyoubuyidroom,
                                                          DialogType.SUCCES,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (value ==
                                                        "user not have coins") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblerror,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblyouhavenocoin,
                                                          DialogType.ERROR,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (value ==
                                                        "this id used before") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblerror,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblthisIdusedbefor,
                                                          DialogType.ERROR,
                                                          context);
                                                              setState(() {
                                                          isLoading=false;
                                                        });
                                                    }
                                               
                                                    // _showErrorDialog(value);
                                                  });
                                                }
                                              } else if (widget.spicial == 1) {
                                                //            print("-----mahmoud");
                                                //     print(widget.gifid);
                                                print(
                                                    "-----------------spical room----------------");
                                                print(widget.spicial);
                                                print(widget.spicailid);
                                                print(
                                                    "------------------------------------- befor buy room gif -------------------------");
                                            
                                                apiRequests
                                                    .spicalrom(
                                                        widget.spicailid,
                                                        my_rooms.data.rooms[index]
                                                            .roomId
                                                            .toString(),
                                                        widget.pp)
                                                    .then((value) {
                                                  // setState(() {
                                                  //   isLoading = false;
                                                  // });
                                                  print(
                                                      "-------buy my room spical-------------");
                                                  print(value);
                                                  //   print(value);
                                                  if (value == null) {
                                                    print(
                                                        "-------------1----------------thishdiashidisd");
                                                    Utility.showErrorDialog(
                                                        AppLocalizations.of(
                                                                context)
                                                            .lblerror,
                                                        AppLocalizations.of(
                                                                context)
                                                            .lblNoInternetConnection,
                                                        DialogType.WARNING,
                                                        context);
                                                        setState(() {
                                                          isLoading=false;
                                                        });
                                                  } else if (value == "success") {
                                                    print(
                                                        "----------------2-------------thishdiashidisd");
                                                    if (widget.pp == "1") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblsuccess,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblfirstpostion,
                                                          DialogType.SUCCES,
                                                          context);
                                                           setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (widget.pp == "2") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblsuccess,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblsecondpostion,
                                                          DialogType.SUCCES,
                                                          context);
                                                           setState(() {
                                                          isLoading=false;
                                                        });
                                                    } else if (widget.pp == "3") {
                                                      Utility.showErrorDialog(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblsuccess,
                                                          AppLocalizations.of(
                                                                  context)
                                                              .lblthirdpostion,
                                                          DialogType.SUCCES,
                                                          context);
                                                           setState(() {
                                                          isLoading=false;
                                                        });
                                                    }
                                                  } else if (value ==
                                                      "user not have coins") {
                                                    print(
                                                        "---------------------e--------thishdiashidisd");
                                                    Utility.showErrorDialog(
                                                        AppLocalizations.of(
                                                                context)
                                                            .lblerror,
                                                        AppLocalizations.of(
                                                                context)
                                                            .lblyouhavenocoin,
                                                        DialogType.ERROR,
                                                        context);
                                                         setState(() {
                                                          isLoading=false;
                                                        });
                                                  } else if (value ==
                                                      "This position is reserved") {
                                          //    print(AppLocalizations.of(context).lblmyrooms);
                                                        print("saaaaaaaaaaaaaaaaaaaaaaaaaa");
                                                        Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblpostionreceved,DialogType.ERROR,context);
                                          //   showtoast(AppLocalizations.of(context).lblpostionreceved);
                                                setState(() {
                                                          isLoading=false;
                                                        });
                                                    // Utility.showErrorDialog(
                                                    //     AppLocalizations.of(
                                                    //             context)
                                                    //         .lblerror,
                                                    //     AppLocalizations.of(
                                                    //             context)
                                                    //         .lblpostionreceved,
                                                    //     DialogType.ERROR,
                                                    //     context);
                                                  }
                                                  //     setState(() {
                                                  //    is_Loading=false;

                                                  //  });
                                                  //      _showErrorDialog(value);
                                                });
                                              } else {
                                                print("------------------------test----------------");
                                                Utility.showErrorDialog(
                                                    AppLocalizations.of(context)
                                                        .lblerror,
                                                    AppLocalizations.of(context)
                                                        .lblNoInternetConnection,
                                                    DialogType.WARNING,
                                                    context);
                                                     setState(() {
                                                          isLoading=false;
                                                        });
                                                //  _showErrorDialog("system faild");
                                              }
                                            },
                                            child: FrendsItem(
                                              my_rooms.data.rooms[index].roomName,
                                              my_rooms
                                                  .data.rooms[index].description,
                                              my_rooms.data.rooms[index].users
                                                  .toString(),
                                              my_rooms.data.rooms[index]
                                                  .toString(),
                                              Utility.BaseURL +
                                                  my_rooms
                                                      .data.rooms[index].image,
                                            ),
                                          )

                                        //  )
                                        : Container(
                                            height: 100,
                                          );
                                  }),
                            ),
                          ],
                        ),
        ));
  }
  void  showtoast (String mahmouid){
    Toast.show(mahmouid, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  } 

  // void _showErrorDialog(String message) {
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
  //                   setState(() {
  //                     isLoading = false;
  //                   });
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           ));
  // }
}
//
