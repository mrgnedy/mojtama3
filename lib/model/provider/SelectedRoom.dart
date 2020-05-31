import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/room.dart';
import 'package:mojtam3/model/provider/audioplay.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/model/provider/gallary_page.dart';

import 'package:mojtam3/model/provider/sendroom.dart';
import 'package:mojtam3/personProfile.dart';
import 'package:mojtam3/screens/group_page.dart';
import 'package:mojtam3/screens/personProfile2.dart';
import 'package:mojtam3/tetst2.dart';

import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toast/toast.dart';

class ChatPage extends StatefulWidget {
  final String chatId;
  final String title;
  final Room_Model room_model;
  final int check;
  ChatPage({this.chatId, this.title, this.room_model, this.check});
  @override
  ChatPageState createState() {
    return new ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {
  final db = Firestore.instance;
  CollectionReference chatReference;
  final TextEditingController _textController = new TextEditingController();
  DataUser _dataUser = DataUser.instance;
  final _formKey = GlobalKey<FormState>();
  ApiRequests apiRequests = new ApiRequests();
  BehaviorSubject<QuerySnapshot> chatSubject = BehaviorSubject();
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    
    print("------------------in chat page --------------------");
    print( widget.room_model.staticId);
    super.initState();
    // print("-----------------------initla state------------------------");
    chatReference = db
        .collection("chats")
        .document("Room_" + widget.room_model.staticId.toString())
        .collection('messages');
        // chatSubject = BehaviorSubject()
chatReference. orderBy('time', descending: true).limit(30).snapshots().listen((snapshot){
  chatSubject.sink.add(snapshot);
});
    // print(_dataUser.getKey(Utility.TOKEN));
    // print(_dataUser.getKey(Utility.Imageurl));
    // print(_dataUser.getKey(Utility.ID));
  }

  @override
  void dispose() {
    super.dispose();
    chatSubject?.close();
    _textController.clear();
    _textController.dispose();
  }

  List<Widget> generateSenderLayout(DocumentSnapshot documentSnapshot) {
    print(
        "-----------------------generate senderlayout voive------------------------");
        print(documentSnapshot.data['voice_url']);

    return <Widget>[
      
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // new Text(documentSnapshot.data['sender_name'],
            //     style: new TextStyle(
            //         fontSize: 14.0,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: documentSnapshot.data['image_url'] != ''
                  ? InkWell(
                      child: new Container(
                        
                        child: CachedNetworkImage(
                          imageUrl:  Utility.BaseURL + documentSnapshot.data['image_url'],
                           placeholder: (context, url) =>
                                  CircularProgressIndicator(backgroundColor: Colors.teal,),
                                    errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                          fit: BoxFit.fitWidth,
                        ),
                        height: 150,
                        width: 150.0,
                        color: Colors.grey,
                       // color: Color.fromRGBO(0, 0, 0, 0.2),
                        padding: EdgeInsets.all(5),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GalleryPage(
                              imagePath: documentSnapshot.data['image_url'],
                            ),
                          ),
                        );
                      },
                    )
                  : documentSnapshot.data['voice_url']!=""&&documentSnapshot.data['voice_url'].toString()!="null"?InkWell(
                      child: new Container(
                        child:Icon(Icons.play_circle_outline),
                        height: 50,
                        width: 50,
                     color: Colors.grey,
                        padding: EdgeInsets.all(5),
                      ),
                      onTap: () {
                       showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return AudioPlayBar(file: documentSnapshot.data['voice_url']);
              });
                      },
                    ):Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                         Container(
                           margin: EdgeInsets.only(bottom: 5),
                           padding: EdgeInsets.only(left: 5),
                           child: new Text(documentSnapshot.data['send_time'],
                                  style: TextStyle(color: Colors.grey[500])),
                         ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // new Text(documentSnapshot.data['send_time'],
                            //     style: TextStyle(color: Colors.grey[500])),
                            GestureDetector(
                                    onLongPress: (){

                                  Clipboard.setData(new ClipboardData(text:documentSnapshot.data['text']));
                                  Toast.show("Copy link", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                              },
                                                          child: Container(
                                  padding: EdgeInsets.all(8),
                                 // margin: EdgeInsets.only(right: 8, left: 8),
                               //   alignment: Alignment.centerLeft,
                               //   width: MediaQuery.of(context).size.width * .8,
                                 constraints: BoxConstraints(minWidth: 20, maxWidth: MediaQuery.of(context).size.width * .65),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                  child: new Text(
                                    documentSnapshot.data['text'],
                                    textAlign: TextAlign.left,
                                  )),
                            ),
                          ],
                        ),
                    ],
                  ),
            ),
          ],
        ),
      ),
      new Container(
                margin: const EdgeInsets.only(right:4),
                width: 50,
                height: 50,
                     decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                child:  ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                   imageUrl:   Utility.BaseURL +  documentSnapshot.data['profile_photo'],
                    placeholder: (context, url) =>
                                  CircularProgressIndicator(backgroundColor: Colors.teal,),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                                  fit: BoxFit.fill,

//                  width: 40,
// height: 40,
                   ),
                )),
      // new Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: <Widget>[
      //     new Container(
      //         margin: const EdgeInsets.only(left: 8.0),
      //         child: new CircleAvatar(
      //           backgroundImage:
      //           new NetworkImage(documentSnapshot.data['profile_photo']),
      //         )),
      //   ],
      // ),
    ];
  }

  List<Widget> generateReceiverLayout(DocumentSnapshot documentSnapshot) {
    print(
        "-----------------------generate reviverlayout------------------------");
    return <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PersonProfilePage2(
                  id: documentSnapshot.data['sender_id'].toString(),
                );
              }));
            },
            child:   new Container(
                margin: const EdgeInsets.only(left:4),
                width: 50,
                height: 50,
                     decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                child:  ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                   imageUrl:   Utility.BaseURL +  documentSnapshot.data['profile_photo'],
                    placeholder: (context, url) =>
                                  CircularProgressIndicator(backgroundColor: Colors.teal,),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                                  fit: BoxFit.fill,

//                  width: 40,
// height: 40,
                   ),
                )),
