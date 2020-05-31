import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/vip_room_item.dart';
import 'package:mojtam3/model/models/room.dart';
import 'package:mojtam3/model/models/saadModel.dart';
import 'package:mojtam3/model/provider/SelectedRoom.dart';
import 'package:mojtam3/screens/TabsPages/discover_tab/search_room.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:mojtam3/Lozalization/Local_helper.dart';

import 'package:mojtam3/model/models/rooms_model.dart';

import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  RoomsModel requestsList;

List<Room_Model> active= List<Room_Model>();
List<Room_Model> spiical= List<Room_Model>();
  bool isLoading = false;

  DataUser _dataUser = DataUser.instance;

  // var scaffoldKey = new GlobalKey<ScaffoldState>();
  ApiRequests apiRequests = new ApiRequests();

  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }
  @override
  void setState(fn) {
    // TODO: implement setState
    if (this.mounted) super.setState(fn);
  }

  @override
  void initState() {
    //imageCache.clear();
    isLoading = true;
    apiRequests.getRomes().then((value) {
      print("---------------------------tiger---------------");
      print(value);
          setState(() {
   for(int i = 0 ;i<value.data.special.length;i++){
    // requestsList2.msg="succ";
       if(value.data.special[i].suspend==0){
         print("spicail");
spiical.add(value.data.special[i]);
       }


     }
          for(int i = 0 ;i<value.data.active.length;i++){
              if(value.data.active[i].suspend==0){
                    print("active");
               active.add(value.data.active[i]);
// requestsList2.data.active.add(value.data.active[i]);
              }


     }
  
  
      
         requestsList = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("-------------discover-------------------");
    return Scaffold(
        // key: scaffoldKey,
        backgroundColor: Color(int.parse(
          _dataUser.getKey(Utility.BackGroundColor),
        )),
        appBar: AppBar(
            backgroundColor: Colors.grey[800],
            centerTitle: true,
            title: Text(""),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: ClipOval(
                child: CachedNetworkImage(
                    imageUrl: Utility.BaseURL +
                        _dataUser.getKey(Utility.ProfileImage),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Color(int.parse(
                            _dataUser.getKey(Utility.FontColor),
                          )),
                        ),
                    fit: BoxFit.fill),
              ),
            ),
            actions: <Widget>[
              new IconButton(
                icon: Image.asset(
                  "assets/images/languge.png",
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      child: new SimpleDialog(
                        backgroundColor: Colors.grey[800],
                        title: Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "اختر اللغة ",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "thin"),
                            )),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200]),
                                child: new SimpleDialogOption(
                                  child: new Text("العربية",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: "thin",
                                          height: 2)),
                                  onPressed: () {
                                    this.setState(() {
                                      helper.onLocaleChanged(new Locale("ar"));
                                    });
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
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200]),
                                child: new SimpleDialogOption(
                                  child: new Text("English",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: "thin",
                                          height: 2)),
                                  onPressed: () {
                                    this.setState(() {
                                      helper.onLocaleChanged(new Locale("en"));
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                },
              ),
              new IconButton(
                  icon: Image.asset(
                    "assets/images/loupe.png",
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchRoomPage();
                    }));
                  }),
            ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 14, left: 14),
                child: Text(AppLocalizations.of(context).lblViprooms,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "black",
                        color: Color(int.parse(
                          _dataUser.getKey(Utility.FontColor),
                        )))),
              ),
              Container(
                //    color: Colors.red,
                height: MediaQuery.of(context).size.width / 3 + 50,

                child: !isLoading
                    ? requestsList != null
                        ? ListView.builder(
                            itemCount: spiical.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              print("-----------------spical-----------------" +
                                  index.toString());
                              return GestureDetector(
                                onTap: () {
                                  print(
                                      "---------------------------- spical rooom------------");

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ChatPage(
                                      title: spiical[index].roomName,
                                      chatId: spiical[index].roomId
                                          .toString(),
                                      room_model:
                                        spiical[index],
                                      check: 0,
                                    );
                                  }));
                                },
                                child: VipRoomItem(
                            spiical[index].roomName.trim(),
                              spiical[index].description.trim(),
                                  spiical[index].users
                                      .toString().trim(),
                                  spiical[index].level
                                      .toString().trim(),
                                  Utility.BaseURL +
                                      spiical[index].image,
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              AppLocalizations.of(context)
                                  .lblNoInternetConnection,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "thin",
                                  color: Color(int.parse(
                                    _dataUser.getKey(Utility.FontColor),
                                  ))),
                            ),
                          )
                    : Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 14, left: 14, top: 10, bottom: 10),
                child: Text(AppLocalizations.of(context).lblActiverooms,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "black",
                        color: Color(int.parse(
                          _dataUser.getKey(Utility.FontColor),
                        )))),
              ),
              !isLoading
                  ? requestsList != null
                      ? GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: .75,
                          controller:
                              new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(
                              active.length, (index) {
                            print("-----------------active-----------------" +
                                index.toString());
                            return GestureDetector(
                                onTap: () {
                                  print(
                                      "---------------------------- active rooom------------");
                                  print(
                                      active[index].roomName);
                                  print( active[index].roomId
                                      .toString());
                                  print( active[index].roomId
                                      .toString());
                                  print( active[index]);
                                  //    print(requestsList.data.active[index].roomName);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ChatPage(
                                      title:  active[index].roomName,
                                      chatId: active[index].roomId
                                          .toString(),
                                      room_model:
                                           active[index],
                                      check: 0,
                                    );
                                  }));
//
                                },
                                child:
                                    //     WidgetANimator(
                                    VipRoomItem(
                                  active[index].roomName.trim(),
                                  active[index].description.trim(),
                                  active[index].users
                                      .toString().trim(),
                                   active[index].level
                                      .toString().trim(),
                                  Utility.BaseURL +
                                      active[index].image,
                                )
                                //  ),
                                );
                          }))
                      : Center(
                          child: Text(
                            AppLocalizations.of(context)
                                .lblNoInternetConnection,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "thin",
                                color: Color(int.parse(
                                  _dataUser.getKey(Utility.FontColor),
                                ))),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                    ),
            ],
          ),
        ));
  }

  // Widget noInternetConnectionFeild() {
  //   return Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Container(
  //         height: 100.0,
  //         width: 100.0,
  //         child: Center(
  //           child: Icon(Icons.cloud_off),
  //         )),
  //   );
  // }

//   showInternetSnackbar(String message) {
//     var snackbar = new SnackBar(
//       action: new SnackBarAction(
//           label: 'Retry',
//           textColor: Colors.red,
//           onPressed: () {
//             // getRooms();
//           }),
//       content: new Text(message),
//       duration: new Duration(seconds: 3),
//       backgroundColor: Colors.black45,
//     );
//     scaffoldKey.currentState.showSnackBar(snackbar);
//   }
}
