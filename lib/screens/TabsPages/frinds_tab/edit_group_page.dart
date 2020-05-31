import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/room.dart';

import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:video_player/video_player.dart';

import '../../../tabs_page.dart';

class EditRoomPage extends StatefulWidget {
final   Room_Model roomModel;
  EditRoomPage({this.roomModel});

  @override
  _EditRoomPageState createState() => _EditRoomPageState();
}

class _EditRoomPageState extends State<EditRoomPage> {
  ApiRequests apiRequests = new ApiRequests();
  String name, descrition, story, details, lang;
  final _formKey = GlobalKey<FormState>();
  var _selectedLanguage;
  bool _selected = true;
  File _imageFile;
  VideoPlayerController _controller;
    String _retrieveDataError;
  List<String> _language = <String>[
    'العربية',
    'english',
  ];
  DataUser _dataUser=DataUser.instance;
  bool _isLoading = false;
  dynamic _pickImageError;
  TextEditingController _groupName = new TextEditingController();
  TextEditingController _groupDescreption = new TextEditingController();
  TextEditingController _aboutGroup = new TextEditingController();
  TextEditingController _groupState = new TextEditingController();
  TextEditingController _languagee = new TextEditingController();
  @override
  void initState() {
_groupName.text=widget.roomModel.roomName;
_groupDescreption.text=widget.roomModel.description;
_aboutGroup.text=widget.roomModel.details;
_groupState.text=widget.roomModel.story;






  }
  Future getImage(ImageSource imageSource) async {
    //  var image = await ImagePicker.pickVideo(source: ImageSource.camera);
    var image =
        await ImagePicker.pickImage(source: imageSource,maxWidth: 1024,maxHeight: 683 ,imageQuality: 100);
 

    setState(() {
      print("mahmoud");
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
        return Form(
          key: _formKey,
          child: Scaffold(
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
                "تعديل الغرفة",
                style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  child: new SimpleDialog(
                                    backgroundColor: Colors.grey[800],
                                    title: Align(
                                        alignment: Alignment.center,
                                        child: new Text(
                                          "اختر صوره ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "thin"),
                                        )),
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.grey[200]),
                                            child: new SimpleDialogOption(
                                              child: new Text("كاميرا",
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontFamily: "thin",
                                                      height: 2)),
                                              onPressed: () {
                                              getImage(ImageSource.camera);
                                               // _onImageButtonPressed(ImageSource.camera, context: context);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.grey[200]),
                                            child: new SimpleDialogOption(
                                              child: new Text("ستوديو",
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontFamily: "thin",
                                                      height: 2)),
                                              onPressed: () {
                                                getImage(ImageSource.gallery);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: ClipOval(
                                  child: _imageFile==null?Stack(
                                children: <Widget>[
                             CachedNetworkImage(
                               height: 80,
                               width: 80,
              imageUrl:
                  Utility.BaseURL + widget.roomModel.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error,color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),)),),
               
               fit: BoxFit.fill,
              //  width: MediaQuery.of(context).size.width/3-40,
            )
                                ],
                              ):         Image.file(
                                    _imageFile , fit: BoxFit.cover ,
                                    height: 80 ,
                                    width: 80 ,)






//                            }):_previewImage()),
                              )
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                     
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius:new BorderRadius.all(  Radius.circular(15)),
                                       color: Colors.white,
                                  ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .lblname;
                                    }

                                    return null;
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  cursorColor: Colors.white,
controller: _groupName,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),

//                                  keyboardType: TextInputType.number,

                                  //s textAlign: TextAlign.right,

                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontFamily: "thin"),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      hintText:
                                       AppLocalizations.of(context).lblname,
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                     
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius:new BorderRadius.all(  Radius.circular(15)),
                                       color: Colors.white,
                                  ),
                                child: TextFormField(
                                  controller:_groupDescreption ,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .lblDescription;
                                    }

                                    return null;
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      descrition = value;
                                    });
                                  },
                                  cursorColor: Colors.white,

                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),

//                                  keyboardType: TextInputType.number,

                                  //s textAlign: TextAlign.right,

                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontFamily: "thin"),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      hintText: AppLocalizations.of(context)
                                          .lblDescription,
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                              ),
                            ],
                          )
                        ]),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblDetails,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "black",
                            color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        controller: _aboutGroup,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblAboatGroup;
                          }

                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            details = value;
                          });
                        },
                        cursorColor: Colors.white,

                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "thin"),

//                        keyboardType: TextInputType.number,

                        //s textAlign: TextAlign.right,

                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "thin"),
                          hintText: AppLocalizations.of(context).lblAboatGroup,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        controller: _groupState,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblStatus;
                          }

                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            story = value;
                          });
                        },
                        cursorColor: Colors.white,

                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "thin"),