//             child: new Container(
//                 margin: const EdgeInsets.only(right: 8.0),
//                 child: new ClipOval(
            
//                 //  backgroundImage:
//                   child:    new CachedNetworkImage(
//                    imageUrl:   Utility.BaseURL +  documentSnapshot.data['profile_photo'],
//                     placeholder: (context, url) =>
//                                   CircularProgressIndicator(backgroundColor: Colors.teal,),
//                               errorWidget: (context, url, error) =>
//                                   Icon(Icons.error),
//                                   fit: BoxFit.fill,

//                    width: 40,
// height: 40,
//                    ),
                   

//                 )),
          ),
        ],
      ),
  
        Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: documentSnapshot.data['image_url'] != ''
                  ? Column(
                    children: <Widget>[
                                            Text(documentSnapshot.data['sender_name'],style: TextStyle(
               color: Colors.grey,
               fontFamily: "thin",
             ), ),
                      InkWell(
                          child: new Container(
                            child: CachedNetworkImage(
                              imageUrl:  Utility.BaseURL + documentSnapshot.data['image_url'],
                               placeholder: (context, url) =>
                                      CircularProgressIndicator(backgroundColor: Colors.teal,),
                                        errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                              fit: BoxFit.fitWidth,
                            ),
                            height: 150,
                            width: 150.0,
                         color: Colors.grey,
                            padding: EdgeInsets.all(5),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GalleryPage(
                                  imagePath: documentSnapshot.data['image_url'],
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  )
                  :documentSnapshot.data['voice_url']!=""&&documentSnapshot.data['voice_url'].toString()!="null"?Column(
                    children: <Widget>[
                                            Text(documentSnapshot.data['sender_name'],style: TextStyle(
               color: Colors.grey,
               fontFamily: "thin",
             ), ),
                      InkWell(
                          child: new Container(
                            child:Icon(Icons.play_circle_outline),
                            height: 50,
                            width: 50,
                         color: Colors.grey,
                            padding: EdgeInsets.all(5),
                          ),
                          onTap: () {
              //          showModalBottomSheet<void>(
              // context: context,
              // builder: (BuildContext context) {
              // //  return AudioPlayBar(file: documentSnapshot.data['voice_url']);
              // return PlayerWidget(url: "http://mojtama3.life/public/images/"+documentSnapshot.data['voice_url']) ;
              // });
            //   print("-------------------walaa1------------");
            //   Navigator.push(context, MaterialPageRoute(builder: (context){
            // print("-------------------walaa2------------");
            //     return PlayerWidget(url: "http://mojtama3.life/public/images/"+documentSnapshot.data['voice_url']);
            //   }));
                              showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return AudioPlayBar(file: documentSnapshot.data['voice_url']);
              });
                          },
                        ),
                    ],
                  ): Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                         Row(
                           children: <Widget>[
             
                             Container(
                               margin: EdgeInsets.only(bottom: 5),
                               padding: EdgeInsets.only(left: 5),
                               child: new Text(documentSnapshot.data['send_time'],
                                      style: TextStyle(color: Colors.grey[500])),
                             ),
                                                   Text(documentSnapshot.data['sender_name'],style: TextStyle(
               color: Colors.grey,
               fontFamily: "thin",
             ), ),
                           ],
                         ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // new Text(documentSnapshot.data['send_time'],
                            //     style: TextStyle(color: Colors.grey[500])),
                            GestureDetector(
                                    onLongPress: (){

                                  Clipboard.setData(new ClipboardData(text:documentSnapshot.data['text']));
                                  Toast.show("Copy link", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                              },
                                                          child: Container(
                                  padding: EdgeInsets.all(8),
                                 // margin: EdgeInsets.only(right: 8, left: 8),
                               //   alignment: Alignment.centerLeft,
                               //   width: MediaQuery.of(context).size.width * .8,
                                 constraints: BoxConstraints(minWidth: 20, maxWidth: MediaQuery.of(context).size.width * .65),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                  child: new Text(
                                    documentSnapshot.data['text'],
                                    textAlign: TextAlign.left,
                                  )),
                            ),
                          ],
                        ),
                    ],
                  ),
            ),
    ];
  }

  generateMessages(AsyncSnapshot<QuerySnapshot> snapshot) {
    print("-----------------------generate message------------------------");
    return snapshot.data.documents
        .map<Widget>((doc) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
               padding: EdgeInsets.only(right: 8,left: 8),
              child: new Row(
                children: doc.data['sender_id'] !=
                        _dataUser
                            .getKey(Utility.TOKEN) //widget.prefs.getString('uid')
                    ? generateReceiverLayout(doc)
                    : generateSenderLayout(doc),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // print("mahmoud------------" +
    //     Utility.BaseURL +
    //     "------------------" +
    //     widget.room_model.users.toString());
    print("---------------------in rooom------------------------");
    print(widget.room_model.roomId);
    print(widget.chatId);
    print(widget.check);
    print(widget.title);
    print(Utility.BaseURL );
    print( widget.room_model.userImage);
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: Container(),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return GroupPage(
                                  widget.room_model); //widget.room_model);
                            }));
                          },
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  Utility.BaseURL + widget.room_model.image,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 40,
                              width: 40,

                              fit: BoxFit.fill,
                              //  width: MediaQuery.of(context).size.width/3-40,
                            ),

                            //   FadeInImage.assetNetwork(
                            //       height: 40,
                            //       width: 40,
                            //       placeholder: "assets/soud.jpg",
                            //       image:
                            //           Utility.BaseURL + widget.room_model.image,
                            //       fit: BoxFit.fill),
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            widget.room_model.roomName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "thin",
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .15,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.room_model.userId.toString(),
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PersonProfilePage(
                                  id: widget.room_model.userId.toString(),
                                );
                              }));
                            },
                            child: ClipOval(
                                child: CachedNetworkImage(
                              imageUrl:
                                  Utility.BaseURL + widget.room_model.userImage,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 40,
                              width: 40,

                              fit: BoxFit.fill,
                              //  width: MediaQuery.of(context).size.width/3-40,
                            )),
                          ),

                          //   FadeInImage.assetNetwork(
                          //       height: 40,
                          //       width: 40,
                          //       placeholder: "assets/soud.jpg",
                          //       image: Utility.BaseURL +
                          //           widget.room_model.userImage,
                          //       fit: BoxFit.fill),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    widget.room_model.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        height: .8, fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[800],

          titleSpacing: 0.0,
          //todo need to fix search how to max leading width
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.all(8),
       
          color: Colors.grey[300],
      //   color: Colors.black,
          child: new Column(
              children: <Widget>[
                // StreamBuilder<QuerySnapshot>(
                //   stream: chatReference.orderBy('time', descending: true).snapshots(),
                //   builder: (BuildContext context,
                //       AsyncSnapshot<QuerySnapshot> snapshot) {
                //     print("----------------- befor stream --------------");
                //     print(snapshot);
                //     // try {
                //       if (snapshot ==null || !snapshot.hasData) return new Text("No Chat");
                //       return Expanded(
                //         child: new ListView(
                //           reverse: true,
                //           children: generateMessages(snapshot),
                //         ),
                //       );
                //     // } catch (e) {
                //     //   print("---------------------error---------------------");
                //     //   print(e);

                //     //   // return Container(
                //     //   //   height: 10,
                //     //   //   width: 10,
                //     //   //   color: Colors.red,
                //     //   // );
                //     // }
                //   },
                // ),  .collection("chats").document("Room_" + widget.chatId).collection('messages');
                StreamBuilder<QuerySnapshot>(
                //  initialData: chatReference.snapshots(),
                  stream: chatSubject.stream,
          // .orderBy('time', descending: true)
          // .snapshots(),
                  builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return Expanded(
              child: new ListView(
                
                reverse: true,
                children: generateMessages(snapshot),
              ),
            );
                    }
                  },
                ),
              //  new Divider(height: 1.0),
                widget.room_model.member == 0
                    ? GestureDetector(
            onTap: () {
              apiRequests.requestroom(widget.chatId).then((valur) {
                if(valur!=null){
                  if(valur=="success"){
                    Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoujoindroom,DialogType.SUCCES,context);
                  }else{
                                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouarealreadyinroom,DialogType.ERROR,context);

                  }

                }else{
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                }
                // print("---------------uuuuuuuuuuuuu------------");
                // print(valur);
                // showInternetSnackbar(valur);
              });

