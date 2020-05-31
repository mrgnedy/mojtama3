import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';

import 'package:mojtam3/screens/authScreen/login_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';


class ChangeEmailPassword extends StatefulWidget {
  @override
  _ChangeEmailPasswordState createState() => _ChangeEmailPasswordState();
}

class _ChangeEmailPasswordState extends State<ChangeEmailPassword> {
  ApiRequests apiRequests = new ApiRequests();
   DataUser _dataUser = DataUser.instance;
    final _formKey = GlobalKey<FormState>();
   bool is_loading=false;
   String email;
   String  oldpassword;
   String newpassword;
   String confirmpassword;
  @override
  Widget build(BuildContext context) {
    
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
              AppLocalizations.of(context).lblChangeEmailandPassword,
              style: TextStyle(fontFamily: "thin", fontSize: 14,color: Colors.white),
            ),
          ),
          body: Form(
            key:_formKey ,
                      child: SingleChildScrollView(
              child:is_loading?Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,)): Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblemail,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "black",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        child: TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value, true)) {
                              return AppLocalizations.of(context).lblemail;
                            }

                          //  return null;
                          },
                          onSaved: (value){
email=value;
                          },

                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "thin"),

                          //s textAlign: TextAlign.right,

                          decoration: InputDecoration.collapsed(
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: "thin"),
                            hintText: AppLocalizations.of(context).lblemail,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblOldPassword,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "black",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .lblOldPassword;
                                }

                              //  return null;
                              },
                          onSaved: (value){
oldpassword=value;
                          },
                              cursorColor: Colors.white,
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "thin"),

                              //s textAlign: TextAlign.right,

                              decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: "thin"),
                                hintText:
                                    AppLocalizations.of(context).lblOldPassword,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblSetsthenewpassword,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "black",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .lblSetsthenewpassword;
                                }

                                //return null;
                              },
                 onSaved: (value){
newpassword=value;
                          },
                              cursorColor: Colors.white,
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "thin"),

                              //s textAlign: TextAlign.right,

                              decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: "thin"),
                                hintText: AppLocalizations.of(context)
                                    .lblSetsthenewpassword,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblConfirmthenewpassword,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "black",
                            color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      margin: EdgeInsets.only(bottom: 12, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: new Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .lblConfirmthenewpassword;
                                }

                             //   return null;
                              },
                onSaved: (value){
confirmpassword=value;
                          },
                              cursorColor: Colors.white,
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "thin"),

                              //s textAlign: TextAlign.right,

                              decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: "thin"),
                                hintText: AppLocalizations.of(context)
                                    .lblConfirmthenewpassword,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String message=await apiRequests.DeleteProfile() ;
                        if(message=="Unauthenticated"){
                        print("Unauthenticated");
                        }else if(message=="The Profile Has Been Deleted"){
                          print("The Profile Has Been Deleted");
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }), (Route<dynamic> route) => false);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(AppLocalizations.of(context).lblDeleteAccount,
                            style: TextStyle(
                              fontFamily: "black",
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        valdatee();
                      },
                                        child: Container(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 30),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Rectangle2.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Text(AppLocalizations.of(context).lblSave,
                            style: TextStyle(
                              fontFamily: "black",
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
   
  }
  valdatee(){
 if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      if(newpassword!=confirmpassword){
     Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblpassword,DialogType.ERROR,context);
        return ;
      }
      else{
        setState(() {
          is_loading=true;
        });
        apiRequests.changeemailandpassword(email, oldpassword, newpassword).then((value){
          print("-----------------value");
          setState(() {
          is_loading=false;
        });
          if(value==null){
            Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context);
    
          }else if(value=="processsucess"){
              Utility.showErrorDialog( AppLocalizations.of(context).lblsuccess, AppLocalizations.of(context).lblsuccess,DialogType.SUCCES,context);
          }else if(value=="wrongpassword"){
 Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblpassword,DialogType.ERROR,context);
          }else if(value=="emailtekan"){
            Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblemailalreadyused,DialogType.ERROR,context);
          }
           

        });
      }
 }
}
}
