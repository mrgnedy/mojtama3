import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/Widget/member_item.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:toast/toast.dart';

class InviteFriends extends StatefulWidget {
  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
 // int _check1 = 0;
 /// int _check2 = 0;
ApiRequests apiRequests =new ApiRequests();
bool _isLoading = false;
  DataUser _dataUser = DataUser.instance;
  TextEditingController _namecontroller = new TextEditingController();
   final _formKey = GlobalKey<FormState>();
bool is_loading = false;
  @override
  Widget build(BuildContext context) {

        return Scaffold(
        backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
          appBar: new AppBar(
            backgroundColor: Colors.grey[800],
            title: Text(
              AppLocalizations.of(context).lblInvitefriends,
              style: TextStyle(
                  fontSize: 20, fontFamily: "thin", color: Colors.white),
            ),

            //todo need to fix search how to max leading width
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Form(
 key: _formKey,

                      child:is_loading?Center(child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator())):SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[300],
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        // Text(
                        //   "شارك الرابط الخاص فيك مع مستخدمين جدد حقيقيين و اكسب المزيد من السمعة",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       fontFamily: "thin",
                        //       color: Colors.black,
                        //       height: 1.5,
                        //       fontSize: 14),
                        // ),
                        Container(
                          padding: EdgeInsets.only(right: 8, left: 8),
                          margin: EdgeInsets.only(top: 5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: new Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Image.asset("assets/images/copy.png"),
                                onPressed: () {

// apiRequests.increaselevel().then((value){
// print("--------------increase-------------");
// });





                                  Clipboard.setData(new ClipboardData(text:"https://play.google.com/store/apps/details?id=mojtam3.katab.com.mojtam3"));
                                  Toast.show("Copy link", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 8, bottom: 8),
                                child: Text(
                                  "https://play.google.com/store/apps/details?id=mojtam3.katab.com.mojtam3",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "thin"),
                                ),
                              ),
                              












                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15, right: 15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Row(
                  //         children: <Widget>[
                  //           Text(
                  //             AppLocalizations.of(context).lblWhoInviteMe,
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 height: 1,
                  //                 fontFamily: "thin",
                  //                 color: Colors.black),
                  //           ),
                  //           Text(
                  //             " (34) ",
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 height: 1,
                  //                 fontFamily: "thin",
                  //                 color: Colors.black),
                  //           ),
                  //         ],
                  //       ),
                  //       IconButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               _check1 == 1 ? _check1 = 0 : _check1 = 1;
                  //               print(_check1);
                  //             });
                  //           },
                  //           icon: Image.asset(
                  //             _check1 == 1
                  //                 ? "assets/images/arrow-point-to-up.png"
                  //                 : "assets/images/arrow-point-to-dowen.png",
                  //             height: 15,
                  //             width: 15,
                  //           )),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   height: _check1 == 1 ? MediaQuery.of(context).size.height : 0,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ListView.builder(
                  //       itemCount: 20,
                  //       itemBuilder: (BuildContext context, index) {
                  //         return MemberItem(
                  //           "شباب السعوديه",
                  //           "هذا النص هو مثال النص يمكن يستخدم في",
                  //           "assets/soud.jpg",
                  //         );
                  //       }),
                  // ),
                  // Divider(
                  //   height: 2,
                  //   color: Colors.black,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15, right: 15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Row(
                  //         children: <Widget>[
                  //           Text(
                  //             AppLocalizations.of(context).lblInvited,
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 height: 1,
                  //                 fontFamily: "thin",
                  //                 color:Colors.black),
                  //           ),
                  //           Text(
                  //             " (34) ",
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 height: 1,
                  //                 fontFamily: "thin",
                  //                 color: Colors.black),
                  //           ),
                  //         ],
                  //       ),
                  //       IconButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               _check2 == 1 ? _check2 = 0 : _check2 = 1;
                  //               print(_check2);
                  //             });
                  //           },
                  //           icon: Image.asset(
                  //             _check2 == 1
                  //                 ? "assets/images/arrow-point-to-up.png"
                  //                 : "assets/images/arrow-point-to-dowen.png",
                  //             height: 15,
                  //             width: 15,
                  //           )),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   height: _check2 == 1 ? MediaQuery.of(context).size.height : 0,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ListView.builder(
                  //       itemCount: 20,
                  //       itemBuilder: (BuildContext context, index) {
                  //         return MemberItem(
                  //           "شباب السعوديه",
                  //           "هذا النص هو مثال النص يمكن يستخدم في",
                  //           "assets/soud.jpg",
                  //         );
                  //       }),
                  // ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: <Widget>[
                       Container(
                                        width: MediaQuery.of(context).size.width /
                                            1.5,
                                            margin: EdgeInsets.only(top: 10),
                                                 decoration: BoxDecoration(
                                      borderRadius:new BorderRadius.all(  Radius.circular(15)),
                                         color: Colors.white,
                                    ),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return AppLocalizations.of(context)
                                                  .lblSerialNumber;
                                            }

                                            return null;
                                          },

                                          cursorColor: Colors.white,

                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),

                                          //s textAlign: TextAlign.right,
                                          
                                          controller: _namecontroller,
                                          onChanged: (value) =>
                                              _namecontroller.text + value,
                                              keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            
                                              hintStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                  fontFamily: "thin"),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              hintText:
                                                  AppLocalizations.of(context)
                                                      .lblSerialNumber,
                                              contentPadding: EdgeInsets.all(10)),
                                        ),
                                      ),
                             _isLoading?CircularProgressIndicator(backgroundColor: Colors.teal,):       GestureDetector(
                                        onTap: (){
valdate();
                                        },
                                                                              child: Container(
                                               width:80,
                                               
                          margin: EdgeInsets.only(left: 8, right: 8,bottom: 8,top: 10),
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment(-1.0, 1.0),
                                colors: [
                                  Colors.teal[900],
                                  Colors.teal[100],
                                  Colors.teal[900],
                                ]),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                                         ),
                                          child: Text("invited me" ,style: TextStyle(
                                                fontSize: 14, color: Colors.black))
                                        ),
                                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
    
  }

  void valdate() {
 if(_formKey.currentState.validate()){
      _formKey.currentState.save();
       setState(() {
                                      is_loading  = true;
                                    });
      apiRequests.increaselevel(_namecontroller.text).then((value){
             setState(() {
                                      is_loading  = false;
                                    });
        if(value==null){
Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
        }else if(value == "succes"){
 Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblyouinvitefriend,DialogType.SUCCES,context);
        }else if(value == "error"){
Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblcannotinvint,DialogType.ERROR,context);
        }
        else{
          Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblfriendnotfound,DialogType.ERROR,context);
        }
       

});
      
      
      }

  }
    void _showErrorDialog(String titel,String message) {
    showDialog(
        context: context,
        builder: (ctx)=>
            AlertDialog(
              title: Text(
                               titel ,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "thin",
                                    // color: Color(int.parse(
                                    //   _dataUser.getKey(Utility.FontColor),
                                    // ))
                                    ),
                              ),
              content:Text(
                               message ,
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
                  child: Text('Okay',style: TextStyle(
                      color: Colors.teal
                  ),),
                  onPressed: () {
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            )

    );
  }
}
