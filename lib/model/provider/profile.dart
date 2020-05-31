//import 'dart:convert';
//
//import 'package:flutter/widgets.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
//import 'package:mojtam3/model/models/profileModel.dart';
//import 'package:mojtam3/utillites/utillity_class.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//class Profile with ChangeNotifier {
//
//  String _errormessage ="";
//  PrfileModel _Profile_Info;
//
//
//int i = 0 ;
//
//
//
//
//  PrfileModel get Profile_Info => _Profile_Info;
//
//  set Profile_Info(PrfileModel value) {
//    _Profile_Info = value;
//    print("profile info");
//    notifyListeners();
//  }
//
//  String get errormessage => _errormessage;
//
//  set errormessage(String value) {
//    _errormessage = value;
//    print("get message");
//    notifyListeners();
//  }
//
//  ///----------- get profile -----------------
//
//  Future<void> getProfile() async {
//print("get profile");
//    SharedPreferences pref = await SharedPreferences.getInstance();
//    final url =
//        'http://mojtama3.life/api/profile?api_token=${pref.get(Utility.TOKEN)}';
//
//    final response = await http.get(
//      url
//
//
//    );
//
//    final responseData = json.decode(response.body);
//
//print(responseData);
//    _Profile_Info=PrfileModel.fromJson(responseData);
//
//
//  }
//  ///------------------ login --------------------
//  ///
//
//  //////////////////////////////////
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
