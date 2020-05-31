import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

import 'package:mojtam3/validation_code_page.dart';

class RememberPasswordPage extends StatefulWidget {
  @override
  _RememberPasswordPageState createState() => _RememberPasswordPageState();
}

class _RememberPasswordPageState extends State<RememberPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          ///--------- background -----------------
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

                  Center(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 15,
                            bottom: MediaQuery.of(context).size.height / 16),
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Image.asset("assets/logo.png")),
                  ),
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
                    child:
                        Text(AppLocalizations.of(context).lblPasswordRecovery,
                            style: TextStyle(
                              fontFamily: "black",
                            )),
                  ),
                  TextFormField(
                    onSaved: (value){

                      setState(() {
                        email = value;
                      });

                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context).lblenteremail;
                      } else if (  !EmailValidator.validate(value, true))
                      {
                        return "هذا ليس ايميل";
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: "black"),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: AppLocalizations.of(context).lblenteremail,
                        contentPadding: EdgeInsets.all(10)),
                  ),
               isLoading?CircularProgressIndicator(backgroundColor: Colors.teal,):   Align(
                    alignment: Alignment.bottomCenter,
                    child: //WidgetANimator(
                      GestureDetector(
                        onTap: () {
                          valdatite();

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3,
                              right: 5,
                              left: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            AppLocalizations.of(context).lblsend,
                            style: TextStyle(fontFamily: "black"),
                          ),
                        ),
                      ),
                   // ),
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

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
setState(() {
  isLoading=true;
});
ApiRequests apiRequests = new ApiRequests();

apiRequests.getvrivcationcod(email).then((value){
  if(value=='success'){
    setState(() {
  isLoading=false;
});
   Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return ValidationCodePage(email: email,);
          }), (Route<dynamic> route) => false);
  }else if(value=='error'){
        setState(() {
  isLoading=false;
});
 _showErrorDialog("هذا الايميل ليس موجود");
  }else{
        setState(() {
  isLoading=false;
});
     _showErrorDialog("تاكد من الاتصال بالانترنت");
  }
});
   
    }
  }
   void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx)=>
             AlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay',style: TextStyle(
                    color: Colors.teal
                  ),),
                  onPressed: () {
                   
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            )

    );
  }
}
