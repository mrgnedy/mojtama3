import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

import 'package:mojtam3/Widget/member_item.dart';
import 'package:mojtam3/model/models/RoomMemmbersList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/personProfile.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class GroupMember extends StatefulWidget {
  final String room_id;
  GroupMember({this.room_id});


  @override
  _GroupMemberState createState() => _GroupMemberState();
}

class _GroupMemberState extends State<GroupMember> {
  int _check1 = 0;
  int _check2 = 0;
  int _check3 = 0;
  ApiRequests apiRequests = new ApiRequests();
  bool is_loading;
  RoomMemberList memberlist;
   DataUser _dataUser = DataUser.instance;
@override
  void initState() {
    print("-------------------room id ---------------------");
    print(widget.room_id.toString());
    // TODO: implement initState
    setState(() {
 // memberlist=value;
   is_loading=true;

});
apiRequests.getRoomMemmber(widget.room_id).then((value){
  // print("---------------room members---------------");
  // print(value);
setState(() {
  memberlist=value;
   is_loading=false;

});

});



    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
        return Scaffold(
             backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          appBar: new AppBar(
            backgroundColor: Colors.grey[800],
            title: Text(
              AppLocalizations.of(context).lblMembers,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "thin",
                  color: Colors.white),
            ),

            //todo need to fix search how to max leading width
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body:   is_loading?CircularProgressIndicator(backgroundColor: Colors.teal,): SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Container(
                //   height: 60,
                //   margin: EdgeInsets.only(bottom: 15),
                //   padding: const EdgeInsets.only(
                //       left: 12, right: 12, top: 8, bottom: 8),
                //   color: Colors.grey[400],
                //   child: Material(
                //     color: Colors.white,
                //     elevation: 5,
                //     borderRadius: BorderRadius.circular(30.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Expanded(
                //           child: TextFormField(
                //             cursorColor: Colors.grey,
                //             style: TextStyle(
                //               fontSize: 20,
                //             ),
                //             textAlign: TextAlign.center,
                //             keyboardType: TextInputType.text,
                //             decoration: InputDecoration.collapsed(
                //               hintStyle: TextStyle(
                //                   fontSize: 14,
                //                   fontFamily: "black",
                //                   color: Colors.grey[400]),
                //               hintText: AppLocalizations.of(context).lblSearch,
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 8),
                //           child: IconButton(
                //             icon: Image.asset("assets/images/search.png"),
                //             onPressed: (){},
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            //AppLocalizations.of(context).lblActiviee,
                            "الاعضاء",style: TextStyle(
                                fontSize: 16,
                                height: 1,
                                fontFamily: "thin",
                                 color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                          ),
                          Text(
                            " (${memberlist.usersnotsuspened.length.toString()}) ",
                            style: TextStyle(
                                fontSize: 16,
                                height: 1,
                                fontFamily: "thin",
                                color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _check1 == 1 ? _check1 = 0 : _check1 = 1;
                              print(_check1);
                            });
                          },
                          icon: Image.asset(
                            _check1 == 1
                                ? "assets/images/arrow-point-to-up.png"
                                : "assets/images/arrow-point-to-dowen.png",
                            height: 15,
                            width: 15,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: _check1 == 1 ? MediaQuery.of(context).size.height : 0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: memberlist.usersnotsuspened.length,
                      itemBuilder: (BuildContext context, index) {





 return Slidable(
  actionPane: SlidableDrawerActionPane(),
 // actionExtentRatio: 0.25,
  child: Container(
    color: Colors.white,
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PersonProfilePage(id: memberlist.usersnotsuspened[index].userId.toString());
        }));
      },
          child: MemberItem( 
                           memberlist.usersnotsuspened[index].userName,
                             memberlist.usersnotsuspened[index].yourMind??"لا يوجد له ",
                            memberlist.usersnotsuspened[index].userImage
                          ),
    )
  ),
  actions: <Widget>[
    // IconSlideAction(
    //   caption: 'Archive',
    //   color: Colors.blue,
    //   icon: Icons.archive,
    //   //onTap: () => _showSnackBar('Archive'),
    // ),
        IconSlideAction(
      caption: 'حذف',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () {
              setState(() {
          is_loading=true;
        });
        
        apiRequests.deletmember(memberlist.usersnotsuspened[index].userId.toString(), widget.room_id).then((value){
if(value!=null){
if(value=="success"){
_showErrorDialog("تم  الحذف ");
}else{
_showErrorDialog("يوجد خطا ما ");
}
}
else{
  _showErrorDialog( AppLocalizations.of(context)
                                    .lblNoInternetConnection);
}

        });
      },
    ),
  ],
  secondaryActions: <Widget>[
    // IconSlideAction(
    //   caption: 'More',
    //   color: Colors.black45,
    //   icon: Icons.more_horiz,
    //  // onTap: () => _showSnackBar('More'),
    // ),
    IconSlideAction(
      caption: 'حظر',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () {
              setState(() {
          is_loading=true;
        });
        apiRequests.hazer(memberlist.usersnotsuspened[index].userId.toString(), widget.room_id).then((value){
if(value=="success"){
_showErrorDialog("تم  الحظر ");
}else{
_showErrorDialog("يوجد خطا ما ");
}
        });
      },
    ),
  ],
);



















                        // return MemberItem(
                        //  memberlist.usersnotsuspened[index].userName,
                        //    memberlist.usersnotsuspened[index].yourMind??"لا يوجد له ",
                        //   memberlist.usersnotsuspened[index].userImage
                        // );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                           "المحظورين",// AppLocalizations.of(context).lblInactivee,
                            style: TextStyle(
                                fontSize: 16,
                                height: 1,
                                fontFamily: "thin",
                                        color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                          ),
                          Text(
                            " (${memberlist.userssuspened.length.toString()}) ",
                            style: TextStyle(
                                fontSize: 16,
                                height: 1,
                                fontFamily: "thin",
                                        color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _check2 == 1 ? _check2 = 0 : _check2 = 1;
                              print(_check2);
                            });
                          },
                          icon: Image.asset(
                            _check2 == 1
                                ? "assets/images/arrow-point-to-up.png"
                                : "assets/images/arrow-point-to-dowen.png",
                            height: 15,
                            width: 15,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: _check2 == 1 ? MediaQuery.of(context).size.height : 0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: memberlist.userssuspened.length,
                      itemBuilder: (BuildContext context, index) {
                       
                        
                        
                         return Slidable(
  actionPane: SlidableDrawerActionPane(),
 // actionExtentRatio: 0.25,
  child: Container(
    color: Colors.white,
    child:  GestureDetector(
          onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PersonProfilePage(id: memberlist.userssuspened[index].userId.toString());
        }));
      },
          child: MemberItem(
                            memberlist.userssuspened[index].userName,
                             memberlist.userssuspened[index].yourMind??"لا يوجد له ",
                            memberlist.userssuspened[index].userImage,
                          ),
    )
  ),
  // actions: <Widget>[
  //   // IconSlideAction(
  //   //   caption: 'Archive',
  //   //   color: Colors.blue,
  //   //   icon: Icons.archive,
  //   //   //onTap: () => _showSnackBar('Archive'),
  //   // ),
  //   IconSlideAction(
  //     caption: 'Share',
  //     color: Colors.indigo,
  //     icon: Icons.share,
  //  //   onTap: () => _showSnackBar('Share'),
  //   ),
  // ],
  secondaryActions: <Widget>[
    // IconSlideAction(
    //   caption: 'More',
    //   color: Colors.black45,
    //   icon: Icons.more_horiz,
    //  // onTap: () => _showSnackBar('More'),
    // ),
    IconSlideAction(
      caption: 'فك الحظر',
      color: Colors.green,
      icon: Icons.add,
      onTap: () {
        setState(() {
          is_loading=true;
        });
        apiRequests.fakelhazer(memberlist.userssuspened[index].userId.toString(), widget.room_id).then((value){
if(value=="success"){
_showErrorDialog("تم فك الحظر ");
}else{
_showErrorDialog("يوجد خطا ما ");
}
        });
      },
          ),
        ],
      );
      
      
      
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                            
                            }),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15, right: 15),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Row(
                      //         children: <Widget>[
                      //           Text(
                      //             AppLocalizations.of(context).lblgamesandBots,
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 height: 1,
                      //                 fontFamily: "thin",
                      //                 color:Colors.black),
                      //           ),
                      //           Text(
                      //             " (34) ",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 height: 1,
                      //                 fontFamily: "thin",
                      //                 color: Colors.black),
                      //           ),
                      //         ],
                      //       ),
                      //       IconButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               _check3 == 1 ? _check3 = 0 : _check3 = 1;
                      //               print(_check3);
                      //             });
                      //           },
                      //           icon: Image.asset(
                      //             _check3 == 1
                      //                 ? "assets/images/arrow-point-to-up.png"
                      //                 : "assets/images/arrow-point-to-dowen.png",
                      //             height: 15,
                      //             width: 15,
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   height: _check3 == 1 ? MediaQuery.of(context).size.height : 0,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: ListView.builder(
                      //       itemCount: 20,
                      //       itemBuilder: (BuildContext context, index) {
                      //         return MemberItem(
                      //           "شباب السعوديه",
                      //           "هذا النص هو مثال النص يمكن يستخدم في",
                      //           "assets/soud.jpg",
                      //         );
                      //       }),
                      // ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              );
         
        }
       void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx)=>
             AlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay',style: TextStyle(
                    color: Colors.teal
                  ),),
                  onPressed: () {
                    setState(() {
                      is_loading = false;
                    });
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            )

    );
  }
     
}
