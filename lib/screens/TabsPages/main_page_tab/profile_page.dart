import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mojtam3/ApiRequests.dart';

import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/iccolade_item.dart';
import 'package:mojtam3/model/models/profileModel.dart';

import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/model/provider/gallary_page.dart';

import 'package:mojtam3/screens/TabsPages/main_page_tab/Edite_profile.dart';
import 'package:mojtam3/tabs_page.dart';
import 'package:mojtam3/utillites/circle_progess.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

import 'package:toast/toast.dart';

class ProfilePage extends StatefulWidget {
  PrfileModel profileInfo;
  ProfilePage(this. profileInfo);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String dropdownValue = 'اللغات';
  DataUser _dataUser=DataUser.instance;
  bool isloading =false;
  ApiRequests _apiRequests = new ApiRequests();
  @override
  void initState() {
    // TODO: implement initState

    print("ddddddddddddddddddddddddddddd");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
//    getData();
  
   
        return Scaffold(
           backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          body:


                   SingleChildScrollView(
                    child: isloading?Center(child: Container(
                      
                      margin: EdgeInsets.only(top: 40),
                      child: CircularProgressIndicator(backgroundColor: Colors.teal))):Column(
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
                                      IconButton(
                                        icon: Image.asset(
                                          "assets/images/edit.png" ,
                                          height: 20 ,
                                          width: 20 ,
                                        ) ,
                                        onPressed: () {
                                          Navigator.push(context ,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    return EditeProfilePage(widget.profileInfo);
                                                  }));
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
                                        color: Colors.green[400] ,
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
                                      widget.profileInfo.level.toString() ,
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
                                double.parse(widget.profileInfo.precent.toString())          ) ,
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
                                              imageUrl: Utility.BaseURL +
                              _dataUser.getKey(Utility.ProfileImage)

                                              ,
                                              fit: BoxFit.fill)) ,
                                    ) ,
                                  ) ,
                                  Container(
                                     margin: EdgeInsets.only(
                                                top: 12) ,
                                    child: Text(
                                      ( widget.profileInfo.level+1).toString(),
                                      style: TextStyle(
                                          fontFamily: "black" ,
                                          fontSize: 17,
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
                                        widget.profileInfo.name ,
                                        style: TextStyle(
                                            fontFamily: "black" ,
                                            color: Colors.grey) ,
                                      )) ,
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12) ,
                                    child: Text(
                                      "${widget.profileInfo.precent}%" ,
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
                              itemCount: widget.profileInfo.decorations.length ,
                              scrollDirection: Axis.horizontal ,
                              shrinkWrap: true ,
                              physics: ClampingScrollPhysics() ,
                              itemBuilder: (context , index) {
                                return Accolade(
                                    widget.profileInfo.decorations[index].decoration
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
                                color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
                          ) ,
                        ) ,
                        Container(
                          height: 45 ,
                          child: ListView.builder(
                              itemCount: widget.profileInfo.stories.length ,
                              scrollDirection: Axis.horizontal ,
                              shrinkWrap: true ,
                              physics: ClampingScrollPhysics() ,
                              itemBuilder: ( context , index) {
                                return GestureDetector(
                                  onTap: (){
         Navigator.push(context,MaterialPageRoute(builder: (context){
                                      return GalleryPage(imagePath:widget.profileInfo.stories[index].story,);
                                    }));


                                  },
                                 
                                  onLongPress: (){
                                    print("-----------long press---------------");
//   
                                        final snackBar = SnackBar(
            content: GestureDetector(
              
              onTap: (){
                              setState(() {
                  isloading=true;
                });
                
snack(widget.profileInfo.stories[index].id.toString());



              },
              child: Text("Delete",style: TextStyle(color: Colors.red),)),
            
            action: SnackBarAction(
              label: 'Delete Story ',
              
              disabledTextColor: Colors.teal,
              onPressed: () {
                // Some code to undo the change.
//                 setState(() {
//                   isloading=true;
//                 });
                
// _apiRequests.deletestory(widget.profileInfo.stories[index].id.toString()).then((value){
//   print("----value---");
//   print(value);
//     setState(() {
//                   isloading=true;
//                 });
// });




                
              },
            ),
          );
Scaffold.of(context).showSnackBar(snackBar);
                                  },
                                                                  child: Container(
                                    margin: EdgeInsets.only(left: 8 , right: 8) ,
                                    child: ClipOval(
                                        child:FadeInImage.assetNetwork(
 width: 45,
                                            placeholder: "assets/images/reload2.gif",
                                            image:
                                            Utility.BaseURL+widget.profileInfo.stories[index].story,
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
                              widget.profileInfo.yourMind??'برجاء ادخل حالتك ' ,
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
                                color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))) ,
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
                                  widget.profileInfo.iD.toString() ,
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
                                      text: widget.profileInfo.iD.toString()));
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
                             PopupMenuButton<String>(
                               icon: Icon(Icons.keyboard_arrow_down) ,
                               onSelected: (value) =>
                                   setState(() {
                                     dropdownValue = value;
                                   })
                               ,
                               itemBuilder: (BuildContext context) {
                                 return  widget.profileInfo.langauges.map((
                                     lang) {
                                   return PopupMenuItem<String>(
                                     value: lang.lang ,
                                     child: Text(lang.lang) ,
                                   );
                                 }).toList();
                               } ,
                             ) ,


                            ] ,
                          ) ,

                        ) ,
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(context ,
                        //         MaterialPageRoute(builder: (context) {
                        //           return InviteFriends();
                        //         }));
                        //   } ,
                        //   child: Container(
                        //     width: MediaQuery
                        //         .of(context)
                        //         .size
                        //         .width ,
                        //     margin: EdgeInsets.only(
                        //         left: 15 , right: 15 , top: 15) ,
                        //     height: 45 ,
                        //     alignment: Alignment.center ,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(30) ,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey ,
                        //             blurRadius: 5.0 ,
                        //           ) ,
                        //         ] ,
                        //         color: Colors.teal[600]) ,
                        //     child: Text(AppLocalizations
                        //         .of(context)
                        //         .lblInvitefriends ,
                        //         style: TextStyle(
                        //             fontFamily: "black" ,
                        //             color: Colors.white)) ,
                        //   ) ,
                        // ) ,
                      ] ,
                    ) ,
                  )



          ) ;}

  void snack(String string) {

_apiRequests.deletestory(string).then((value){
  print("----value---");
  print(value);
    // setState(() {
    //               isloading=false;
    //             });
                  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) {
        return TabsPage();
      }), (Route<dynamic> route) => false);
});

  }
        





      }






