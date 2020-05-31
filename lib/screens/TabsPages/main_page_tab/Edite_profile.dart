import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
//import 'view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/authModel.dart';
import 'package:mojtam3/model/models/profileModel.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:image_picker/image_picker.dart';

import 'package:mojtam3/tabs_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_tags/tag.dart';

class EditeProfilePage extends StatefulWidget {
  PrfileModel profileData;
  EditeProfilePage(this.profileData);

  @override
  _EditeProfilePageState createState() => _EditeProfilePageState();
}

class _EditeProfilePageState extends State<EditeProfilePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  ApiRequests apiRequests = new ApiRequests();
  List<String> _list = [
    'العربية',
    'english',
    'french',
    'Italian',
    'German',
    'Spain',

  ];

  bool _symmetry = false;
  bool _removeButton = true;
  File _image;
  File _story;
  bool _horizontalScroll = false;
  int _column = 0;
  double _fontSize = 14;
  bool _male = false;
  bool _female = false;
  String BirthDay;
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _birthDatecontroller = new TextEditingController();
  TextEditingController _desciptioncontroller = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // String _itemCombine = 'withTextBefore';
  var _isLoading = false;
  String _onPressed = '';
  Function _showBottomSheetCallback;
  bool showDatePicker = false;
  List<String> _items = [];
  List _stories = [];
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  void initState() {
    super.initState();
    print("-----------------profile-----------------");
    print(widget.profileData.dateOfBirth);
    print(widget.profileData.gender);

    _scrollViewController = ScrollController();
    // _items=Provider.of<Auth>(context).user.data.langauges;
    for (int i = 0; i < widget.profileData.langauges.length; i++)
      _items.add(widget.profileData.langauges[i].lang);

    _namecontroller.text = widget.profileData.name;
    _birthDatecontroller.text = widget.profileData.dateOfBirth;
    _desciptioncontroller.text = widget.profileData.yourMind;
    if (widget.profileData.gender == "male") {
      _male = true;
      _female = false;
    } else if (widget.profileData.gender == "female") {
      _male = false;
      _female = true;
    }

    _showBottomSheetCallback = _showBottomSheet;
  }

  void _snackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  _showBottomSheet(String picker) {
    print("mahmoud1");
    setState(() {
      // disable the button
      print("mahmoud2");
      _showBottomSheetCallback = null;
    });
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 150,
            child: DatePicker(
              key: dobKey,
              setDate: _setDate,
              customShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              customItemColor: Colors.teal[500],
              customGradient:
                  LinearGradient(begin: Alignment(-0.5, 1.0), colors: [
                Colors.teal,
                Colors.teal[300],
                Colors.teal,
              ]),
            ),
          );
        });
  }

  void _setDate() {
    _birthDatecontroller.text = dobKey.currentState.dobYear.toString() +
        "-" +
        ((dobKey.currentState.dobMonth) + 1).toString() +
        "-" +
        dobKey.currentState.dobDate;

    Navigator.of(context).pop();
    print("saad");
    print(dobKey.currentState.dobDate);
    print(dobKey.currentState.dobMonth + 1);
    print(dobKey.currentState.dobYear);
    //    _snackBar(dobKey.currentState.dobStrMonth +
//        ' ${dobKey.currentState.dobDate}' +
//        ' ${dobKey.currentState.dobYear}');
  }

  List<String> _language = <String>[
    'العربية',
    'English',
  ];