//
//                        keyboardType: TextInputType.number,

                        //s textAlign: TextAlign.right,

                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "thin"),
                          hintText: AppLocalizations.of(context).lblStatus,
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton(
                        items: _language
                            .map((value) => DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "black"),
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (selectedLanguageType) {
                          setState(() {
                            lang = selectedLanguageType;

                            _selectedLanguage = selectedLanguageType;
                          });
                        },
                        value: _selectedLanguage,
                        isExpanded: false,
                        hint: Text(
                          //"AppLocalizations.of(context).lblLanguage",
                          widget.roomModel.language,
                          style: TextStyle(
                              color: Colors.black, fontFamily: "thin"),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey[300],
                    //     shape: BoxShape.rectangle,
                    //     borderRadius: BorderRadius.circular(8),
                    //     border: new Border.all(color: Colors.grey),
                    //   ),
                    //   child: Row(
                    //     // crossAxisAlignment: CrossAxisAlignment.start,
                    //     //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Checkbox(
                    //         activeColor: Colors.grey,
                    //         onChanged: (bool is_select) {
                    //           setState(() {
                    //             _selected = is_select;
                    //           });
                    //         },
                    //         value: _selected,
                    //       ),
                    //       Text(
                    //         AppLocalizations.of(context)
                    //             .lblagreetothetermsandconditions,
                    //         style: TextStyle(
                    //             fontSize: 12,
                    //             color: Colors.black,
                    //             fontFamily: "thin"),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  _isLoading==false?  GestureDetector(
                      onTap: () {
                        _valdatite();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            bottom: 12,
                            top: MediaQuery.of(context).size.height / 6),
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                begin: Alignment(-1.0, 1.0),
                                colors: [
                                  Colors.teal[900],
                                  Colors.teal[100],
                                  Colors.teal[900],
                                ])),
                        child: Text(AppLocalizations.of(context).lblSave,
                            style: TextStyle(
                                fontFamily: "black", color: Colors.white)),
                      ),
                    ):Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.teal,
                      )),

                      _isLoading==false?  GestureDetector(
                      onTap: () {
                        // _valdatite();
                        deleteRoom();
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                  right: 20,
                                                  left: 20,
                                                ),
                                                width: MediaQuery.of(context).size.width,
                                                margin: EdgeInsets.only(
                                                    top: 8,
                                                   ),
                                                height: 45,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: Colors.red
                                                  ),
                                                child: Text("حذف الغرفة",
                                                    style: TextStyle(
                                                        fontFamily: "black", color: Colors.white)),
                                              ),
                                            ):Center(
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.teal,
                                              )),
                                           
                                          ],
                                        ),
                                      ),
                                    ),
                        
                                  ),
                                );
                            //   },
                            // );
                          }
                        
                          void _valdatite() async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              if(lang=="اللغة" ||lang=="Language"){
                                print("a7aaaaaaaaaaaaaaaaaaaa");
                                _showErrorDialog("برجاء ادخل اللغة");
                                return;
                              }
                        
                              setState(() {
                                _isLoading = true;
                              });
                              print(name);
                              print(descrition);
                              print(details);
                              print(story);
                              print(lang);
                        
                              print(lang);
                              apiRequests.EditeRoom(widget.roomModel.roomId.toString(),name, descrition, details, story, lang, _imageFile).then((value){
if(value==true){
      Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
              return TabsPage();
            }), (Route<dynamic> route) => false);

}else if(value ==false){
Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblthisnameisused,DialogType.ERROR,context);
}
else if(value ==null){
  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
}
  setState(() {
        _isLoading = false;
      });
                              });
                              // if (_imageFile == null) {
                              //   _showErrorDialog("plz enter image");
                              // } else {
                            //     if (await apiRequests.EditeRoom(widget.roomModel.roomId.toString(),name, descrition, details, story, lang, _imageFile) ==
                            //         true) {
                            // //    Navigator
                            //       setState(() {
                            //         _isLoading = false;
                            //       });
                            //       //_dataUser.getKey('is_rooms_louded')==true;
                            //     //  _dataUser.setKey({'key':'is_rooms_louded','value':true});
                            //       print("-------------------------------------------------------------------");
                            //     Navigator.pushAndRemoveUntil(context,
                            //         MaterialPageRoute(builder: (context) {
                            //           return TabsPage();
                            //         }), (Route<dynamic> route) => false);
                        
                            //     }
                              //}
                        
                        //      else if (  await Provider.of<Auth>(context, listen: false).AddRoom(name,descrition,details,story,lang,imagefile)==true){
                        //        _showErrorDialog();
                        //        setState(() {
                        //          _isLoading = false;
                        //        });
                        //      }
                            }
                          }
                        
                          void _showErrorDialog(String message) {
                            showDialog(
                              context: context,
                              builder: (ctx) =>
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
                                          _isLoading=false;
                                        });
                                        Navigator.of(ctx).pop();
                        
                                      },
                                    )
                                  ],
                                )
                        
                            );
                          }
                        
                          Future<void> deleteRoom() async {
setState(() {
  _isLoading=true;
 
});
if(await apiRequests.deleteRoom(widget.roomModel.roomId.toString())==true){
         Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                      return TabsPage();
                                    }), (Route<dynamic> route) => false);
}
else{
  setState(() {
  _isLoading=false;
 
});
}













                          }
}
