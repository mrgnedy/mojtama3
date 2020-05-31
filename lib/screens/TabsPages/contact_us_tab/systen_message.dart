import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/SystemMessagesModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class SystemMessage extends StatefulWidget {
  @override
  _SystemMessageState createState() => _SystemMessageState();
}

class _SystemMessageState extends State<SystemMessage> {
  ApiRequests apiRequests = new ApiRequests();
  bool is_loading = false;
  DataUser _dataUser = DataUser.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(
        _dataUser.getKey(Utility.BackGroundColor),
      )),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  Utility.BaseURL + _dataUser.getKey(Utility.ProfileImage),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Color(int.parse(
                  _dataUser.getKey(Utility.FontColor),
                )),
              ),

              fit: BoxFit.fill,
              //  width: MediaQuery.of(context).size.width/3-40,
            ),
          ),
        ),
        title: Text(
          "التنبيهات",
          style:
              TextStyle(fontSize: 14, fontFamily: "black", color: Colors.white),
        ),
      ),
      body: FutureBuilder<SystemMessagesModel>(
          future: apiRequests.getSystemMessages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              ));
            if (snapshot.connectionState == ConnectionState.done) {
           if(snapshot.data==null)
{
  return Center(child: Text(AppLocalizations.of(context).lblNoInternetConnection,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),);
} else
                return snapshot.data.data.messages.length == 0
                    ?  Center(child: Text(AppLocalizations.of(context).lblNoSystemMessages,style: TextStyle(  fontSize: 18,
                        fontFamily: "thin",   color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),),)
                    : ListView.builder(
                        itemCount: snapshot.data.data.messages.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height/10,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),

                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.teal),
                                borderRadius: BorderRadius.circular(30)),

                            child: Text(
                              snapshot.data.data.messages[index].message,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "black",
                                  color: Color(int.parse(
                                    _dataUser.getKey(Utility.FontColor),
                                  ))),
                            ),
                          );
                        });
            }
          }),
    );
  }
}
