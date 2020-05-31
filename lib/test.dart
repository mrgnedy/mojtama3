//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_chat_app/pages/gallary_page.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class ChatPage extends StatefulWidget {
//  final SharedPreferences prefs;
//  final String chatId;
//  final String title;
//  ChatPage({this.prefs, this.chatId,this.title});
//  @override
//  ChatPageState createState() {
//    return new ChatPageState();
//  }
//}
//
//class ChatPageState extends State<ChatPage> {
//  final db = Firestore.instance;
//  CollectionReference chatReference;
//  final TextEditingController _textController =
//  new TextEditingController();
//  bool _isWritting = false;
//
//  @override
//  void initState() {
//    super.initState();
//    chatReference =
//        db.collection("chats").document(widget.chatId).collection('messages');
//  }
//
//  List<Widget> generateSenderLayout(DocumentSnapshot documentSnapshot) {
//    return <Widget>[
//      new Expanded(
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children: <Widget>[
//            new Text(documentSnapshot.data['sender_name'],
//                style: new TextStyle(
//                    fontSize: 14.0,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold)),
//            new Container(
//              margin: const EdgeInsets.only(top: 5.0),
//              child: documentSnapshot.data['image_url'] != ''
//                  ? InkWell(
//                child: new Container(
//                  child: Image.network(
//                    documentSnapshot.data['image_url'],
//                    fit: BoxFit.fitWidth,
//                  ),
//                  height: 150,
//                  width: 150.0,
//                  color: Color.fromRGBO(0, 0, 0, 0.2),
//                  padding: EdgeInsets.all(5),
//                ),
//                onTap: () {
//                  Navigator.of(context).push(
//                    MaterialPageRoute(
//                      builder: (context) => GalleryPage(
//                        imagePath: documentSnapshot.data['image_url'],
//                      ),
//                    ),
//                  );
//                },
//              )
//                  : new Text(documentSnapshot.data['text']),
//            ),
//          ],
//        ),
//      ),
//      new Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: <Widget>[
//          new Container(
//              margin: const EdgeInsets.only(left: 8.0),
//              child: new CircleAvatar(
//                backgroundImage:
//                new NetworkImage(documentSnapshot.data['profile_photo']),
//              )),
//        ],
//      ),
//    ];
//  }
//
//  List<Widget> generateReceiverLayout(DocumentSnapshot documentSnapshot) {
//    return <Widget>[
//      new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Container(
//              margin: const EdgeInsets.only(right: 8.0),
//              child: new CircleAvatar(
//                backgroundImage:
//                new NetworkImage(documentSnapshot.data['profile_photo']),
//              )),
//        ],
//      ),
//      new Expanded(
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            new Text(documentSnapshot.data['sender_name'],
//                style: new TextStyle(
//                    fontSize: 14.0,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold)),
//            new Container(
//              margin: const EdgeInsets.only(top: 5.0),
//              child: documentSnapshot.data['image_url'] != ''
//                  ? InkWell(
//                child: new Container(
//                  child: Image.network(
//                    documentSnapshot.data['image_url'],
//                    fit: BoxFit.fitWidth,
//                  ),
//                  height: 150,
//                  width: 150.0,
//                  color: Color.fromRGBO(0, 0, 0, 0.2),
//                  padding: EdgeInsets.all(5),
//                ),
//                onTap: () {
//                  Navigator.of(context).push(
//                    MaterialPageRoute(
//                      builder: (context) => GalleryPage(
//                        imagePath: documentSnapshot.data['image_url'],
//                      ),
//                    ),
//                  );
//                },
//              )
//                  : new Text(documentSnapshot.data['text']),
//            ),
//          ],
//        ),
//      ),
//    ];
//  }
//
//  generateMessages(AsyncSnapshot<QuerySnapshot> snapshot) {
//    return snapshot.data.documents
//        .map<Widget>((doc) => Container(
//      margin: const EdgeInsets.symmetric(vertical: 10.0),
//      child: new Row(
//        children: doc.data['sender_id'] != widget.prefs.getString('uid')
//            ? generateReceiverLayout(doc)
//            : generateSenderLayout(doc),
//      ),
//    ))
//        .toList();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Container(
//        padding: EdgeInsets.all(5),
//        child: new Column(
//          children: <Widget>[
//            StreamBuilder<QuerySnapshot>(
//              stream: chatReference.orderBy('time',descending: true).snapshots(),
//              builder: (BuildContext context,
//                  AsyncSnapshot<QuerySnapshot> snapshot) {
//                if (!snapshot.hasData) return new Text("No Chat");
//                return Expanded(
//                  child: new ListView(
//                    reverse: true,
//                    children: generateMessages(snapshot),
//                  ),
//                );
//              },snapshot
//            ),
//            new Divider(height: 1.0),
//            new Container(
//              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
//              child: _buildTextComposer(),
//            ),
//            new Builder(builder: (BuildContext context) {
//              return new Container(width: 0.0,0 height: 0.0);
//            })
//          ],
//        ),
//      ),
//    );
//  }
//
//  IconButton getDefaultSendButton() {
//    return new IconButton(
//      icon: new Icon(Icons.send),
//      onPressed: _isWritting
//          ? () => _sendText(_textController.text)
//          : null,
//    );
//  }
//
//  Widget _buildTextComposer() {
//    return new IconTheme(
//        data: new IconThemeData(
//          color: _isWritting
//              ? Theme.of(context).accentColor
//              : Theme.of(context).disabledColor,
//        ),
//        child: new Container(
//          margin: const EdgeInsets.symmetric(horizontal: 8.0),
//          child: new Row(
//            children: <Widget>[
//              new Container(
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
//                child: new IconButton(
//                    icon: new Icon(
//                      Icons.photo_camera,
//                      color: Theme.of(context).accentColor,
//                    ),
//                    onPressed: () async {
//                      var image = await ImagePicker.pickImage(
//                          source: ImageSource.gallery);
//                      int timestamp = new DateTime.now().millisecondsSinceEpoch;
//                      StorageReference storageReference = FirebaseStorage
//                          .instance
//                          .ref()
//                          .child('chats/img_' + timestamp.toString() + '.jpg');
//                      StorageUploadTask uploadTask =
//                      storageReference.putFile(image);
//                      await uploadTask.onComplete;
//                      String fileUrl = await storageReference.getDownloadURL();
//                      _sendImage(messageText: null, imageUrl: fileUrl);
//                    }),
//              ),
//              new Flexible(
//                child: new TextField(
//                  controller: _textController,
//                  onChanged: (String messageText) {
//                    setState(() {
//                      _isWritting = messageText.length > 0;
//                    });
//                  },
//                  onSubmitted: _sendText,
//                  decoration:
//                  new InputDecoration.collapsed(hintText: "Send a message"),
//                ),
//              ),
//              new Container(
//                margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                child: getDefaultSendButton(),
//              ),
//            ],
//          ),
//        ));
//  }
//
//  Future<Null> _sendText(String text) async {
//    _textController.clear();
//    chatReference.add({
//      'text': text,
//      'sender_id': widget.prefs.getString('uid'),
//      'sender_name': widget.prefs.getString('name'),
//      'profile_photo': widget.prefs.getString('profile_photo'),
//      'image_url': '',
//      'time': FieldValue.serverTimestamp(),
//    }).then((documentReference) {
//      setState(() {
//        _isWritting = false;
//      });
//    }).catchError((e) {});
//  }
//
//  void _sendImage({String messageText, String imageUrl}) {
//    chatReference.add({
//      'text': messageText,
//      'sender_id': widget.prefs.getString('uid'),
//      'sender_name': widget.prefs.getString('name'),
//      'profile_photo': widget.prefs.getString('profile_photo'),
//      'image_url': imageUrl,
//      'time': FieldValue.serverTimestamp(),
//    });
//  }
//}
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/basic.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Picker Demo',
//       home: MyHomePage(title: 'Image Picker Example'),
//     );
//   }
// }

class MyHomePage2 extends StatefulWidget {
  // MyHomePage2({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  File _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  String _retrieveDataError;

  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(File file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      _controller = VideoPlayerController.file(file);
      await _controller.setVolume(1.0);
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    if (_controller != null) {
      await _controller.setVolume(0.0);
    }
    if (isVideo) {
      final File file = await ImagePicker.pickVideo(source: source);
      await _playVideo(file);
    } else {
      await _displayPickImageDialog(context,
          (double maxWidth, double maxHeight, int quality) async {
        try {
          _imageFile = await ImagePicker.pickImage(
              source: source,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: quality);
          setState(() {});
        } catch (e) {
          _pickImageError = e;
        }
      });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_controller != null) {
      await _controller.dispose();
      _controller = null;
    }
  }

  Widget _previewVideo() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jgjghjghj"),
      ),
      body: Center(
        child: Platform.isAndroid
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return isVideo ? _previewVideo() : _previewImage();
                    default:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked an image.',
                          textAlign: TextAlign.center,
                        );
                      }
                  }
                },
              )
            : (isVideo ? _previewVideo() : _previewImage()),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              isVideo = false;
              _onImageButtonPressed(ImageSource.gallery, context: context);
            },
            heroTag: 'image0',
            tooltip: 'Pick Image from gallery',
            child: const Icon(Icons.photo_library),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.camera, context: context);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
              },
              heroTag: 'video0',
              tooltip: 'Pick Video from gallery',
              child: const Icon(Icons.video_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'video1',
              tooltip: 'Take a Video',
              child: const Icon(Icons.videocam),
            ),
          ),
        ],
      ),
    );
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxWidth if desired"),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxHeight if desired"),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "Enter quality if desired"),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    double width = maxWidthController.text.length > 0
                        ? double.parse(maxWidthController.text)
                        : null;
                    double height = maxHeightController.text.length > 0
                        ? double.parse(maxHeightController.text)
                        : null;
                    int quality = qualityController.text.length > 0
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}