//pickImage(source: ImageSource.camera,imageQuality: 60)
  Future getImage(ImageSource imageSource) async {
//      var image = await ImagePicker.pickVideo(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(
        source: imageSource, maxWidth: 1024, maxHeight: 683, imageQuality: 100);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  // Future getstory(ImageSource imageSource) async {
  //   var image =
  //       await ImagePicker.pickImage(source: imageSource, imageQuality: 60);
  //   File croppedFile = await ImageCropper.cropImage(
  //       sourcePath: image.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //       androidUiSettings: AndroidUiSettings(
  //           toolbarTitle: 'mogtam3',
  //           toolbarColor: Colors.grey[900],
  //           toolbarWidgetColor: Colors.teal,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false,
  //           activeControlsWidgetColor: Colors.teal),
  //       iosUiSettings: IOSUiSettings(
  //         minimumAspectRatio: 1.0,
  //       ));

  //   setState(() {
  //     _story = croppedFile;
  //   });
  // }

  DataUser _dataUser = DataUser.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _namecontroller.dispose();
    _desciptioncontroller.dispose();
    _birthDatecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool Loading = false;
    print("llllllllllllllllllllll");
    //  print(Loading);

    return _isLoading
        ? Container(
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.teal,
            )),
          )
        : Scaffold(
            backgroundColor: Color(int.parse(
              _dataUser.getKey(Utility.BackGroundColor),
            )),
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
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _validate();
                  },
                )
              ],
              title: Text(
                AppLocalizations.of(context).lblEditProfile,
                style: TextStyle(
                    fontFamily: "thin", color: Colors.white, fontSize: 18),
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Loading = true;
                                  });
                                  showDialog(
                                      context: context,
                                      child: new SimpleDialog(
                                        backgroundColor: Colors.grey[800],
                                        title: Align(
                                            alignment: Alignment.center,
                                            child: new Text(
                                              "تغيير الصوره الشخصية",
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
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey[200]),
                                                child: new SimpleDialogOption(
                                                  child: new Text("كاميرا",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[800],
                                                          fontFamily: "thin",
                                                          height: 2)),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();

                                                    getImage(
                                                        ImageSource.camera);
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
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey[200]),
                                                child: new SimpleDialogOption(
                                                  child: new Text("ستوديو",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[800],
                                                          fontFamily: "thin",
                                                          height: 2)),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();

                                                    getImage(
                                                        ImageSource.gallery);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ));
                                  setState(() {
                                    Loading = false;
                                  });
                                },
                                child: ClipOval(
                                    child: _image == null
                                        ? CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            imageUrl: Utility.BaseURL +
                                                _dataUser.getKey(
                                                    Utility.ProfileImage),
                                            fit: BoxFit.fill,
                                            height: 80,
                                            width: 80,
                                          )
                                        : Image.file(
                                            _image,
                                            fit: BoxFit.cover,
                                            height: 80,
                                            width: 80,
                                          )),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context)
                                              .lblname;
                                        }

                                        // return null;
                                      },

                                      cursorColor: Colors.white,

                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),

                                      //s textAlign: TextAlign.right,
                                      controller: _namecontroller,
                                      onChanged: (value) =>
                                          _namecontroller.text + value,
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
                                              .lblname,
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context)
                                              .lblDescription;
                                        }

                                        //      return null;
                                      },

                                      cursorColor: Colors.blue,
                                      controller: _desciptioncontroller,
                                      //    textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),

                                      //s textAlign: TextAlign.right,
                                      onChanged: (value) =>
                                          _desciptioncontroller.text + value,

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
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Text(
                          AppLocalizations.of(context).lblAccount,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "black",
                              color: Color(int.parse(
                                _dataUser.getKey(Utility.FontColor),
                              ))),
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context).lblname;
                            }

                            //  return null;
                          },
                          controller: _namecontroller,
                          cursorColor: Colors.white,

                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "thin"),
// textAlign: TextAlign.right,

                          decoration: InputDecoration.collapsed(
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: "thin"),
                            hintText: AppLocalizations.of(context).lblname,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  // if (value.isEmpty) {
                                  //   return AppLocalizations.of(context)
                                  //       .lblBirthDay;
                                  // }

                                  //   return null;
                                },
                                controller: _birthDatecontroller,
                                cursorColor: Colors.white,
                                readOnly: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: "thin"),
