// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mojtam3/model/models/mychatsModel.dart';
// import 'package:mojtam3/model/models/room.dart';
// import 'package:mojtam3/model/provider/dataUser.dart';
// import 'package:mojtam3/model/provider/gallary_page.dart';
// import 'package:mojtam3/screens/group_page.dart';
// import 'package:mojtam3/tabs_page.dart';
// import 'package:mojtam3/utillites/utillity_class.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ChatPagefrinds extends StatefulWidget {
//   final Chats chats;
 
//   ChatPagefrinds({this.chats});
//   @override
//   ChatPagefrindsState createState() {
//     return new ChatPagefrindsState();
//   }
// }

// class ChatPagefrindsState extends State<ChatPagefrinds> {
//   final db = Firestore.instance;
//   CollectionReference chatReference;
//   final TextEditingController _textController =
//   new TextEditingController();
//   DataUser _dataUser=DataUser.instance;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     print("-----------------------initla state------------------------");
//     chatReference =
//         db.collection("chats").document("chats_"+widget.chats.id.toString()).collection('messages');


//     print(_dataUser.getKey(Utility.TOKEN));
//     print(_dataUser.getKey(Utility.Imageurl));
//     print(_dataUser.getKey(Utility.ID));
   
    
//   }
  
//   @override
//   void dispose() {
//     super.dispose();
//     _textController.clear();
//     _textController.dispose();
//   }

//   List<Widget> generateSenderLayout(DocumentSnapshot documentSnapshot) {
//     print("-----------------------generate senderlayout------------------------");
//     return <Widget>[
//       new Expanded(
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             // new Text(documentSnapshot.data['sender_name'],
//             //     style: new TextStyle(
//             //         fontSize: 14.0,
//             //         color: Colors.black,
//             //         fontWeight: FontWeight.bold)),
//             new Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: documentSnapshot.data['image_url'] != ''
//                   ? InkWell(
//                 child: new Container(
//                   child:
//                   FadeInImage.assetNetwork(
//             height:40,
//             width: 40,
//             placeholder: "assets/soud.jpg",
//             image:documentSnapshot.data['image_url'],
//             fit:  BoxFit.fitWidth),
                  
