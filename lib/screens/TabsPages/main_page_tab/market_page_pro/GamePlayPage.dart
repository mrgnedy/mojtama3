import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/marketModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GmaePlay_Page extends StatefulWidget {
  final Games url;
  GmaePlay_Page({this.url});

  @override
  _GmaePlay_PageState createState() => _GmaePlay_PageState();
}

class _GmaePlay_PageState extends State<GmaePlay_Page> {
  DataUser _dataUser = DataUser.instance;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final _key = UniqueKey();
  num _stackToView = 1;
  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
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
          widget.url.name,
          style:
              TextStyle(fontSize: 14, fontFamily: "black", color: Colors.white),
        ),
      ),
      body: Container(
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
                    initialUrl: widget.url.url,
                    onPageFinished: _handleLoad,
                  )),
                ],
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(backgroundColor: Colors.red),
                      Text('Loading game...'),
                      Text('It may take long')
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
