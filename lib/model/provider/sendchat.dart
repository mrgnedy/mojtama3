
import 'dart:io';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/model/models/mychatsModel.dart';

import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:toast/toast.dart';
import 'package:path/path.dart' as pp;
import 'package:path_provider/path_provider.dart';

class Sevndbottomchat extends StatefulWidget {
    final Chats chat;
  Sevndbottomchat({this.chat});
  @override
  _SevndbottomchatState createState() => _SevndbottomchatState();
}

class _SevndbottomchatState extends State<Sevndbottomchat> {
  final db = Firestore.instance;
  CollectionReference chatReference;
  final TextEditingController _textController = new TextEditingController();
  DataUser _dataUser = DataUser.instance;
  final _formKey = GlobalKey<FormState>();
  ApiRequests apiRequests = new ApiRequests();
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _islouding = false;
      bool _isWritting=false;
      Recording _recording;
  bool _isRecording = false;
  bool _doQuerySave = false; 
    String tempFilename = "TempRecording"; //Filename without path or extension
  File defaultAudioFile;
@override
  void initState() {
    super.initState();
    print("-----------------------initla state------------------------");
    chatReference = db
        .collection("chats")
        .document("Chat_" + widget.chat.id.toString())
        .collection('messages');

    print(_dataUser.getKey(Utility.TOKEN));
    print(_dataUser.getKey(Utility.Imageurl));
    print(_dataUser.getKey(Utility.ID));
  }
  
  @override
  void dispose() {
    super.dispose();
    _textController.clear();
    _textController.dispose();
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
              child:   _isWritting ?getDefaultSendButton():getDefaultSendButtonvoice(),
            ),
          ],
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
                                ? new Icon(Icons.stop,color: Colors.teal,)
                                : new Icon(Icons.mic,color: Colors.teal,),
             //_isWritting
                  //  ?
                  onPressed: _isRecording ? stopRecording : startRecording,
              //  : null,
              ),
            ),
      ),
    );
  }




  startRecording() async {
    print("start record");
  try {
      //final storage = SharedAudioContext.of(context).storage;
      //Directory docDir = await storage.docDir;
      Directory docDir = await getApplicationDocumentsDirectory();
      print("--------------------------reeeeeeeeeee");
      print(docDir);
      String newFilePath = pp.join(docDir.path, this.tempFilename);
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
          defaultAudioFile = File(pp.join(docDir.path, this.tempFilename+'.m4a'));
        } );
               apiRequests.AddImage(defaultAudioFile).then((valur) {
                                print("attttttttttttttttttttttttttt");
                                print(valur);
                                _sendvoice(messageText: null, voiceUrl: valur);
                              });
    
      }
        Future<Null> _sendText(String text) async {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          print("-------------------tiger------------------");
          // if(_dataUser.getKey(Utility.Name)!=null && _dataUser.getKey(Utility.ID)!=null){
          print("--------------------send text---------------------------");
          _textController.clear();
          var now = new DateTime.now();
          chatReference.add({
            'text': text,
            'sender_id':
               _dataUser
                                .getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
            'sender_name':
                _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
            'profile_photo':  _dataUser.getKey(Utility.ProfileImage),
            'image_url': '',
            "voice_url":"",
            'time': FieldValue.serverTimestamp(),
            'send_time': now.hour.toString() + ":" + now.minute.toString()
          }).then((documentReference) {
            ApiRequests apiRequests = new ApiRequests();
            apiRequests.sendnotifcationfriend(widget.chat.userId.toString()==_dataUser.getKey(Utility.ID).toString()?widget.chat.ownerId.toString(): widget.chat.userId.toString(), _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), text);
            // setState(() {
            //   _isWritting = false;
            // });
          }).catchError((e) {});
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
      apiRequests.sendnotifcationfriend(widget.chat.userId.toString()==_dataUser.getKey(Utility.ID).toString()?widget.chat.ownerId.toString(): widget.chat.userId.toString(), _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), "voice");
    });
  }



       void _sendImage({String messageText, String imageUrl}) {
        var now = new DateTime.now();
        print("----------------send image------------------");
        print(_dataUser.getKey(Utility.ProfileImage));
        chatReference.add({
          'text': messageText,
          'sender_id':
              _dataUser
                                .getKey(Utility.TOKEN), //widget.prefs.getString('uid'),
          'sender_name':
              _dataUser.getKey(Utility.Name), //widget.prefs.getString('name'),
          'profile_photo': _dataUser.getKey(Utility.ProfileImage),
          'image_url': imageUrl,
          'time': FieldValue.serverTimestamp(),
          "voice_url":"",
          'send_time': now.hour.toString() + ":" + now.minute.toString()
        }).then((documentReference) {
            ApiRequests apiRequests = new ApiRequests();
            apiRequests.sendnotifcationfriend(widget.chat.userId.toString()==_dataUser.getKey(Utility.ID).toString()?widget.chat.ownerId.toString(): widget.chat.userId.toString(), _dataUser.getKey(Utility.ID), _dataUser.getKey(Utility.Name), "image");
            // setState(() {
            //   _isWritting = false;
            // });
          });
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
    
      
}