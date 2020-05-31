import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mojtam3/ApiRequests.dart';

import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/iccolade_item.dart';
import 'package:mojtam3/model/models/personModel.dart';
import 'package:mojtam3/model/models/profileModel.dart';

import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/model/provider/gallary_page.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/Edite_profile.dart';
import 'package:mojtam3/screens/TabsPages/main_page_tab/invite_friends.dart';
import 'package:mojtam3/utillites/circle_progess.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:toast/toast.dart';



class PersonProfilePage2 extends StatefulWidget {
  final String id;
  
  PersonProfilePage2({this.id});

  @override
  _PersonProfilePage2State createState() => _PersonProfilePage2State();
}

class _PersonProfilePage2State extends State<PersonProfilePage2> {
  String dropdownValue = 'اللغات';
 PersonModel profile;
  
  bool isLoading = false;

  DataUser _dataUser = DataUser.instance;

  // var scaffoldKey = new GlobalKey<ScaffoldState>();
  ApiRequests apiRequests = new ApiRequests();
bool  _isLoading=false;
  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }
@override
  void setState(fn) {
    // TODO: implement setState
  if(this.mounted)
  super.setState(fn);
  }
  @override
  void initState() {
    //imageCache.clear();
    print("--------------profile---------------");
    print(widget.id);
     setState(() {
      //  profile = value;
        isLoading = true;
      });
    apiRequests.getpersonprofiletoken(widget.id).then((value) {
      print("---------------------------tiger---------------");
      print(value);
      setState(() {
        profile = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    getData();
  
   
        return Scaffold(
          backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          body:


                   SingleChildScrollView(
                    child: isLoading?CircularProgressIndicator(backgroundColor: Colors.teal,):profile==null?
                    Align(
                      alignment: Alignment.center,
                                          child: Center(
                        
                      child: Text(
                        AppLocalizations.of(context).lblNoInternetConnection,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "thin",
                            color: Color(int.parse(
                              _dataUser.getKey(Utility.FontColor),
                            ))),
                      ),
                  ),
                    ): Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      mainAxisAlignment: MainAxisAlignment.start ,
                      children: <Widget>[
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width ,
                          padding: EdgeInsets.only(top: 30) ,

                          ///padding: EdgeInsets.only(top: 10),
                          color: Colors.grey[800] ,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween ,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_back ,
                                          size: 25 ,
                                          color: Colors.white ,
                                        ) ,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        } ,
                                      ) ,
              
                                    ] ,
                                  ) ,
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20 , right: 20) ,
                                    padding: EdgeInsets.only(
                                        left: 5 , right: 5) ,
                                    child: Text(
                                      AppLocalizations
                                          .of(context)
                                          .lblActivenow ,
                                      style: TextStyle(
                                          fontFamily: "black" ,
                                          fontSize: 10 ,
                                          height: 1.5 ,
                                          color: Colors.white) ,
                                    ) ,
                                    decoration: BoxDecoration(
                                        color: profile.user.isActive==0?Colors.black: Colors.green[400] ,
                                        borderRadius: BorderRadius.circular(
                                            5)) ,
                                  ) ,
                                ] ,
                              ) ,
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround ,
                                crossAxisAlignment: CrossAxisAlignment.start ,
                                children: <Widget>[
                                  Container(
                                  margin: EdgeInsets.only(
                                                top: 12) ,
                                    child: Text(
                                     profile.user.level.toString() ,
                                      softWrap: false ,
                                      style: TextStyle(
                                          fontFamily: "black" ,
                                          fontSize: 17 ,
                                          color: Colors.grey) ,
                                    ) ,
                                  ) ,
                                  Container(
                                    child: CustomPaint(
                                      foregroundPainter: CircleProgress(
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height / 5 ,
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              .3 *
                                              .2 ,
                                double.parse(profile.user.precent.toString())          ) ,
                                      child: ClipOval(
                                          child: CachedNetworkImage(
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  .3 *
                                                  .3 ,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height /
                                                  5 *
                                                  .44 ,
                                             
                                               placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
                                              imageUrl: Utility.BaseURL +profile.user.image
                              

                                              ,
                                              fit: BoxFit.fill)) ,
                                    ) ,
                                  ) ,
                                  Container(
                                     margin: EdgeInsets.only(
                                                top: 12) ,
                                    child: Text(
                                      ( profile.user.level+1).toString(),
                                      style: TextStyle(
                                          fontFamily: "black" ,
                                          fontSize: 17 ,
                                          color: Colors.grey) ,
                                    ) ,
                                  ) ,
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center ,
                                children: <Widget>[

                                  Container(
                                      margin: EdgeInsets.only(top: 12) ,
                                      child: Text(
                                        profile.user.name ,
                                        style: TextStyle(
                                            fontFamily: "black" ,
                                            color: Colors.grey) ,
                                      )) ,
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12) ,
                                    child: Text(
                                      "${profile.user.precent}%" ,
                                      style: TextStyle(
                                          height: 1 ,
                                          fontFamily: "black" ,
                                          fontSize: 15 ,
                                          color: Colors.grey) ,
                                    ) ,
                                  )
                                ] ,
                              ) ,


                            ] ,
                          ) ,
                        ) ,
                        Padding(
                          padding: const EdgeInsets.only(right: 15 , left: 15) ,
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .lblAccolade ,
                            style: TextStyle(
                                fontSize: 12 ,
                                fontFamily: "thin" ,
                                color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
                          ) ,
                        ) ,
                        Container(
                          height: 55 ,
                          child: ListView.builder(
                              itemCount: profile.user.decorations.length ,
                              scrollDirection: Axis.horizontal ,
                              shrinkWrap: true ,
                              physics: ClampingScrollPhysics() ,
                              itemBuilder: (context , index) {
                                return Accolade(
                                    profile.user.decorations[index].decoration
                                        );
                              }) ,
                        ) ,
                        Padding(
                          padding: const EdgeInsets.only(right: 15 , left: 15) ,
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .lblMoment ,
                            style: TextStyle(
                                fontSize: 12 ,
                                fontFamily: "thin" ,
                                color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
                          ) ,
                        ) ,
                        Container(
                          height: 45 ,
                          child: ListView.builder(
                              itemCount: profile.user.stories.length ,
                              scrollDirection: Axis.horizontal ,
                              shrinkWrap: true ,
                              physics: ClampingScrollPhysics() ,
                              itemBuilder: (context , index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context){
                                      return GalleryPage(imagePath:profile.user.stories[index].story,);
                                    }));
                                  },
                                                                  child: Container(
                                    margin: EdgeInsets.only(left: 8 , right: 8) ,
                                    child: ClipOval(
                                        child:FadeInImage.assetNetwork(
  width: 45,
  // height: 55,
                                            placeholder: "assets/images/reload2.gif",
                                            image:
                                            Utility.BaseURL+profile.user.stories[index].story,
                                            fit: BoxFit.fill)) ,
                                  ),
                                );
                              }) ,
                        ) ,
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 15 , left: 15 , top: 12) ,
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .lblStatus ,
                            style: TextStyle(
                                fontSize: 12 ,
                                fontFamily: "thin" ,
                                color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
                          ) ,
                        ) ,
                        Container(
                          padding: EdgeInsets.only(right: 8 , left: 8) ,
                          margin: EdgeInsets.only(left: 15 , right: 15) ,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width ,
                          decoration: BoxDecoration(
                            color: Colors.grey[50] ,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey ,
                                blurRadius: 5.0 ,
                              ) ,
                            ] ,
                            shape: BoxShape.rectangle ,
                            borderRadius: BorderRadius.circular(8) ,
                            border: new Border.all(color: Colors.grey) ,
                          ) ,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8 , right: 8 , top: 8 , bottom: 8) ,
                            child: Text(
                              profile.user.yourMind??'برجاء ادخل حالتك ' ,
                              style: TextStyle(
                                  color: Colors.grey ,
                                  fontSize: 12 ,
                                  fontFamily: "thin") ,
                            ) ,
                          ) ,
                        ) ,
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 15 , left: 15 , top: 6) ,
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .lblSerialNumber ,
                            style: TextStyle(
                                fontSize: 12 ,
                                fontFamily: "thin" ,
                                color:Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
                          ) ,
                        ) ,
                        Container(
                          padding: EdgeInsets.only(right: 8 , left: 8) ,
                          margin: EdgeInsets.only(left: 15 , right: 15) ,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width ,
                          decoration: BoxDecoration(
                            color: Colors.grey[50] ,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey ,
                                blurRadius: 5.0 ,
                              ) ,
                            ] ,
                            shape: BoxShape.rectangle ,
                            borderRadius: BorderRadius.circular(8) ,
                            border: new Border.all(color: Colors.grey) ,
                          ) ,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8 , right: 8 , top: 8 , bottom: 8) ,
                                child: Text(
                                  profile.user.id.toString() ,
                                  style: TextStyle(
                                      color: Colors.grey ,
                                      fontSize: 12 ,
                                      fontFamily: "thin") ,
                                ) ,
                              ) ,
                              IconButton(
                                icon: Image.asset("assets/images/copy.png") ,
                                onPressed: () {
                                  Clipboard.setData(new ClipboardData(
                                      text: profile.user.id.toString()));
                                  Toast.show("Copy link" , context ,
                                      duration: Toast.LENGTH_SHORT ,
                                      gravity: Toast.BOTTOM);
                                } ,
                              )
                            ] ,
                          ) ,
                        ) ,
                        Padding(
                          padding: const EdgeInsets.only(right: 15 , left: 15) ,
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .lblLanguage ,
                            style: TextStyle(
                                fontSize: 12 ,
                                fontFamily: "thin" ,
                                color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
                          ) ,
                        ) ,
                        Container(
                          padding: EdgeInsets.only(right: 8 , left: 8) ,
                          margin: EdgeInsets.only(
                              bottom: 15 , left: 15 , right: 15) ,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width ,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey ,
                                blurRadius: 5.0 ,
                              ) ,
                            ] ,
                            color: Colors.grey[50] ,
                            shape: BoxShape.rectangle ,
                            borderRadius: BorderRadius.circular(8) ,
                            border: new Border.all(color: Colors.grey) ,
                          ) ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: <Widget>[
                              Text(dropdownValue , style: TextStyle(
                                  color: Colors.grey ,
                                  fontFamily: "thin" ,
                                  fontSize: 15
                              ) ,) ,
//                              PopupMenuButton<String>(
//                                icon: Icon(Icons.keyboard_arrow_down) ,
//                                onSelected: (value) =>
//                                    setState(() {
//                                      dropdownValue = value;
//                                    })
//                                ,
//                                itemBuilder: (BuildContext context) {
//                                  return image.user.data.langauges.map((
//                                      lang) {
//                                    return PopupMenuItem<String>(
//                                      value: lang.lang ,
//                                      child: Text(lang.lang) ,
//                                    );
//                                  }).toList();
//                                } ,
//                              ) ,


                            ] ,
                          ) ,

                        ) ,
                       _isLoading?CircularProgressIndicator(): 
                       
                    widget.id.toString()!= _dataUser.getKey(Utility.ID)?  GestureDetector(
                          onTap: () {
                            setState(() {
                              _isLoading=true;
                            });
                            if(profile.user.isFriend==0){
                              
                              apiRequests.requestfriend(profile.user.id.toString()).then((value){
                                if(value!=null){


if(value=="success"){
      setState(() {
                      _isLoading = false;
                    });
   Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblTheFriendShipRequestHasBeenSent,DialogType.SUCCES,context);


}else if(value=="user not found" ){
      setState(() {
                      _isLoading = false;
                    });
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendnotfound,DialogType.ERROR,context);
}else{
      setState(() {
                      _isLoading = false;
                    });
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblYouAreAlreadyFriend,DialogType.ERROR,context);
}
                                }else{
                                   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                                }
                              });
                            }else{
            apiRequests.cancelfrien(profile.user.id.toString()).then((value){



                                if(value!=null){


if(value=="success"){
       setState(() {
                      _isLoading = false;
                    });
   Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblcancelfriend,DialogType.SUCCES,context);


}else if(value=="user not found" ){
    setState(() {
                      _isLoading = false;
                    });
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendnotfound,DialogType.ERROR,context);
}else{
    setState(() {
                      _isLoading = false;
                    });
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendrefuse,DialogType.ERROR,context);
}
                                }else{
                                    setState(() {
                      _isLoading = false;
                    });
                                   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
                                }
// _showErrorDialog("succes");
                              });




                          } },
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width ,
                            margin: EdgeInsets.only(
                                left: 15 , right: 15 , top: 15) ,
                            height: 45 ,
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30) ,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey ,
                                    blurRadius: 5.0 ,
                                  ) ,
                                ] ,
                                color: Colors.teal[600]) ,
                            child: Text(profile.user.isFriend==1?"الغاء الصداقة": AppLocalizations
                                .of(context)
                                .  lblFriendRequest ,
                                style: TextStyle(
                                    fontFamily: "black" ,
                                    color: Colors.white)) ,
                          ) ,
                        ) :Container(),
                     
                      ] ,
                    ) ,
                  )



          ) ;}
        


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
  //                   setState(() {
  //                     _isLoading = false;
  //                   });
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           )

  //   );
  // }


      }






