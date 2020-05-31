import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/screens/authScreen/login_page.dart';
import 'package:mojtam3/tabs_page.dart';
import 'package:mojtam3/utillites/utillity_class.dart';

class RewritePassword extends StatefulWidget {
  String email; String text;
  RewritePassword({this.email,this.text});

  @override
  _RewritePasswordState createState() => _RewritePasswordState();
}

class _RewritePasswordState extends State<RewritePassword> {
  final _formKey = GlobalKey<FormState>();
  String password="-1",confirmPassword="-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          /// -------------background-----------
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                children: <Widget>[
                  /// -------------logo-----------
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 15,
                            bottom: MediaQuery.of(context).size.height / 16),
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Image.asset("assets/logo.png")),
                  ),
                  /// ------------- bassword recovery logo -----------
                  Container(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 12),
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Rectangle2.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Text(AppLocalizations.of(context).lblChangePassword,
                        style: TextStyle(
                          fontFamily: "black",
                        )),
                  ),

                  //phone number text faild

                  //password text faild

                  /// -------------new password-----------
                  TextFormField(
                    onSaved: (value){
                      setState(() {
                        password = value;
                      });

                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context)
                            .lblSetsthenewpassword;
                      }else if (value.length<6){
                        return "كلمة المرور لابد ان تكون اكبر من 7 احرف";
                      }
                      return null;
                    },
                    obscureText: true,
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    //  textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        suffixIcon: Image.asset("assets/images/hide.png"),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: "black"),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText:
                            AppLocalizations.of(context).lblSetsthenewpassword,
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /// ------------- confirm new password-----------
                  TextFormField(
                    onSaved: (value){
                      setState(() {
                       confirmPassword = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context)
                            .lblConfirmthenewpassword;
                      }

                      return null;
                    },
                    obscureText: true,
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    //  textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        suffixIcon: Image.asset("assets/images/hide.png"),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: "black"),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: AppLocalizations.of(context)
                            .lblConfirmthenewpassword,
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  ///------------save bottom --------------
                  GestureDetector(
                    onTap: () {
                      valdatite();

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 8,
                          right: 5,
                          left: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalizations.of(context).lblSave,
                        style: TextStyle(fontFamily: "black"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void valdatite() {
    //////////////////// لسه حتة الباسورد /////////

      if(_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if(password!=confirmPassword){
      Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblwronginfo,DialogType.ERROR,context)    ;
          return ;
        }
        print("ooooooooooooooooooooooooooooooooooooooooo"+widget.text);
        print("ppppppppppppppppppppppppppppppppppppp"+widget.email);

ApiRequests apiRequests = new ApiRequests();
apiRequests.sendnewpassword(widget.email,widget.text,password).then((value){
if(value=="success"){
Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (Route<dynamic> route) => false);
}
else if(value=="error"){
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblwronginfo,DialogType.ERROR,context)    ;
   return;
}else{
   Utility.showErrorDialog( AppLocalizations.of(context).lblerror, AppLocalizations.of(context).lblNoInternetConnection,DialogType.WARNING,context)    ;
   return;
}
});





          
      }
  }
  //    void _showEr rorDialog(String message) {
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
                   
  //                   Navigator.of(ctx).pop();
  //                 },
  //               )
  //             ],
  //           )

  //   );
  // }
}
