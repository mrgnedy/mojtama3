import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

import 'package:mojtam3/Widget/member_item.dart';
import 'package:mojtam3/model/models/frindsrequestModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/personProfile.dart';


import 'package:mojtam3/utillites/utillity_class.dart';
// import 'package:provider/provider.dart';

class FrendRequessPage extends StatefulWidget {
  final String lblFriendsRequest;
  final int check;

  FrendRequessPage(this.lblFriendsRequest, this.check);

  @override
  _FrendRequessPageState createState() => _FrendRequessPageState();
}

class _FrendRequessPageState extends State<FrendRequessPage> {
  ApiRequests apiRequests = new ApiRequests();
  bool is_loading = false;
    DataUser _dataUser = DataUser.instance;
  // void _showErr orDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx)=>
  //            AlertDialog(
  //             title: Text( widget.lblFriendsRequest),
  //             content: Text(message),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('Okay',style: TextStyle(
  //                   color: Colors.teal
  //                 ),),
  //                 onPressed: () {
  //                   // setState(() {
  //                   //   _isLoading = false;
  //                   // });
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           )

  //   );
  // }
  //  print(widget.)
  @override
  Widget build(BuildContext context) {
    // print("_FrendRequessPageState");
    print(widget.check.toString());

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
            widget.lblFriendsRequest,
            style: TextStyle(
                fontFamily: "thin", fontSize: 18, color: Colors.white),
          ),
        ),
        body: FutureBuilder<FrindsRequstsModel>(
            future: widget.check == 0
                ? apiRequests
                    .friendsReques("http://mojtama3.life/api/friendrequests")
                : widget.check == 1
                    ? apiRequests
                        .friendsReques("http://mojtama3.life/api/onlinechats")
                    : apiRequests
                        .friendsReques("http://mojtama3.life/api/offlinechats"),
            builder: (context, snapshot) {
              print("mahmoud---------------------");
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                                  child: CircularProgressIndicator(
                    
                    backgroundColor: Colors.teal,
                  ),
                );
              if (snapshot.connectionState == ConnectionState.done) {
                print("mahmoud---------------------2");
                // print( snapshot.data.friend==null);
if(snapshot.data==null)
{
  //  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblemailalreadyused,DialogType.ERROR,context);
 
  return Center(child: Text(AppLocalizations.of(context).lblNoInternetConnection,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
}else {
                  print("------------frined == null2 ;");
                  if (snapshot.data.friend.length == 0) {
                    return Center(child: Text(widget.check == 0?AppLocalizations.of(context).lblThereAreNoFriendRequests: widget.check == 1?AppLocalizations.of(context).lblNoOnlineFriends:AppLocalizations.of(context).lblNoOfflineFriends,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: is_loading ?  CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ):ListView.builder(
                            itemCount: snapshot.data.friend.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (Context){
                               return PersonProfilePage(id:  snapshot.data.friend[index].userId.toString()==_dataUser.getKey(Utility.ID).toString()?snapshot.data.friend[index].ownerId.toString(): snapshot.data.friend[index].userId.toString(),);
                             }));
                                },
                                
                                
                             child:   Slidable(
  actionPane: SlidableDrawerActionPane(),
 // actionExtentRatio: 0.25,
  child: Container(
    color: Colors.white,
    child: MemberItem(
                                  snapshot.data.friend[index].userName,
                                  snapshot.data.friend[index].story,
                                  snapshot.data.friend[index].userImage,
                                ),
  ),
  actions: <Widget>[
    // IconSlideAction(
    //   caption: 'Archive',
    //   color: Colors.blue,
    //   icon: Icons.archive,
    //   //onTap: () => _showSnackBar('Archive'),
    // ),
   widget.check == 0?  IconSlideAction(
      caption: AppLocalizations.of(context).lblDenay,
      color: Colors.red,
      icon: Icons.delete,
      onTap: () {
          if (widget.check == 0) {
                                    setState(() {
                                      is_loading  = true;
                                    });
                                    ApiRequests apiRequests = new ApiRequests();
                                    apiRequests
                                        .acceptFriendRequest(snapshot
                                            .data.friend[index].chatId
                                            .toString(),0)
                                        .then((value) {
                                          print("-------------------------befor---------------");
                                          print(value);
                                            setState(() {
                                      is_loading  = false;
                                    });
  print("-------------------------after---------------");
                                          print(value);
                                      value==true
                                          ? Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendrefuse,DialogType.SUCCES,context)
 
                                          :   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                                    });
                                  }
      },
    ):Container(),
  ],
  secondaryActions: <Widget>[
    // IconSlideAction(
    //   caption: 'More',
    //   color: Colors.black45,
    //   icon: Icons.more_horiz,
    //  // onTap: () => _showSnackBar('More'),
    // ),
    widget.check == 0?IconSlideAction(
      caption:  AppLocalizations.of(context).lblAccept,
      color: Colors.green,
      icon: Icons.add,
      onTap: () {
           if (widget.check == 0) {
                                    setState(() {
                                      is_loading  = true;
                                    });
                                    ApiRequests apiRequests = new ApiRequests();
                                    apiRequests
                                        .acceptFriendRequest(snapshot
                                            .data.friend[index].chatId
                                            .toString(),1)
                                        .then((value) {
                                          print("-------------------------befor---------------");
                                          print(value);
                                            setState(() {
                                      is_loading  = false;
                                    });
  print("-------------------------after---------------");
                                          print(value);
                                      value==true
                                          ?Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendadded,DialogType.SUCCES,context)
                                          :  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                                    });
                                  }
      },
    ):Container(),
  ],
)
                                
                       //         child:
                                //  MemberItem(
                                //   snapshot.data.friend[index].userName,
                                //   snapshot.data.friend[index].story,
                                //   snapshot.data.friend[index].userImage,
                                // ),
                              );
                            }),
                      ),
                    );
                  }
                }
              }

              //  return Text("تاكد من معلوماتك يا حبيبي",textAlign: TextAlign.center,style: TextStyle(
              //     fontSize: 8,
              //      fontFamily: "thin"
              //  ),);
            })

        // SingleChildScrollView(
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     height: MediaQuery.of(context).size.height,
        //     child: ListView.builder(
        //         itemCount: 20+1,
        //         itemBuilder: (BuildContext context, index) {
        //       return index <21 ?
        //         MemberItem(
        //         "شباب السعوديه",
        //         "هذا النص هو مثال النص يمكن يستخدم في",
        //         "assets/soud.jpg",
        //       ):Container(
        //         height: 25,
        //         width: MediaQuery.of(context).size.width,
        //         color: ui.coloreOFbackground,
        //       );
        //     }),
        //   ),
        // ),
        );
  }
}
