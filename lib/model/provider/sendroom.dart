import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/model/models/room.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:path/path.dart' as p;

class SendBotton extends StatefulWidget {
    final String chatId;
  final String title;
  final Room_Model room_model;
  final int check;
  SendBotton({this.chatId, this.title, this.room_model, this.check});
  @override
  _SendBottonState createState() => _SendBottonState();
}

class _SendBottonState extends State<SendBotton> {
  ApiRequests apiRequests = new ApiRequests();
   DataUser _dataUser = DataUser.instance;
     final TextEditingController _textController = new TextEditingController();
  final db = Firestore.instance;
    final _formKey = GlobalKey<FormState>();
    bool _isWritting=false;
      Recording _recording;
  bool _isRecording = false;
  bool _doQuerySave = false; 
    String tempFilename = "TempRecording";
    
  CollectionReference chatReference; //Filename without path or extension
  File defaultAudioFile;

   @override
  void dispose() {
    super.dispose();
    _textController.clear();
    _textController.dispose();
    
  }
  @override
  void initState() {
 chatReference=   db
          .collection("chats")
          .document("Room_" + widget.room_model.staticId.toString())
          .collection('messages');
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
          child: Container(
       // margin: const EdgeInsets.symmetric(horizontal: 8.0),
      //  color: Colors.grey[800],
   // color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Container(
                 width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 5,left: 5),
              child: ClipRRect(

                  borderRadius: BorderRadius.circular(40),

                          child: Container(
                 // margin: EdgeInsets.symmetric(horizontal: 4.0),
               
                  color: Colors.white,
                  child: IconButton(
                        // icon: new Icon(
                        //  Image.asset("name"),
                        //   color:Colors.red// Theme.of(context).accentColor,
                        // ),
                        icon: Image.asset("assets/images/gallery.png"),
                        onPressed: () async {
                          var image =
                              await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 1024,maxHeight: 683 ,imageQuality: 100);
                        //  int timestamp = new DateTime.now().millisecondsSinceEpoch;
                          // StorageReference storageReference = FirebaseStorage
                          //     .instance
                          //     .ref()
                          //     .child('chats/img_' + timestamp.toString() + '.jpg');
                          // StorageUploadTask uploadTask =
                          // storageReference.putFile(image);
                          // await uploadTask.onComplete;
                          // String fileUrl = await storageReference.getDownloadURL();
                          // String image = await api

                          // _sendImage(messageText: null, imageUrl: fileUrl);
                          print("attttttttttttttttttttttttttt");
                           _dataUser
                      .setKey({'key': "ff", 'value': true});
                          apiRequests.AddImage(image).then((valur) {
                            print("attttttttttttttttttttttttttt");
                            print(valur);
                            _sendImage(messageText: null, imageUrl: valur);
                          });
                        }),
                ),
              ),
            ),
            Container(
               width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 5,left: 5),
                        child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                          child: Container(
                 // margin: EdgeInsets.symmetric(horizontal: 4.0),
                 color: Colors.white,
                  child: IconButton(
                      // icon: new Icon(
                      //  Image.asset("name"),
                      //   color:Colors.red// Theme.of(context).accentColor,
                      // ),
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        var image =
                            await ImagePicker.pickImage(source: ImageSource.camera,maxWidth: 1024,maxHeight: 683 ,imageQuality: 100);
                        //int timestamp = new DateTime.now().millisecondsSinceEpoch;
                        // StorageReference storageReference = FirebaseStorage
                        //     .instance
                        //     .ref()
                        //     .child('chats/img_' + timestamp.toString() + '.jpg');
                        // StorageUploadTask uploadTask =
                        // storageReference.putFile(image);
                        // await uploadTask.onComplete;
                        // String fileUrl = await storageReference.getDownloadURL();
                        // String image = await api

                        // _sendImage(messageText: null, imageUrl: fileUrl);
                        print("attttttttttttttttttttttttttt");
                        apiRequests.AddImage(image).then((valur) {
                          print("attttttttttttttttttttttttttt");
                          print(valur);
                          _sendImage(messageText: null, imageUrl: valur);
                        });
                      }),
                ),
              ),
            ),
             Container(
               width: MediaQuery.of(context).size.width*.55,
               margin: EdgeInsets.all(5),
             
               alignment: Alignment.center,
               decoration: BoxDecoration(
                   color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(25))
               ),
              //flex: 1,
              child:  TextFormField(
                
                controller: _textController,
                onSaved: (val) {
                  //setState(() {
                  _textController.text = val;
                  // });
                },
                validator: (val) {
                  if (val.length == 0) {
                    return "enter message";
                  }
               // return "enter message";
                },
                onChanged: (String messageText) {
                  setState(() {
                    _isWritting = messageText.length > 0;
                  });
                },
                // onSubmitted: _sendText,

                decoration:
                    new InputDecoration.collapsed(
                        hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "black",
                                      color: Colors.grey[400]),
                      hintText: "   Send a message"),
              ),
            ),
             Container(
              //margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child:  _isWritting ?getDefaultSendButton():getDefaultSendButtonvoice(),
            ),
          ],
        ),
      ),
    );
  }
    Widget getDefaultSendButton() {
    print("-----------------------send button------------------------");
    return  Container(
 width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 5,left: 5),
             
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
            child: Container(
               color: Colors.white,
              child: IconButton(
              icon:  Icon(Icons.send, 
              color: Colors.teal),
              onPressed: //_isWritting
                  //  ?
                  () => _sendText(_textController.text)
              //  : null,
              ),
            ),
      ),
    );
  }
     Widget getDefaultSendButtonvoice() {
    print("-----------------------send button------------------------");
    return  Container(
 width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 5,left: 5),
             
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
            child: Container(
               color: Colors.white,
              child: IconButton(
              icon:   _isRecording
                                ? new Icon(Icons.stop, color: Colors.teal,)
                                : new Icon(Icons.mic, color: Colors.teal,),
             //_isWritting
                  //  ?
                  onPressed: _isRecording ? stopRecording : startRecording,
              //  : null,
              ),
            ),
      ),
    );
  }
    stopRecording() async {
    // Await return of Recording object
    var recording = await AudioRecorder.stop();
    bool isRecording = await AudioRecorder.isRecording;

    //final storage = SharedAudioContext.of(context).storage;
    //Directory docDir = await storage.docDir;
    Directory docDir = await getApplicationDocumentsDirectory();

    setState(() {
      //Tells flutter to rerun the build method
      _isRecording = isRecording;
      _doQuerySave = true;
      defaultAudioFile = File(p.join(docDir.path, this.tempFilename+'.m4a'));
    } );
           apiRequests.AddImage(defaultAudioFile).then((valur) {
                            print("attttttttttttttttttttttttttt");
                            print(valur);
                            _sendvoice(messageText: null, voiceUrl: valur);
                          });

  }
  startRecording() async {
    print("start record");
  try {
      //final storage = SharedAudioContext.of(context).storage;
      //Directory docDir = await storage.docDir;
      Directory docDir = await getApplicationDocumentsDirectory();
      String newFilePath = p.join(docDir.path, this.tempFilename);
      File tempAudioFile = File(newFilePath+'.m4a');
      // Scaffold
      //     .of(context)
      //     .showSnackBar(new SnackBar(content: new Text("Recording."),
      //                                duration: Duration(milliseconds: 1400), ));
         Toast.show("Recording.", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      if (await tempAudioFile.exists()){
        await tempAudioFile.delete();
      }
      if (await AudioRecorder.hasPermissions) {
        await AudioRecorder.start(
            path: newFilePath, audioOutputFormat: AudioOutputFormat.AAC);
      } else {
        // Scaffold.of(context).showSnackBar(new SnackBar(
        //     content: new Text("Error! Audio recorder lacks permissions.")));
            Toast.show("Error! Audio recorder lacks permissions.", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
      bool isRecording = await AudioRecorder.isRecording;
      setState(() {
        //Tells flutter to rerun the build method
        _recording = new Recording(duration: new Duration(), path: newFilePath);
        _isRecording = isRecording;
        defaultAudioFile = tempAudioFile;
      });
    } catch (e) {
      print(e);
    }
  }
    Future<Null> _sendText(String text) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("-------------------tiger------------------");
      // if(_dataUser.getKey(Utility.Name)!=null && _dataUser.getKey(Utility.ID)!=null){
  if(text.length>0){
        print("--------------------send text---------------------------");
      _textController.clear();
      var now = new DateTime.now();
      chatReference
          .add({
        'text': text,
        'sender_id':
            _dataUser.getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
        'sender_name':
            _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
        'profile_photo':  _dataUser.getKey(Utility.ProfileImage),
        'image_url': '',
          'voice_url':'',
        'time': FieldValue.serverTimestamp(),
        'send_time': now.hour.toString() + ":" + now.minute.toString()
      }).then((documentReference) {
        ApiRequests apiRequests = new ApiRequests();
        apiRequests.sendnotifcation(widget.chatId, _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), text);
        // setState(() {
        //   _isWritting = false;
        // });
      }).catchError((e) {});
  }else{
    print("------------------empty text-------------------");
  }
//     }else{
// print("enthodd text me");
//     }
    }
  }
   void _sendvoice({String messageText, String voiceUrl}) {
    var now = new DateTime.now();
    print("----------------send image------------------");
    chatReference
        .add({
      'text': "",
      'sender_id':
          _dataUser.getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
      'sender_name':
          _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
      'profile_photo':  _dataUser.getKey(Utility.ProfileImage),
      'image_url': "",
      'voice_url':voiceUrl,
      'time': FieldValue.serverTimestamp(),
      'send_time': now.hour.toString() + ":" + now.minute.toString()
    }).then((value){
        ApiRequests apiRequests = new ApiRequests();
        apiRequests.sendnotifcation(widget.chatId, _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), "image");
    });
  }
  void _sendImage({String messageText, String imageUrl}) {
    var now = new DateTime.now();
    print("----------------send image------------------");
    chatReference
        .add({
      'text': "",
      'sender_id':
          _dataUser.getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
      'sender_name':
          _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
      'profile_photo':  _dataUser.getKey(Utility.ProfileImage),
      'image_url': imageUrl,
        'voice_url':"",
      'time': FieldValue.serverTimestamp(),
      'send_time': now.hour.toString() + ":" + now.minute.toString()
    }).then((value){
        ApiRequests apiRequests = new ApiRequests();
        apiRequests.sendnotifcation(widget.chatId, _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), "image");
    });
  }
}