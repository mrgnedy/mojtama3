import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/game_item_2.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/myroomsPage.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class BuyProfileGifsPage extends StatefulWidget {
  final List<Gifs> gifs;
  final int isRoom ;
  BuyProfileGifsPage({this.gifs,this.isRoom});

  @override
  _BuyProfileGifsPageState createState() => _BuyProfileGifsPageState();
}

class _BuyProfileGifsPageState extends State<BuyProfileGifsPage> {
     DataUser _dataUser = DataUser.instance;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ApiRequests apiRequests = new ApiRequests();

        return Scaffold(
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
                AppLocalizations.of(context).lblBuyGIF,
                style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white,),
              ),
            ),
            body:  GridView.builder(
                      itemCount: widget.gifs.length,

                      itemBuilder: (ctx, i) => GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return MyDialog(gifid: widget.gifs[i].id.toString(),is_room:widget.isRoom);
                              });
                        }, //
                        child: //WidgetANimator(
                        GameItem2(
                            widget.gifs[i].coins +
                                "  " +
                                AppLocalizations.of(context).lblCoins +
                                "  ",
                            "",
                            Utility.BaseURL+widget.gifs[i].image),
                        //   ),
                      ),
                      // builder: (c) => products[i],

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 2.5,
                        mainAxisSpacing: 5,
                      ),
                    )
            
        );
            // ));
   
  }
}

class MyDialog extends StatefulWidget {
   final String gifid;
   final int is_room;
  MyDialog({this.gifid,this.is_room});

  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool _Check = false;
  String Friend_ID;
  bool isloading = false ;
    final _formKey = GlobalKey<FormState>();
  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx)=>
  //            AlertDialog(
  //             title: Text('An Error Occurred!'),
  //             content: Text(message),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('Okay',style: TextStyle(
  //                   color: Colors.teal
  //                 ),),
  //                 onPressed: () {
  //                   // setState(() {
  //                   //   _isLoading = false;
  //                   // });
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           )

  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
          child: isloading ?Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.teal,
                          ),
                        ):SimpleDialog(
        backgroundColor: Colors.grey[800],
        title: Align(
            alignment: Alignment.center,
            child: new Text(
              AppLocalizations.of(context).lblBuyGIF,
              style: TextStyle(color: Colors.white, fontFamily: "thin"),
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
                    color: _Check ? Colors.grey[200] : Colors.green),
                child: new SimpleDialogOption(
                  child: new Text("my self",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "black",
                          height: 2)),
                  onPressed: () {
                    if(widget.is_room==0){
                        setState(() {
                      print("hhhhhhhhhhhhhhhhhhjajsjjdas");
                      isloading=true;
                    });
ApiRequests apiRequests = new ApiRequests();
 DataUser _dataUser = DataUser.instance;
print("lllllllllllllllllllllllll");
print(_dataUser.getKey(Utility.ID));

apiRequests.butGIF(widget.gifid,_dataUser.getKey(Utility.ID).toString()).then((value){
  print("-------------gooood-----------------");
  print(value);
        setState(() {
                      isloading=false;
                    });
                                           if(value==null){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                              }else if(value=="success"){
                                Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoubuygif,DialogType.SUCCES,context);
                              }
                              else{
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouhavenocoin,DialogType.ERROR,context);
                              }
});












                    setState(() {
                      _Check = false;
                    });
                    }
                    else if(widget.is_room==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MyRoomsPage(gifid:widget.gifid, isid: 0,);
                      }));
                    }
                  
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
                    color: _Check ? Colors.green : Colors.grey[200]),
                child: new SimpleDialogOption(
                  child:  new Text(widget.is_room==0?"myFriend":"FriendRoom",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "black",
                          height: 2)),
                  onPressed: () {
                    print("mahmoud");
                    setState(() {
                      _Check = true;
                    });
                  },
                ),
              ),
            ],
          ),
          _Check
              ? Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 8, left: 8),
                margin:
                EdgeInsets.only(bottom: 12, left: 8, right: 8, top: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: new Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  onSaved: (value) {
                    setState(() {
                      Friend_ID = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppLocalizations.of(context).lblSerialNumber;
                    }
                  //  return null;
                  },

                  cursorColor: Colors.white,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  //  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: "black"),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: AppLocalizations.of(context).lblSerialNumber,
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: new SimpleDialogOption(
                  child: new Text("Send",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "black",
                          height: 2)),
                  onPressed: () {


  if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      
      
      
      
      
      
      setState(() {
                      isloading=true;
                    });
                    print("---------friend id");
                    print(Friend_ID);
                    if(widget.is_room==0){
                      ApiRequests apiRequests = new ApiRequests();
apiRequests.butGIFfriend(widget.gifid,Friend_ID).then((value){
  print("-------------ⓜⓞⓙⓣⓐⓜ③-----------------");
  print(value);
        setState(() {
                      isloading=false;
                    });
                                                                                                                 if(value==null){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                              }else if(value=="success"){
                                Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoubuygiffriend,DialogType.SUCCES,context);
                              }else if(value =="user not have coins"){
                                   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouhavenocoin,DialogType.ERROR,context);
                              }
                              else{
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendnotfound,DialogType.ERROR,context);
                              }
});
                    }else{

ApiRequests apiRequests = new ApiRequests();
 apiRequests.butroomGIF(widget.gifid,Friend_ID).then((value){
  print("-------------gooood-----------------");
  print(value);
        setState(() {
                      isloading=false;
                    });
                                                                                                                                   if(value==null){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                              }else if(value=="success"){
                                Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyoubuygiffriendroom,DialogType.SUCCES,context);
                              }else if(value =="user not have coins"){
                                   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblyouhavenocoin,DialogType.ERROR,context);
                              }
                              else{
                                  Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblwrongroomid,DialogType.ERROR,context);
                              }
});

                    }


      
      
      
      
      
      
      
      
      
      
      
      }

















 





                  },
                ),
              ),
            ],
          )
              : SizedBox()
        ],
      ),
    );
  }
}
/*
GridView.builder(
              itemCount: 20,

              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return MyDialog();
                      });
                }, //
                child: //WidgetANimator(
                    GameItem2(
                        "290" +
                            "  " +
                            AppLocalizations.of(context).lblRS +
                            "  ",
                        "",
                        "https://techcrunch.com/wp-content/uploads/2015/08/safe_image.gif"),
                //   ),
              ),
              // builder: (c) => products[i],

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 2.5,
                mainAxisSpacing: 5,
              ),
            ));
 */