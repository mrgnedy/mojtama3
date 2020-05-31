import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/room.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/model/provider/gallary_page.dart';
import 'package:mojtam3/personProfile.dart';

import 'package:mojtam3/screens/group_member.dart';
import 'package:mojtam3/tabs_page.dart';
import 'package:mojtam3/utillites/circle_progess.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

import 'TabsPages/frinds_tab/edit_group_page.dart';


class GroupPage extends StatefulWidget {
  final Room_Model roomModel;
  GroupPage(this.roomModel);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
DataUser _dataUser = DataUser.instance;
 bool isloading = false;
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("---------------------room users------------------");
 print(  widget.roomModel.userId.toString());
 print( _dataUser.getKey(Utility.ID));
 print(widget.roomModel.precent.toString());
 //print(_dataUser.getKey(Utility.ID)== widget.room_model.userId.toString());

            return Scaffold(
            backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 30),

                      ///padding: EdgeInsets.only(top: 10),
                      color: Colors.grey[800],
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              
                        widget.roomModel.userId.toString()== _dataUser.getKey(Utility.ID)?IconButton(
                                        icon: Image.asset(
                                          "assets/images/edit.png" ,
                                          height: 20 ,
                                          width: 20 ,
                                        ) ,
                                        onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder: (context){
                                            return EditRoomPage(roomModel:widget.roomModel);
                                          }));
                                          // Navigator.push(context ,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //           return EditeProfilePage(widget.profileInfo);
                                          //         }));
                                        } ,
                                      ):Container() ,

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                               margin: EdgeInsets.only(
                                                top: 12) ,
                                child: Text(
                                  widget.roomModel.level.toString(),
                                  softWrap: false,
                                  style: TextStyle(
                                      fontFamily: "black",
                                      fontSize: 17,
                                      color: Colors.grey),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
return GalleryPage(imagePath: widget.roomModel.image);
                                  }));
                                },
                                                              child: Container(
                                  child: CustomPaint(
                                    foregroundPainter: CircleProgress(
                                        MediaQuery.of(context).size.height / 5,
                                        MediaQuery.of(context).size.height *
                                            .3 *
                                            .2,
                                        double.parse( widget.roomModel.precent.toString())),
                                    child: ClipOval(
                                        child:
                                        CachedNetworkImage(
              imageUrl:
                  Utility.BaseURL+widget.roomModel.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
               height:  MediaQuery.of(context).size.height *
                                                      .3 *
                                                      .3,
                                                  width:  MediaQuery.of(context).size.height /
                                                      5 *
                                                      .44,
               
               fit: BoxFit.fill,
              //  width: MediaQuery.of(context).size.width/3-40,
            )
 

                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                 margin: EdgeInsets.only(
                                                top: 12) ,
                                child: Text(
                                  (widget.roomModel.level+1).toString(),
                                  style: TextStyle(
                                      fontFamily: "black",
                                      fontSize: 17,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 12,right: 12,left: 12),
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.roomModel.roomName,textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "black",
                                        color: Colors.grey),
                                  )),
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  "${ widget.roomModel.precent}%",
                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: "black",
                                      fontSize: 15,
                                      color: Colors.grey),
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                       Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                      child: Text(
                       AppLocalizations.of(context).lblSerialNumber,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "thin",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(left: 18, right: 18),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Text(
                          widget.roomModel.roomId.toString(),
                          style: TextStyle(
                              color: Colors.grey, fontSize: 12, fontFamily: "thin"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                      child: Text(
                        "مملوكة من قبل",//AppLocalizations.of(context).lblSerialNumber,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "thin",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(left: 18, right: 18),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Text(
                          widget.roomModel.userName.toString(),
                          style: TextStyle(
                              color: Colors.grey, fontSize: 12, fontFamily: "thin"),
                        ),
                      ),
                    ),
                      Align(
                        alignment: Alignment.center,
                                              child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PersonProfilePage(
                  id: widget.roomModel.userId.toString(),
                );
              }));
            },
            child: new Container(
                margin: const EdgeInsets.all(8),
                child: new ClipOval(
            
                //  backgroundImage:
                  child:    new CachedNetworkImage(
                   imageUrl:   Utility.BaseURL +  widget.roomModel.userImage,
                    placeholder: (context, url) =>
                                    CircularProgressIndicator(backgroundColor: Colors.teal,),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                    fit: BoxFit.fill,

                   width: 60,
height: 60,
                   ),
                   

                )),
          ),
                      ),
                  
                  
                  
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        AppLocalizations.of(context).lblStatus,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "thin",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(left: 18, right: 18),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Text(
                          widget.roomModel.story,
                          style: TextStyle(
                              color: Colors.grey, fontSize: 12, fontFamily: "thin"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        AppLocalizations.of(context).lblRoomMemmber,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "thin",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(left: 18, right: 18),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if(widget.roomModel.userId.toString()== _dataUser.getKey(Utility.ID))
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                print("--------------room id 1 ---------------");
                                print(widget.roomModel.roomId.toString());
                                return GroupMember(room_id: widget.roomModel.roomId.toString());
                              }));
                        },
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).lblRoomMemmber,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: "thin"),
                                  ),
                                  Text(
                                    " (${widget.roomModel.users})",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: "thin"),
                                  ),
                                ],
                              ),
                            ),
                       widget.roomModel.userId.toString()== _dataUser.getKey(Utility.ID) ?
                        Icon(
                              Icons.keyboard_arrow_down,
                              size: 25,
                              color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),)),
                            ):Container(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        AppLocalizations.of(context).lblLanguage,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "thin",
                            color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(left: 18, right: 18,bottom: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Text(
                          widget.roomModel.language,
                          style: TextStyle(
                              color: Colors.grey, fontSize: 12, fontFamily: "thin"),
                        ),
                      ),
                    ),
                       widget.roomModel.userId.toString()!= _dataUser.getKey(Utility.ID)?
                     isloading?CircularProgressIndicator(backgroundColor: Colors.teal,):  GestureDetector(
                         onTap: (){
                            ApiRequests apiRequests = new ApiRequests();
                                    apiRequests
                                        .leaveRoom( _dataUser.getKey(Utility.ID),  widget.roomModel.roomId.toString())
                                        .then((value) {
                                      print(
                                          "-------------gooood-----------------");
                                     print(value);
                                      setState(() {
                                        isloading = false;
                                      });
                                      if(value==null){
     Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context)    ;
                                      }
                                      else{
                                        if(value=="success"){
 Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) {
        return TabsPage();
      }), (Route<dynamic> route) => false);
                                        }else{
                                              Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context)    ;
                                        }
                                      }
                                   
                                    });
                         },
                                                child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 8, right: 8,bottom: 8),
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment(-1.0, 1.0),
                                colors: [
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
                          child: Text("مغادره الغرفة",
                              style: TextStyle(
                                  fontFamily: "black", color: Colors.white)),
                      ),
                       ):Container()
                    // Container(
                    //   padding: const EdgeInsets.only(
                    //       right: 20, left: 20, top: 10, bottom: 10),
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.only(left: 18, right: 18, top: 30),
                    //   height: 60,
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/Rectangle2.png"),
                    //         fit: BoxFit.fill),
                    //   ),
                    //   child: Text(AppLocalizations.of(context).lblJoin,
                    //       style:
                    //       TextStyle(fontFamily: "black", color: Colors.white)),
                    // ),
                  ],
                ),
              ),
            );

   
  }
  //     void _showErr orDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx)=>
  //            AlertDialog(
  //             title: Text('An Error Occurred!'),
  //             content: Text(message),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('Okay',style: TextStyle(
  //                   color: Colors.teal
  //                 ),),
  //                 onPressed: () {
  //                   setState(() {
  //                     isloading = false;
  //                   });
                    
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           )

  //   );
  // }
  
}
