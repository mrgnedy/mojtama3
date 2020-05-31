import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:webview_flutter/webview_flutter.dart';

class payment extends StatefulWidget {
  final String url;
  payment({this.url});

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  DataUser _dataUser = DataUser.instance;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final _key = UniqueKey();
  num _stackToView = 1;
  void _handleLoad(String data) {
    print("-------------finish-----------------");
      print(data);
    List<String> parameters = data.substring(data.indexOf("?") + 1).split("&");
     for (String parameter in parameters) {
  List<String>  parts = parameter.split("=");
    String name = parts[0];
    print("-----------------------");
    print(name);
    print(parts[1]);
     }
   
     /////////////////////////////
     ///
     ///
     
     ///
     ///
     ////////////////////////
    setState(() {
      _stackToView = 0;
    });
//     Navigator.push(context, MaterialPageRoute(builder: (context){
// return ;
//     }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipOval(
                child: FadeInImage.assetNetwork(
                    height: MediaQuery.of(context).size.width / 3 - 40,
                    placeholder: "assets/soud.jpg",
                    image: Utility.BaseURL +
                        _dataUser.getKey(Utility.ProfileImage),
                    fit: BoxFit.fill))),
        title: Text(
          // AppLocalizations.of(context)
          //     .lblTechnicalsupport,
        "payment",
          style:
              TextStyle(fontSize: 14, fontFamily: "black", color: Colors.white),
        ),
      ),
      body:
       SingleChildScrollView(
                child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: IndexedStack(
              index: _stackToView,
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                        child: WebView(
                      key: _key,
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: widget.url,
                      onPageFinished: _handleLoad,
                    )),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(backgroundColor: Colors.red),
                        Text('Loading Page...'),
                        Text('It may take long')
                      ],
                    ),
                  ),
                ),
              ],
            )),
       ),
    );
  }
}
