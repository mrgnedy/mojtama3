import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'package:mojtam3/model/models/room.dart';

import 'package:mojtam3/utillites/utillity_class.dart';


class GroupChatPage extends StatefulWidget {
  Room_Model room_model;
  GroupChatPage(this.room_model);

  @override
  _GroupChatPageState createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {

  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': "engy",
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('group').document("1").collection("message").add(
//          {
//            'Text': messageController.text,
//            'SenderId': "mahmoud",
//            'Type':"text",
//            'Date': DateTime.now().toIso8601String().toString(),
//            'Color':"red",
//            'ReciverId':"kaream",
//            'SenderImage':'Image',
//
//          }
//      );
//      print("-------------send to fire base---------------");
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }

  @override
  Widget build(BuildContext context) {
    print("-------------------------chat room----------------------");
    print(Utility.BaseURL+widget.room_model.image);
    print(Utility.BaseURL+widget.room_model.userImage);
    return Scaffold(
      appBar: AppBar(

        title: Text("katab"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
//              _auth.signOut();
             // Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('date')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  List<DocumentSnapshot> docs = snapshot.data.documents;

                  List<Widget> messages = docs
                      .map((doc) => Message(
                    from: doc.data['from'],
                    text: doc.data['text'],
                    me: "engy" == doc.data['from'],
                  ))
                      .toList();

                  return ListView(
                    controller: scrollController,
                    children: <Widget>[
                      ...messages,
                    ],
                  );
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => callback(),
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        border: const OutlineInputBorder(),
                      ),
                      controller: messageController,
                    ),
                  ),
                  SendButton(
                    text: "Send",
                    callback: callback,
                  )
                ],
              ),
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//
//
////            Expanded(
////              child: StreamBuilder<QuerySnapshot>(
////                stream: _firestore
////                    .collection('group').document('1').collection("message")
////                    .orderBy('Date')
////                    .snapshots(),
////                builder: (context, snapshot) {
////                  if (!snapshot.hasData)
////                    return Center(
////                      child: CircularProgressIndicator(),
////                    );
////print("-------------------------------------------------------listen--------------------");
////                  List<DocumentSnapshot> docs = snapshot.data.documents;
////
////                  List<Widget> messages = docs
////                      .map((doc) => Message(
////                    from: doc.data['SenderId'],
////                    text: doc.data['Text'],
////                    me: "mahmoud" == doc.data['SenderId'],
////                    type: doc.data['Type'],
////                    date: doc.data['Date'],
////                    senderImage: doc.data['SenderImage'],
////                  ))
////                      .toList();
////
////                  return ListView(
////                    controller: scrollController,
////                    children: messages,
////                  );
////                },
////              ),
////            ),
////            Container(
////              child: Row(
////                children: <Widget>[
////                  Expanded(
////                    child: TextField(
////                      onSubmitted: (value) => callback(),
////                      decoration: InputDecoration(
////                        hintText: "Enter a Message...",
////                        border: const OutlineInputBorder(),
////                      ),
////                      controller: messageController,
////                    ),
////                  ),
////                  SendButton(
////                    text: "Send",
////                    callback: callback,
////                  )
////                ],
////              ),
////            ),
          ],
        ),
      ),
    );
  }


