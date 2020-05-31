import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/screens/rewrite_password.dart';

import 'package:pin_input_text_field/pin_input_text_field.dart';

class ValidationCodePage extends StatefulWidget {
  String email;
  String code;
  ValidationCodePage({this.email,this.code});

  @override
  _ValidationCodePageState createState() => _ValidationCodePageState();
}

class _ValidationCodePageState extends State<ValidationCodePage> {
  final _formKey = GlobalKey<FormState>();
  static final int _pinLength = 4;
  Timer _timer;
  int _start = 59;



  static final TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  PinEditingController _pinEditingController =
      PinEditingController(pinLength: _pinLength, autoDispose: false);

  PinDecoration _pinDecoration = UnderlineDecoration(
      textStyle: _textStyle,
      enteredColor: Colors.white,
      color: Color(0xff969696));
      bool isLoading = false;

  bool _enable = true;

  @override
  void initState() {
    //_setPinValue();
    startTimer();
    _pinEditingController.addListener(() {
      debugPrint('changed pin:${_pinEditingController.text}');
    });
    super.initState();
  }

  //--------------------------OutLine border for Container----------//



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          ///------------background----------------
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
                  ///-----------logo---------------
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Image.asset("assets/logo.png")),
                  ),
                  ///-------------- vertvcation logo ----------------
                GestureDetector(
                    onTap: () {
valdate();
                     
                    },child:  Container(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 8),
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Rectangle2.png"),
                          fit: BoxFit.fill),
                    ),
                    child:
                        Text(AppLocalizations.of(context).lblverificationcode,
                            style: TextStyle(
                              fontFamily: "black",
                            )),
                  )),
                  ///------------ pin input text -----------------
                  Container(
                    margin: const EdgeInsets.only(right: 50, left: 50),
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                    child: PinInputTextField(
                      pinLength: _pinLength,
                      decoration: _pinDecoration,
                      pinEditingController: _pinEditingController,
                      autoFocus: true,
                      textInputAction: TextInputAction.go,
                      enabled: _enable,
                      
                      onSubmit: (pin) {
                        debugPrint('submit pin:$pin');
                        print("hhhhh" + pin);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text("00:$_start",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "black",
                            color: Colors.white)),
                  ),
                  Text(AppLocalizations.of(context).lblresend,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "black",
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                 isLoading?CircularProgressIndicator(): GestureDetector(
                    onTap: () {
valdate();
                     
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.only(
                          // top: MediaQuery.of(context).size.height / 3.5,
                          right: 5,
                          left: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalizations.of(context).lblVerification,
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

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            print("new code was send");
            valdate();
            _start = 59;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _pinEditingController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void valdate() {
    setState(() {
      isLoading==true;
    });
    if(_pinEditingController.text.length==4)
    {
ApiRequests apiRequests = new ApiRequests();
apiRequests.verfiypcode(widget.email, _pinEditingController.text).then((value){
if(value=="success"){
    setState(() {
      isLoading==true;
    });
 Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return RewritePassword(email:widget.email,text: _pinEditingController.text);
                      }), (Route<dynamic> route) => false);
}
else if(value=="error"){
  _showErrorDialog(" برجاء ادخل كود صحيح");
  return ;
}
else{
 _showErrorDialog(" تاكد من الاتصال بالنترنت");
  return ;
}
});






    }
    else{
      _showErrorDialog("برجاء ادخل الكود");
      return ;
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
