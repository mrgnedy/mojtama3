import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/groub_item.dart';
import 'package:mojtam3/model/models/mychatsModel.dart';

import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/screens/TabsPages/desction_tab/frinds_chat_page.dart';

import 'package:mojtam3/screens/TabsPages/desction_tab/searchchat.dart';

import 'package:mojtam3/utillites/utillity_class.dart';
// import 'package:provider/provider.dart';

class DiscustionPage extends StatefulWidget {
  @override
  _DiscustionPageState createState() => _DiscustionPageState();
}

class _DiscustionPageState extends State<DiscustionPage>
    {

  TextEditingController _textController;
  List<String> _newData = [];
  int _check = 1;
  DataUser _dataUser=DataUser.instance;
  ApiRequests apiRequests = new ApiRequests();
  MyChats mychats;
  bool isLoading;


@override
  void initState() {
    // TODO: implement initState
  isLoading = true;
    apiRequests.getmyChatsWhereJoin().then((value) {
      print("---------------------------tiger---------------");
      print(value);
      setState(() {
        mychats = value;
        isLoading = false;
      });
    });
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    
    print("-------------discution-------------------");
 print(Utility.BaseURL+_dataUser.getKey(Utility.ProfileImage));
 

            return Scaffold(
            backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
              appBar: AppBar(
                backgroundColor: Colors.grey[800],
                leading: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    
                      child:  
                      
                      /**
     
                       */
                      
                                     CachedNetworkImage(
        imageUrl: Utility.BaseURL+_dataUser.getKey(Utility.ProfileImage),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error,color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),)),),
        fit: BoxFit.fill
     ),
                          
                          ),
                ),
                actions: <Widget>[
                      new IconButton(
                      icon: Image.asset(
                        "assets/images/loupe.png",
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchChatPage();
                        }));
                      }),
                ],
              ),
              body: Column(
                children: <Widget>[
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).lblDiscutions,
                          style: TextStyle(
                              fontSize: 15,
                              height: 1,
                              fontFamily: "thin",
                              color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _check == 1 ? _check = 0 : _check = 1;
                                print(_check);
                              });
                            },
                            icon: Image.asset(
                              _check == 1
                                  ? "assets/images/arrow-point-to-up.png"
                                  : "assets/images/arrow-point-to-dowen.png",
                              height: 15,
                              width: 15,
                            )),
                      ],
                    ),
                  ),
                  


    //                 FutureBuilder<MyChats>(
    //             future: apiRequests.getmyChatsWhereJoin(),
    // builder: (context, snapshot) {

      // if (snapshot.connectionState == ConnectionState.waiting)
      //   return Center(
      //       child: CircularProgressIndicator(
      //         backgroundColor: Colors.teal,
      //       ));
      
    //   if (snapshot.connectionState == ConnectionState.done)

     //  {
        //  if(snapshot.data==null)
        //  {
        //    return Center(child: Text(AppLocalizations.of(context).lblNoInternetConnection,style: TextStyle(  fontSize: 18,
        //                 fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
        //  }

//else
        //  return  
  isLoading?Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,)):   mychats!=null?    mychats.data.chats.length==0?Center(child:Text(AppLocalizations.of(context).lblnofrindsyet,style: TextStyle( fontFamily: "thin",fontSize: 18,color: Color(int.parse(
                                    _dataUser.getKey(Utility.FontColor), ))))):   
          _check == 1?    Expanded(
                      child: ListView.builder(
                          itemCount:  mychats.data.chats.length,
                          itemBuilder: (BuildContext context, index) {
                            return// WidgetANimator(
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
return FrindsChatPage(chat: mychats.data.chats[index]);
                                  }));
                                },
                                                              child: GroubItem(
                                 Utility.BaseURL+mychats.data.chats[index].userImage,
                                  mychats.data.chats[index].userName,
                                       mychats.data.chats[index].description,
                                  mychats.data.chats[index].story,
                                    "",
                                    ""),
                              );
                           // );
                          }//),
                    ),
          ):Container():Center(
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
     //  }
       //  })
               
                ],
              ),
            );

  }
 @override
  void dispose() {
    super.dispose();
  }


}