//joinRoom();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 8, right: 8),
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
              child: Text(AppLocalizations.of(context).lblJoinToRoom,
                  style: TextStyle(
                      fontFamily: "black", color: Colors.white)),
            ),
          )
                    : new Container(
            // decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: SendBotton(chatId: widget.chatId,check: widget.check,room_model: widget.room_model,title: widget.title,),
          ),
                new Builder(builder: (BuildContext context) {
                  return new Container(
          // width: 10,
          // height: 10,
          // color: Colors.blue,
          );
                })
              ],
            ),
        ),
      ),
    );
  }

//   Widget getDefaultSendButton() {
//     print("-----------------------send button------------------------");
//     return  Container(
//  width: 40,
//               height: 40,
//               margin: EdgeInsets.only(right: 5,left: 5),
             
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(40),
//             child: Container(
//                color: Colors.white,
//               child: IconButton(
//               icon:  Icon(Icons.send, 
//               color: Colors.teal),
//               onPressed: //_isWritting
//                   //  ?
//                   () => _sendText(_textController.text)
//               //  : null,
//               ),
//             ),
//       ),
//     );
//   }

//   Widget _buildTextComposer() {
//     print("-------------------build text falid-------------------");
//     return
// //    return new IconTheme(
// //        data: new IconThemeData(
// //          color: _isWritting
// //              ? Colors.red//Theme.of(context).accentColor
// //              : Colors.red//Theme.of(context).disabledColor,
// //        ),
// //        child: new
//         Container(
//      // margin: const EdgeInsets.symmetric(horizontal: 8.0),
//     //  color: Colors.grey[800],
//    // color: Colors.transparent,
//       child: Row(
//         children: <Widget>[
//           Container(
//                width: 40,
//               height: 40,
//               margin: EdgeInsets.only(right: 5,left: 5),
//             child: ClipRRect(

