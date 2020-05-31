//import 'dart:async';
//import 'dart:convert';
//import 'dart:core' as prefix0;
//import 'dart:core';
//
//import 'package:flutter/widgets.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
//import 'package:mojtam3/model/models/profileModel.dart';
//import 'package:mojtam3/model/models/rooms_model.dart';
//import 'package:mojtam3/utillites/utillity_class.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//class Rooms with ChangeNotifier {
//
//  String _errormessage ="";
//  RoomsModel _Rooms_Model;
//
//
//
//
//
//  RoomsModel get Rooms_Model => _Rooms_Model;
//
//  set Rooms_Model(RoomsModel value) {
//    _Rooms_Model = value;
//    print("rooms");
//    notifyListeners();
//  }
//
//  String get errormessage => _errormessage;
//
//  set errormessage(String value) {
//    _errormessage = value;
//    notifyListeners();
//  }
//
//  ///----------- get profile -----------------
//
//
/////------------------ login --------------------
/////
//
////////////////////////////////////
////  void saveAdvertiserDatainLocal({String name, String email,
////    String apiToken,
////  }) async
////  {
////    SharedPreferences pref = await SharedPreferences.getInstance();
////    pref.setString(Utility.Name, name);
////    pref.setString(Utility.Email, email);
////    pref.setString(Utility.TOKEN, apiToken);
////
////
////  }
//
//}