//  var _textController = TextEditingController();
//  File _fileImage;
//
//  bool isShowSticker=false;
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    _textController.dispose();
//    super.dispose();
//  }
//
//  @override
//  void initState() {
//    super.initState();
////    _textController.addListener(() {
////      //here you have the changes of your textfield
////      print("value: ${_textController.text}");
////      //use setState to rebuild the widget
////      setState(() {});
////    });
//    isShowSticker = false;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
//    double px = 1 / pixelRatio;
//
//
//
//
//
//
//
//        return Scaffold(
//          appBar: PreferredSize(
//            preferredSize: Size.fromHeight(65),
//            child: AppBar(
//              leading: Container(),
//              flexibleSpace: Padding(
//                padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Row(
//                          children: <Widget>[
//                            IconButton(
//                              icon: Icon(
//                                Icons.arrow_back,
//                                size: 30,
//                                color: Colors.white,
//                              ),
//                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
//                                return TabsPage();
//                              })),
//                            ),
//                            GestureDetector(
//                              onTap: () {
//                                Navigator.push(context,
//                                    MaterialPageRoute(builder: (context) {
//                                      return GroupPage(widget.room_model);
//                                    }));
//                              },
//                              child: ClipOval(
//                                child:FadeInImage.assetNetwork(
//                                    height:40,
//                                    width: 40,
//                                    placeholder: "assets/images/reload2.gif",
//                                    image:Utility.BaseURL+widget.room_model.image,
//                                    fit: BoxFit.fill),
//                              ),
//                            ),
//                            SizedBox(
//                              width: 8,
//                            ),
//                            Container(
//
//                              width: MediaQuery.of(context).size.width*.35,
//                              child: Text(
//                                widget.room_model.roomName,overflow: TextOverflow.ellipsis,
//                                style: TextStyle(
//                                    fontSize: 16,
//                                    fontFamily: "thin",
//                                    color: Colors.white),
//                              ),
//                            ),
//                          ],
//                        ),
//
//Container(
//  width: MediaQuery.of(context).size.width*.3,
//
//  child:   Row(
//
//  mainAxisAlignment: MainAxisAlignment.end,
//
//    children: <Widget>[
//
//      Container(width: MediaQuery.of(context).size.width*.15,alignment: Alignment.centerLeft,
//        child: Text(
//
//         widget.room_model.userId.toString(),
//
//          overflow: TextOverflow.ellipsis,
//
//          style: TextStyle(fontSize: 14, color: Colors.white),
//
//        ),
//      ),
//
//      SizedBox(
//
//        width: 8,
//
//      ),
//
//      ClipOval(
//
//        child: FadeInImage.assetNetwork(
//            height:40,
//            width: 40,
//            placeholder: "assets/images/reload2.gif",
//            image:Utility.BaseURL+widget.room_model.userImage,
//            fit: BoxFit.fill),
//
//      ),
//
//    ],
//
//  ),
//),
//
//
//
//                      ],
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width,
//                      alignment: Alignment.center,
//                      child: Text(
//                        widget.room_model.description,overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                            height: .8, fontSize: 12, color: Colors.white),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              backgroundColor: Colors.grey[800],
//
//              titleSpacing: 0.0,
//              //todo need to fix search how to max leading width
//            ),
//          ),
//          body: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Bubble(
//                alignment: Alignment.center,
//                color: Color.fromARGB(255, 212, 234, 244),
//                elevation: 1 * px,
//                margin: BubbleEdges.only(top: 8.0),
//                child: Text('TODAY', style: TextStyle(fontSize: 10)),
//              ),
//              Expanded(
//                child: ListView.builder(
//                    itemCount: 100,
//                    itemBuilder: (BuildContext contect, index) {
//                      ///if user
//                      if (index % 2 == 0) {
//                        ///----------------user------------------
//                        return Row(
//                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            ClipOval(
//                                child: Image.asset(
//                                  "assets/images/profile.jpg",
//                                  height: 40,
//                                  width: 40,
//                                  fit: BoxFit.cover,
//                                )),
//                            Expanded(
//                              child: Container(
//                                ///-------------------me----------------------
//
//                                //width: MediaQuery.of(context).size.width*.7,
//                                margin: EdgeInsets.only(top:8,bottom: 8,right: 8,left: 8),
//                                alignment: Alignment.centerLeft,
//                                padding: EdgeInsets.all(8),
//                                child: Text("here you put yuuhuihu ijiojioj iojoiojiojioj iojoikjnkjnkjnjioj oijoijur message as me",textAlign: TextAlign.right,style: TextStyle(
//                                    fontFamily: "thin",
//                                    fontSize: 14,
//                                    height: 1.5
//                                ),),
//                                decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(20),
//                                    color: Colors.blue
//                                ),
//                              ),
//                            ),
//                          ],
//                        );
//                      } else {
//                        return Container(
//                          ///-------------------me----------------------
//
//                          //width: MediaQuery.of(context).size.width*.7,
//                          alignment: Alignment.centerLeft,
//                          margin: EdgeInsets.only(right: 20),
//                          padding: EdgeInsets.all(8),
//                          child: Text("here you put your kjnnknk jnkj nknkj nkj jkm  jnkj nknkj nkj jkm essage as me",textAlign: TextAlign.left,style: TextStyle(
//                              fontFamily: "thin",
//                              fontSize: 14,
//                              height: 1.5
//                          ),),
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(20),
//                              color: Colors.grey[700]
//                          ),
//                        );
//                      }
//                    }),
//              ),
//              SizedBox(
//                height: 12,
//              ),
//              Material(
//                elevation: 5,
//                child: Container(
//                  // color: Colors.blue,
//                  height: 60,
//
//                  padding:
//                  EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
//
//                  // alignment: Alignment.center,
//                  // color: Colors.red,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          //  width: MediaQuery.of(context).size.width -100,
//                          height: 50,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(30),
//                            color: Colors.grey[300],
//                          ),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              GestureDetector(
//                                onTap: () {
//                                  setState(() {
//                                    isShowSticker = !isShowSticker;
//                                  });
//                                },
//                                child: Image.asset(
//                                  "assets/images/smile.png",
//                                  height: 40,
//                                  width: 40,
//                                ),
//                              ),
//                              Expanded(
//                                child: TextFormField(
//                                  cursorColor: Colors.grey,
//                                  style: TextStyle(
//                                    fontSize: 20,
//                                  ),
//                                  textAlign: TextAlign.center,
//                                  keyboardType: TextInputType.text,
//                                  controller: _textController,
//                                  decoration: InputDecoration.collapsed(
//                                    hintStyle: TextStyle(
//                                        fontSize: 14, fontFamily: "black"),
//                                    hintText: "اكتب الرساله ...",
//                                  ),
//                                ),
//                              ),
//                              GestureDetector(
//                                onTap: () {
//                                  _onButtomPressed();
//                                },
//                                child: Image.asset(
//                                  "assets/images/link.png",
//                                  height: 40,
//                                  width: 40,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                      ClipOval(
//                        //padding: EdgeInsets.only(top: 8, bottom: 8),
//                          child: Image.asset(
//                            "assets/images/send.png",
//                            width: 45,
//                            height: 45,
//                            fit: BoxFit.cover,
//                          )),
//                    ],
//                  ),
//                ),
//              ),
//              (isShowSticker ? buildSticker() : Container()),
//            ],
//          ),
//        );
//
//
//
//  }
//
//  Future _Pick_Image(ImageSource source) async {
//    File image = await ImagePicker.pickImage(source: source);
//
//    setState(() {
//      _fileImage = image;
//      print(_fileImage.path + "hhhhhhhhhhhhhhhh");
//    });
//  }
//
//  Future _cropImage(ImageSource source) async {
//    File image = await ImagePicker.pickImage(source: source);
//    File Croped = await ImageCropper.cropImage(
//        sourcePath: image.path,
//        aspectRatioPresets: [
//          CropAspectRatioPreset.square,
//          CropAspectRatioPreset.ratio3x2,
//          CropAspectRatioPreset.original,
//          CropAspectRatioPreset.ratio4x3,
//          CropAspectRatioPreset.ratio16x9
//        ],
//        androidUiSettings: AndroidUiSettings(
//            toolbarTitle: 'Croppe IT',
//            toolbarColor: Colors.grey,
//            toolbarWidgetColor: Colors.white,
//            initAspectRatio: CropAspectRatioPreset.original,
//            lockAspectRatio: false),
//        iosUiSettings: IOSUiSettings(
//          minimumAspectRatio: 1.0,
//        ));
//
//    setState(() {
//      _fileImage = Croped;
//    });
//    show_dialog(_fileImage);
//  }
//
//  void show_dialog(File fileImage) {
//    print("mauisdhgsakjfuidshfsduuifhsdfiuh");
//    Dialog errorDialog = Dialog(
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//      //this right here
//      child: Container(
//        height: MediaQuery.of(context).size.height / 3,
//        width: MediaQuery.of(context).size.width / 1.5,
//        child: ListView(
//          children: <Widget>[
//            Container(
//                height: MediaQuery.of(context).size.height / 3 - 50,
//                width: 150,
//                child: Image.file(
//                  fileImage,
//                  fit: BoxFit.fill,
//                )),
//            Row(
//              children: <Widget>[
//                GestureDetector(
//                    onTap: () {
//                      Navigator.of(context).pop();
//                    },
//                    child: Text("ok")),
//                GestureDetector(
//                    onTap: () {
//                      Navigator.of(context).pop();
//                    },
//                    child: Text("Cancel")),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//    showDialog(
//        context: context, builder: (BuildContext context) => errorDialog);
//  }
//
//  void _onButtomPressed() {
//    showModalBottomSheet(
//        context: context,
//        backgroundColor: Colors.transparent,
//        builder: (context) {
//          return Container(
//            height: MediaQuery.of(context).size.height / 3,
//            alignment: Alignment.center,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                Container(
//                    child: Image.asset(
//                  "assets/gallery.jpg",
//                  width: MediaQuery.of(context).size.width / 3,
//                  fit: BoxFit.fill,
//                )),
//                Image.asset(
//                  "assets/camera.jpg",
//                  width: MediaQuery.of(context).size.width / 3,
//                  fit: BoxFit.fill,
//                ),
//              ],
//            ),
//            decoration: BoxDecoration(
//                color: Colors.teal,
//                borderRadius: new BorderRadius.only(
//                    topLeft: const Radius.circular(15),
//                    topRight: const Radius.circular(15))),
//          );
//        });
//  }
//
//  Widget buildSticker() {
//    return EmojiPicker(
//      rows: 3,
//      columns: 7,
//      buttonMode: ButtonMode.MATERIAL,
//      recommendKeywords: ["racing", "horse"],
//      numRecommended: 10,
//      onEmojiSelected: (emoji, category) {
//        _textController.text = emoji.emoji + _textController.text;
//        print(emoji);
//      },
//    );
//  }
}


class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange,
      onPressed: callback,
      child: Text(text),
    );
  }
}
class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
        me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}
//class Message extends StatelessWidget {
//  final String from;
//  final String text;
//  final String type;
//  final String date;
//  final String senderImage;
//
//
//  final bool me;
//
//  const Message({Key key, this.from, this.text, this.me,this.type,this.date,this.senderImage}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    print("--------------------------call back method------------------------------");
//    return Container(
//      child: Column(
//        crossAxisAlignment:
//        me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//        children: <Widget>[
//          Text(
//            from,
//          ),
//          Material(
//            color: me ? Colors.teal : Colors.red,
//            borderRadius: BorderRadius.circular(10.0),
//            elevation: 6.0,
//            child: Container(
//              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//              child: Text(
//                text,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
// _cropImage(ImageSource.camera);
