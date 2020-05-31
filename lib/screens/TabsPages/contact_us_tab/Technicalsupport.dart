import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Technicalsupport extends StatefulWidget {
  @override
  _TechnicalsupportState createState() => _TechnicalsupportState();
}

class _TechnicalsupportState extends State<Technicalsupport> {
  DataUser _dataUser=DataUser.instance;
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
                                            child:
                      
                      
                                          ClipOval(
                                                    child: CachedNetworkImage(
              imageUrl:
                  Utility.BaseURL + _dataUser.getKey(Utility.ProfileImage),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error,color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),)),),
               
               fit: BoxFit.fill,
              //  width: MediaQuery.of(context).size.width/3-40,
            ))
                      
                      
                      
                      
                                        ),
                                        
                                        
                                        
                                        title:    Text(
                                                          AppLocalizations.of(context)
                                                              .lblTechnicalsupport,
                                                          style: TextStyle(
                                                              fontSize: 14, fontFamily: "black",
                                                              color: Colors.white),
                                                              
                                                        ),
                                        
                                        
                                        
                                        
                                        ),


                     body: Container(
                       width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
                       child:   IndexedStack(
index: _stackToView,
                                                 children: [
          Column(
            children: < Widget > [
              Expanded(
                child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: "https://tawk.to/chat/5dfa04d3d96992700fccd824/default",
                  onPageFinished: _handleLoad,
                )
              ),
            ],
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(backgroundColor:Colors.red),
            ),
          ),
        ],
      )
                       ),                   
      
    );
  }
}