//                 borderRadius: BorderRadius.circular(40),

//                         child: Container(
//                // margin: EdgeInsets.symmetric(horizontal: 4.0),
             
//                 color: Colors.white,
//                 child: IconButton(
//                       // icon: new Icon(
//                       //  Image.asset("name"),
//                       //   color:Colors.red// Theme.of(context).accentColor,
//                       // ),
//                       icon: Image.asset("assets/images/gallery.png"),
//                       onPressed: () async {
//                         var image =
//                             await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 1024,maxHeight: 683 ,imageQuality: 100);
//                       //  int timestamp = new DateTime.now().millisecondsSinceEpoch;
//                         // StorageReference storageReference = FirebaseStorage
//                         //     .instance
//                         //     .ref()
//                         //     .child('chats/img_' + timestamp.toString() + '.jpg');
//                         // StorageUploadTask uploadTask =
//                         // storageReference.putFile(image);
//                         // await uploadTask.onComplete;
//                         // String fileUrl = await storageReference.getDownloadURL();
//                         // String image = await api

//                         // _sendImage(messageText: null, imageUrl: fileUrl);
//                         print("attttttttttttttttttttttttttt");
//                          _dataUser
//                     .setKey({'key': "ff", 'value': true});
//                         apiRequests.AddImage(image).then((valur) {
//                           print("attttttttttttttttttttttttttt");
//                           print(valur);
//                           _sendImage(messageText: null, imageUrl: valur);
//                         });
//                       }),
//               ),
//             ),
//           ),
//           Container(
//              width: 40,
//               height: 40,
//               margin: EdgeInsets.only(right: 5,left: 5),
//                       child: ClipRRect(
//               borderRadius: BorderRadius.circular(40),
//                         child: Container(
//                // margin: EdgeInsets.symmetric(horizontal: 4.0),
//                color: Colors.white,
//                 child: IconButton(
//                     // icon: new Icon(
//                     //  Image.asset("name"),
//                     //   color:Colors.red// Theme.of(context).accentColor,
//                     // ),
//                     icon: Icon(
//                       Icons.camera_alt,
//                       color: Colors.black,
//                     ),
//                     onPressed: () async {
//                       var image =
//                           await ImagePicker.pickImage(source: ImageSource.camera,maxWidth: 1024,maxHeight: 683 ,imageQuality: 100);
//                       //int timestamp = new DateTime.now().millisecondsSinceEpoch;
//                       // StorageReference storageReference = FirebaseStorage
//                       //     .instance
//                       //     .ref()
//                       //     .child('chats/img_' + timestamp.toString() + '.jpg');
//                       // StorageUploadTask uploadTask =
//                       // storageReference.putFile(image);
//                       // await uploadTask.onComplete;
//                       // String fileUrl = await storageReference.getDownloadURL();
//                       // String image = await api