// textAlign: TextAlign.right,

                                decoration: InputDecoration.collapsed(
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontFamily: "thin"),
                                  hintText:
                                      AppLocalizations.of(context).lblBirthDay,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _showBottomSheet('DatePicker');
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12, right: 12),
                        margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          border: new Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(AppLocalizations.of(context).lblGender),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.grey,
                                  onChanged: (is_select) {
                                    setState(() {
                                      _male = is_select;
                                      _female = false;
                                    });
                                  },
                                  value: _male,
                                ),
                                Text(AppLocalizations.of(context).lblMale),
                                Checkbox(
                                  activeColor: Colors.grey,
                                  onChanged: (bool is_select) {
                                    setState(() {
                                      _female = is_select;
                                      _male = false;
                                    });
                                  },
                                  value: _female,
                                ),
                                Text(AppLocalizations.of(context).lblFemale)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 12, left: 12),
                            child: Text(
                              AppLocalizations.of(context).lblLanguage,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "black",
                                  color: Color(int.parse(
                                    _dataUser.getKey(Utility.FontColor),
                                  ))),
                            ),
                          ),
                          PopupMenuButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(int.parse(
                                _dataUser.getKey(Utility.FontColor),
                              )),
                            ),
                            onSelected: (value) {
                              print(value);
                              //  user_info.user.data.langauges.add(new Langauges.fromJson({'lang':value}));
                              setState(() {
                                //  _items=[..._items,value];
                                _items.add(value);
                              });

                              print(_items);
                              print(value);
                              print("mahmoud");
                            },
                            itemBuilder: (BuildContext context) {
                              return _list.map((listItem) {
                                return PopupMenuItem<String>(
                                  value: listItem,
                                  child: Text(listItem),
                                );
                              }).toList();
                            },
                          )
                        ],
                      ),
