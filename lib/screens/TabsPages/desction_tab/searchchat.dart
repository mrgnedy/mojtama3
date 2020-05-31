import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/groub_item.dart';

import 'package:mojtam3/model/models/seachChatModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/utillites/utillity_class.dart';
// import 'package:provider/provider.dart';

class SearchChatPage extends StatefulWidget {
  SearchChatPage();

  @override
  _SearchChatPageState createState() => _SearchChatPageState();
}

class _SearchChatPageState extends State<SearchChatPage> {
  ApiRequests apiRequests = new ApiRequests();
  TextEditingController _textController;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String _roomName;
  SearchChatModel searchChatModel;
   DataUser _dataUser=DataUser.instance;

  //  print(widget.) 
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
                  //widget.lblFriendsRequest,""
                  AppLocalizations.of(context).lblSearch,
                  style: TextStyle(
                      fontFamily: "thin", fontSize: 18,color: Colors.white,),
                ),
              ),
              body: Column(
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
                              validator: (v){
if(v.length==0){
  return AppLocalizations.of(context).lblSearch;
}
                              },
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
print("hhhhhhhhhhhhhhhhhhhhhhh9");
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
                      ? Expanded(
                                              child: FutureBuilder<SearchChatModel>( 
              future: apiRequests.getSearchedchat(_roomName),
    builder: (context, snapshot) {
print("mahmoud");
      if (snapshot.connectionState == ConnectionState.waiting)
        return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.teal,
            ));
      //  if(!snapshot.hasData)
      //    return  Center(
      //       child: CircularProgressIndicator(
      //         backgroundColor: Colors.teal,
      //       ));
        if (snapshot.connectionState == ConnectionState.done){
if(snapshot.data==null)
{
  return Center(child: Text(AppLocalizations.of(context).lblNoInternetConnection,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
}
     else      return  snapshot.data.data.chatSearch.length==0?Center(
                            child: Text(
                              AppLocalizations.of(context)
                                  .lblnofrindsyet,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "thin",
                                  color: Color(int.parse(
                                    _dataUser.getKey(Utility.FontColor),
                                  ))),
                            ),
                          ):      
           ListView.builder(
                        itemCount:  snapshot.data.data.chatSearch.length,
                        itemBuilder: (BuildContext context, index) {
                          return// WidgetANimator(
                            GroubItem(
                             Utility.BaseURL+ snapshot.data.data.chatSearch[index].userImage,
                              snapshot.data.data.chatSearch[index].userName,
                                     snapshot.data.data.chatSearch[index].description,
                               snapshot.data.data.chatSearch[index].story,
                                "",
                                "");
                         // );
                        }//),
                );
      }
      }),
                      )
                      :Container()
                ],
              )),
        );
    
  }
}
