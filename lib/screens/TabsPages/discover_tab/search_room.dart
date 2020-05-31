import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

import 'package:mojtam3/Widget/vip_room_item.dart';

import 'package:mojtam3/model/models/searchRoomModel.dart';
import 'package:mojtam3/model/provider/SelectedRoom.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/utillites/utillity_class.dart';


class SearchRoomPage extends StatefulWidget {
  SearchRoomPage();

  @override
  _SearchRoomPageState createState() => _SearchRoomPageState();
}

class _SearchRoomPageState extends State<SearchRoomPage> {
  ApiRequests apiRequests = new ApiRequests();
  TextEditingController _textController;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String _roomName;
    DataUser _dataUser = DataUser.instance;
  //  print(widget.)
  @override
  Widget build(BuildContext context) {
    // return Consumer<Design>(
    //   builder: (context, ui, child) {
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
                  //widget.lblFriendsRequest,""
                  "بحث",
                  style: TextStyle(
                      fontFamily: "thin", fontSize: 18, color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                      color: Colors.grey[400],
                      child: Material(
                        color: Colors.white,
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                cursorColor: Colors.grey,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                onSaved: (value) {
                                  setState(() {
                                    _roomName = value;
                                  });
                                },
                                controller: _textController,
                                //  onChanged: _onChanged,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "black",
                                      color: Colors.grey[400]),
                                  hintText:
                                      AppLocalizations.of(context).lblSearch,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: IconButton(
                                icon: Image.asset("assets/images/search.png"),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

                                    setState(() {
                                      _isLoading = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    _isLoading
                        ? FutureBuilder<SearchRoomModel>(
                            future: apiRequests.getSearchedrooms(_roomName),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                ));
                          
                              if (snapshot.connectionState ==
                                  ConnectionState.done)
                                  {
                                    if(snapshot.data!=null){
                                   return    snapshot.data.data.roomsSearch.length==0? Center(
                                  child: Text(AppLocalizations.of(context).lblnomyroomsyet,style: TextStyle(color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),)) ),),
                                ):GridView.count(
                                    //padding: EdgeInsets.only(top: 12),
                                    crossAxisCount: 3,
                                    childAspectRatio: .75,
                                    controller: new ScrollController(
                                        keepScrollOffset: false),
                                    shrinkWrap: true,
                                    children: List.generate(
                                        snapshot.data.data.roomsSearch.length,
                                        (index) {
                                      return GestureDetector(
                                          onTap: () {
                                            print(
                                                "---------------------------- active rooom------------");
                                            print(snapshot.data.data.roomsSearch[index].userImage);
                                            print(snapshot.data.data.roomsSearch[index].image);
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return ChatPage(
                                                  chatId: snapshot.data.data.roomsSearch[index].roomId
                                                      .toString(),
                                                  room_model:snapshot.data.data.roomsSearch[index]

                                                  //    snapshot.data.data.active[index]
                                                  //snapshot.data.data.special[index]
                                                  );
                                            }));

                                          },
                                          child:
                                              //     WidgetANimator(
                                              VipRoomItem(
                                            snapshot.data.data.roomsSearch[index]
                                                .roomName,
                                            snapshot.data.data.roomsSearch[index]
                                                .description,
                                           snapshot.data.data.roomsSearch[index].users
                                                .toString(),
                                            snapshot.data.data.roomsSearch[index].level
                                                .toString(),
                                            Utility.BaseURL +
                                                snapshot.data.data.roomsSearch[index]
                                                    .image,
                                          )
                                          //  ),
                                          );
                                    }));
                                    }
                                    else{
                                      return Center(child: Text(AppLocalizations.of(context).lblNoInternetConnection,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
                                    }
                                  }
                                 
                                    else return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.brown,
                            ));
                                    
                            })
                        : Container(),
                  ],
                ),
              )),
        );
    //   },
    // );
  }
}