//                   //  Image.network(
//                   //   documentSnapshot.data['image_url'],
//                   //   fit: BoxFit.fitWidth,
//                   // ),
//                   height: 150,
//                   width: 150.0,
//                   color: Color.fromRGBO(0, 0, 0, 0.2),
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => GalleryPage(
//                         imagePath: documentSnapshot.data['image_url'],
//                       ),
//                     ),
//                   );
//                 },
//               )
//                   : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                        new Text(documentSnapshot.data['send_time'],style: TextStyle(
//                          color: Colors.grey[500]
//                        )),
//                        Container(
//                         padding: EdgeInsets.all(8),
//                         margin: EdgeInsets.only(right: 8,left: 8),
//                           alignment: Alignment.centerLeft,
//                         width: MediaQuery.of(context).size.width*.8,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15.0),
//                               color: Colors.grey,
//                          ),
//                          child: new Text(documentSnapshot.data['text'],textAlign: TextAlign.center,)),
                     
                      
//                     ],
//                   ),
//             ),
//           ],
//         ),
//       ),
//       // new Column(
//       //   crossAxisAlignment: CrossAxisAlignment.end,
//       //   children: <Widget>[
//       //     new Container(
//       //         margin: const EdgeInsets.only(left: 8.0),
//       //         child: new CircleAvatar(
//       //           backgroundImage:
//       //           new NetworkImage(documentSnapshot.data['profile_photo']),
//       //         )),
//       //   ],
//       // ),
//     ];
//   }

//   List<Widget> generateReceiverLayout(DocumentSnapshot documentSnapshot) {
//     print("-----------------------generate reviverlayout------------------------");
//     return <Widget>[
//       new Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           new Container(
//               margin: const EdgeInsets.only(right: 8.0),
//               child: new CircleAvatar(
//                 backgroundImage:
//                 new NetworkImage(documentSnapshot.data['profile_photo']),
//               )),
//         ],
//       ),
//       new Expanded(
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // new Text(documentSnapshot.data['sender_name'],
//             //     style: new TextStyle(
//             //         fontSize: 14.0,
//             //         color: Colors.black,
//             //         fontWeight: FontWeight.bold)),
//             new Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: documentSnapshot.data['image_url'] != ''
//                   ? InkWell(
//                 child: new Container(
//                   child: Image.network(
//                     documentSnapshot.data['image_url'],
//                     fit: BoxFit.fitWidth,
//                   ),
//                   height: 150,
//                   width: 150.0,
//                   color: Color.fromRGBO(0, 0, 0, 0.2),
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => GalleryPage(
//                         imagePath: documentSnapshot.data['image_url'],
//                       ),
//                     ),
//                   );
//                 },
//               )
//                   : Row(
//                     children: <Widget>[
//                      Container(
//                         padding: EdgeInsets.all(8),
//                         margin: EdgeInsets.only(right: 8,left: 8),
//                         alignment: Alignment.centerRight,
//                         width: MediaQuery.of(context).size.width*.65,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15.0),
//                               color: Colors.teal[300],
//                          ),
//                          child: new Text(documentSnapshot.data['text'],textAlign: TextAlign.center,)),
//                        new Text(documentSnapshot.data['send_time'],style: TextStyle(
//                          color: Colors.grey[500]
//                        ),)
//                     ],
//                   ),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   generateMessages(AsyncSnapshot<QuerySnapshot> snapshot) {
//     print("-----------------------generate message------------------------");
//     return snapshot.data.documents
//         .map<Widget>((doc) => Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: new Row(
//         children: doc.data['sender_id'] != _dataUser.getKey(Utility.ID)//widget.prefs.getString('uid')
//             ? generateReceiverLayout(doc)
//             : generateSenderLayout(doc),
//       ),
//     ))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("mahmoud------------"+Utility.BaseURL+"------------------"+widget.room_model.userImage);
//     return Scaffold(
//       appBar:  PreferredSize(
//             preferredSize: Size.fromHeight(65),
//             child: AppBar(
//               leading: Container(),
//               flexibleSpace: Padding(
//                 padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 size: 30,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
//                                 return TabsPage();
//                               })),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) {
//                                       return GroupPage(null);//widget.room_model);
//                                     }));
//                               },
//                               child: ClipOval(
//                                 child:FadeInImage.assetNetwork(
//                                     height:40,
//                                     width: 40,
//                                     placeholder: "assets/soud.jpg",
//                                     image:Utility.BaseURL+widget.chats.userImage,
//                                     fit: BoxFit.fill),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Container(

//                               width: MediaQuery.of(context).size.width*.35,
//                               child: Text(
//                                 widget.
//                                 chats.description,overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: "thin",
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),

// Container(
//   width: MediaQuery.of(context).size.width*.3,

//   child:   Row(

//   mainAxisAlignment: MainAxisAlignment.end,

//     children: <Widget>[

//       Container(width: MediaQuery.of(context).size.width*.15,alignment: Alignment.centerLeft,
//         child: Text(

//          widget.room_model.userId.toString(),

//           overflow: TextOverflow.ellipsis,

//           style: TextStyle(fontSize: 14, color: Colors.white),

//         ),
//       ),

//       SizedBox(

//         width: 8,

//       ),

//       ClipOval(

//         child: FadeInImage.assetNetwork(
//             height:40,
//             width: 40,
//             placeholder: "assets/soud.jpg",
//             image:Utility.BaseURL+widget.room_model.userImage,
//             fit: BoxFit.fill),

//       ),

//     ],

//   ),
// ),



//                       ],
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       alignment: Alignment.center,
//                       child: Text(
//                         widget.room_model.description,overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             height: .8, fontSize: 12, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               backgroundColor: Colors.grey[800],

//               titleSpacing: 0.0,
//               //todo need to fix search how to max leading width
//             ),
//           ),
//       body: Form(
//        key: _formKey,
//               child: Container(
//           padding: EdgeInsets.all(5),
//           child: new Column(
//             children: <Widget>[
//              StreamBuilder<QuerySnapshot>(
//                stream: chatReference.orderBy('time',descending: true).snapshots(),
//                builder: (BuildContext context,
//                    AsyncSnapshot<QuerySnapshot> snapshot) {
//                      print("----------------- befor stream --------------");
//                  try{ if (!snapshot.hasData) return new Text("No Chat");
//                  return Expanded(
//                    child: new ListView(
//                      reverse: true,
//                      children: generateMessages(snapshot),
//                    ),
//                  );}catch(e){


//                    print("---------------------error---------------------");
//                    print(e);

//                  return Container(
//                    height: 10,
//                    width: 10,
//                    color: Colors.red,
//                  );
//                  }

//                },
//              ),
//               new Divider(height: 1.0),
//               new Container(
//                // decoration: new BoxDecoration(color: Theme.of(context).cardColor),
//                 child: _buildTextComposer(),
//               ),
//               new Builder(builder: (BuildContext context) {
//                 return new Container(width:10, height:10,color: Colors.blue,);
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   IconButton getDefaultSendButton() {
//     print("-----------------------send button------------------------");
//     return new IconButton(
//       icon: new Icon(Icons.send, color:Colors.teal),
//       onPressed: //_isWritting
//         //  ? 
//           () => _sendText(_textController.text)
//         //  : null,
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
//           margin: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: new Row(
//             children: <Widget>[
//               new Container(
//                 margin: new EdgeInsets.symmetric(horizontal: 4.0),
//                 child: new IconButton(
//                     icon: new Icon(
//                       Icons.photo_camera,
//                       color:Colors.red// Theme.of(context).accentColor,
//                     ),
//                     onPressed: () async {
//                       var image = await ImagePicker.pickImage(
//                           source: ImageSource.gallery);
//                       int timestamp = new DateTime.now().millisecondsSinceEpoch;
//                       StorageReference storageReference = FirebaseStorage
//                           .instance
//                           .ref()
//                           .child('chats/img_' + timestamp.toString() + '.jpg');
//                       StorageUploadTask uploadTask =
//                       storageReference.putFile(image);
//                       await uploadTask.onComplete;
//                       String fileUrl = await storageReference.getDownloadURL();
//                       _sendImage(messageText: null, imageUrl: fileUrl);
//                     }),
//               ),
//               new Flexible(
//                 child: new TextFormField(
//                   controller: _textController,
// onSaved: (val){
//   //setState(() {
//      _textController.text=val;
//  // });
 

// },
// validator: (val){
// if(val.length==0){
//   return "enter message";
// }
// },
//                   // onChanged: (String messageText) {
//                   //   setState(() {
//                   //     _isWritting = messageText.length > 0;
//                   //   });
//                   // },
//                   // onSubmitted: _sendText,
                  
//                   decoration:
//                   new InputDecoration.collapsed(hintText: "Send a message"),
//                 ),
//               ),
//               new Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                 child: getDefaultSendButton(),
//               ),
//             ],
//           ),
//         );
//     //);
//   }

//   Future<Null> _sendText(String text) async {
   
//  if(_formKey.currentState.validate()){
//     _formKey.currentState.save();
//     print("-------------------tiger------------------");
//     if(_dataUser.getKey(Utility.Name)!=null && _dataUser.getKey(Utility.ID)!=null){
//     print("--------------------send text---------------------------");
//     _textController.clear();
//     var now = new DateTime.now();
//     chatReference.add({
//       'text': text,
//      'sender_id':_dataUser.getKey(Utility.ID),//widget.prefs.getString('uid'),
//       'sender_name': _dataUser.getKey(Utility.Name),//widget.prefs.getString('name'),
//       'profile_photo':Utility.BaseURL+_dataUser.getKey(Utility.Imageurl),
//       'image_url': '',
//       'time': FieldValue.serverTimestamp(),
//       'send_time':now.hour.toString()+":"+now.minute.toString()
//     }).then((documentReference) {
//       // setState(() {
//       //   _isWritting = false;
//       // });
//     }).catchError((e) {});
//     }else{
// print("enthodd text me");
//     }
//  }
    
    
//   }

//   void _sendImage({String messageText, String imageUrl}) {
//     var now = new DateTime.now();
//     print("----------------send image------------------");
//     chatReference.add({
//       'text': messageText,
//       'sender_id':_dataUser.getKey(Utility.ID),//widget.prefs.getString('uid'),
//       'sender_name': _dataUser.getKey(Utility.Name),//widget.prefs.getString('name'),
//       'profile_photo':Utility.BaseURL+_dataUser.getKey(Utility.Imageurl),
//       'image_url': imageUrl,
//       'time': FieldValue.serverTimestamp(),
//       'send_time':now.hour.toString()+":"+now.minute.toString()
//     });
//   }
// }