//                      Container(
//                        height: 100,
//
//                        child: CustomScrollView(
//                          slivers: <Widget>[
//                            SliverList(
//                                delegate: SliverChildListDelegate([
//
//
//                                  _tags1,
//                                  Column(
//                                    children: <Widget>[
//                                      Divider(
//                                        color: Colors.blueGrey,
//                                      ),
//
//                                    ],
//                                  ),
//                                ])),
//                          ],
//                        ),
//                      ),
                      Wrap(
                        children: <Widget>[_tags1],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Text(
                          AppLocalizations.of(context).lblAddMoments,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "black",
                              color: Color(int.parse(
                                _dataUser.getKey(Utility.FontColor),
                              ))),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              loadAssets();
//                                 showDialog(
//                                     context: context,
//                                     child: new SimpleDialog(
//                                       backgroundColor: Colors.grey[800],
//                                       title: Align(
//                                           alignment: Alignment.center,
//                                           child: new Text(
//                                             "اختر اللغة ",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: "thin"),
//                                           )),
//                                       children: <Widget>[
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             Container(
//                                               height: 45,
//                                               alignment: Alignment.center,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(20),
//                                                   color: Colors.grey[200]),
//                                               child: new SimpleDialogOption(
//                                                 child: new Text("كاميرا",
//                                                     style: TextStyle(
//                                                         color: Colors.grey[800],
//                                                         fontFamily: "thin",
//                                                         height: 2)),
//                                                 onPressed: () {
//                                                   //getstory(ImageSource.camera);
//                                                   Navigator.of(context).pop();
//                                                 },
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 12,
//                                             ),
//                                             Container(
//                                               height: 45,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(20),
//                                                   color: Colors.grey[200]),
//                                               child: new SimpleDialogOption(
//                                                 child: new Text("ستوديو",
//                                                     style: TextStyle(
//                                                         color: Colors.grey[800],
//                                                         fontFamily: "thin",
//                                                         height: 2)),
//                                                 onPressed: () {
//                                                  // getstory(ImageSource.gallery);

// // loadAssets();

//                                                   Navigator.of(context).pop();
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ));
                            },
                            child: DottedBorder(
                              borderType: BorderType.Circle,
                              color: Color(int.parse(
                                _dataUser.getKey(Utility.FontColor),
                              )),
                              child: Container(
                                height: 60,
                                width: 60,
                                child: ClipOval(
                                  child: Icon(Icons.add,
                                      color: Color(int.parse(
                                        _dataUser.getKey(Utility.FontColor),
                                      ))),
                                ),
                              ),
                            ),
                          ),
                          // Image.asset(AASET)
                          Expanded(
                            child: Container(
                              height: 55,
                              child: ListView.builder(
                                  itemCount: images.length,
//                                        user_info.user.data.stories.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    Asset asset = images[index];
                                    return Container(
                                      margin:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: ClipOval(
                                          child: AssetThumb(
                                        asset: asset,
                                        height: 100,
                                        width: 100,
                                      )),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      //   height: 45,
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Colors.teal[600]),
                      //   child: Text(
                      //       AppLocalizations.of(context).lblInvitefriends,
                      //       style: TextStyle(
                      //           fontFamily: "black", color: Colors.white)),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void confirm_data(Data data) {}

  Widget get _tags1 {
    print("heeeeeeeeeeeeeeeeeeeeee2");
    if (_items == null)
      return Container(
        color: Colors.red,
      );
    return Tags(
      key: _tagStateKey,
      symmetry: _symmetry,
      columns: _column,
      horizontalScroll: _horizontalScroll,
      //verticalDirection: VerticalDirection.up, textDirection: TextDirection.rtl,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      itemCount: _items.length,
      itemBuilder: (index) {
        final item = _items[index];
        print("heeeeeeeeeeeeeeeeeeeeee1");
        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: true,
          // activeColor: Colors.blueGrey[600],

          combine: ItemTagsCombine.withTextBefore,

          removeButton: _removeButton ? ItemTagsRemoveButton() : null,
          textScaleFactor:
              utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
          textStyle: TextStyle(
            fontSize: _fontSize,
          ),
          onRemoved: () {
            setState(() {
              _items.removeAt(index);
            });
          },
          onPressed: (item) => print(item.toString()),
        );
      },
    );
  }

  void _validate() async {
    print("-------------------------------------------");
    print(_items);
    List<Map<String, String>> langs = [];
//Map<String,String>list ;
    _items.forEach((lang) {
      print(lang);
      langs.add({"name": lang});
    });

    if (_formKey.currentState.validate()) {
      // if (!_male && !_female) {
      //   _showErrorDialog("error", "enter gender type");
      //   return;
      // }
      // else if(_image==null){
      // var json = jsonEncode(_items.map((e) => e.toJson()).toList());

      //   _showErrorDialog("enter new image");
      //   return ;
      // }
      var languages = {'"languages"': json.encode(langs)};
      print("algendt-------------------");
      print(languages);
      setState(() {
        _isLoading = true;
      });
      var LoginResponse = await apiRequests.UpdateUser(
          _namecontroller.text,
          _desciptioncontroller.text,
          _birthDatecontroller.text,
          _male ? "male" : "female",
          languages,
          _story,
          _image,
          images);
      try {
        if (LoginResponse.msg == "success") {
          print("----------------------sucess-----------------------");
          setState(() {
            _isLoading = false;
          });

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return TabsPage();
          }), (Route<dynamic> route) => false);
        } else if (LoginResponse.msg == "error") {
          setState(() {
            _isLoading = false;
          });
          _showErrorDialog("error", "تاكد من معلوماتك");
          print("----------------------error-----------------------");
          print(LoginResponse.data.toString());
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        _showErrorDialog(
            "error", AppLocalizations.of(context).lblNoInternetConnection);
      }
    }

    // }
  }

  void _showErrorDialog(String titel, String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                titel,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "thin",
                  // color: Color(int.parse(
                  //   _dataUser.getKey(Utility.FontColor),
                  // ))
                ),
              ),
              content: Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "thin",
                  // color: Color(int.parse(
                  //   _dataUser.getKey(Utility.FontColor),
                  // ))
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Okay',
                    style: TextStyle(color: Colors.teal),
                  ),
                  onPressed: () {
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }
}