//                       // _sendImage(messageText: null, imageUrl: fileUrl);
//                       print("attttttttttttttttttttttttttt");
//                       apiRequests.AddImage(image).then((valur) {
//                         print("attttttttttttttttttttttttttt");
//                         print(valur);
//                         _sendImage(messageText: null, imageUrl: valur);
//                       });
//                     }),
//               ),
//             ),
//           ),
//            Container(
//              width: MediaQuery.of(context).size.width*.55,
//              margin: EdgeInsets.all(5),
           
//              alignment: Alignment.center,
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                borderRadius: BorderRadius.all(Radius.circular(25))
//              ),
//             //flex: 1,
//             child:  TextFormField(
              
//               controller: _textController,
//               onSaved: (val) {
//                 //setState(() {
//                 _textController.text = val;
//                 // });
//               },
//             //   validator: (val) {
//             //     if (val.length == 0) {
//             //       return "enter message";
//             //     }
//             //  // return "enter message";
//             //   },
//               // onChanged: (String messageText) {
//               //   setState(() {
//               //     _isWritting = messageText.length > 0;
//               //   });
//               // },
//               // onSubmitted: _sendText,

//               decoration:
//                   new InputDecoration.collapsed(
//                       hintStyle: TextStyle(
//                                     fontSize: 12,
//                                     fontFamily: "black",
//                                     color: Colors.grey[400]),
//                     hintText: "   Send a message"),
//             ),
//           ),
//            Container(
//             //margin: const EdgeInsets.symmetric(horizontal: 4.0),
//             child: getDefaultSendButton(),
//           ),
//         ],
//       ),
//     );
//     //);
//   }

//   Future<Null> _sendText(String text) async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       print("-------------------tiger------------------");
//       // if(_dataUser.getKey(Utility.Name)!=null && _dataUser.getKey(Utility.ID)!=null){
//   if(text.length>0){
//         print("--------------------send text---------------------------");
//       _textController.clear();
//       var now = new DateTime.now();
//       db
//           .collection("chats")
//           .document("Room_" + widget.room_model.staticId.toString())
//           .collection('messages')
//           .add({
//         'text': text,
//         'sender_id':
//             _dataUser.getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
//         'sender_name':
//             _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
//         'profile_photo':  _dataUser.getKey(Utility.ProfileImage),
//         'image_url': '',
//         'time': FieldValue.serverTimestamp(),
//         'send_time': now.hour.toString() + ":" + now.minute.toString()
//       }).then((documentReference) {
//         ApiRequests apiRequests = new ApiRequests();
//         apiRequests.sendnotifcation(widget.chatId, _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), text);
//         // setState(() {
//         //   _isWritting = false;
//         // });
//       }).catchError((e) {});
//   }else{
//     print("------------------empty text-------------------");
//   }
// //     }else{
// // print("enthodd text me");
// //     }
//     }
//   }

//   void _sendImage({String messageText, String imageUrl}) {
//     var now = new DateTime.now();
//     print("----------------send image------------------");
//     db
//         .collection("chats")
//         .document("Room_" + widget.room_model.staticId.toString())
//         .collection('messages')
//         .add({
//       'text': "",
//       'sender_id':
//           _dataUser.getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
//       'sender_name':
//           _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
//       'profile_photo':  _dataUser.getKey(Utility.ProfileImage),
//       'image_url': imageUrl,
//       'time': FieldValue.serverTimestamp(),
//       'send_time': now.hour.toString() + ":" + now.minute.toString()
//     }).then((value){
//         ApiRequests apiRequests = new ApiRequests();
//         apiRequests.sendnotifcation(widget.chatId, _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), "image");
//     });
//   }

  showInternetSnackbar(String message) {
    var snackbar = new SnackBar(
      action: new SnackBarAction(
          label: '',
          textColor: Colors.red,
          onPressed: () {
            // getRooms();
          }),
      content: new Text(message),
      duration: new Duration(seconds: 3),
      backgroundColor: Colors.black45,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
