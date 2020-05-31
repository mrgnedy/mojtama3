//import 'dart:convert';
//import 'dart:io';
//
//import 'package:flutter/widgets.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
//import 'package:mojtam3/model/models/authModel.dart';
//import 'package:mojtam3/model/models/room.dart';
//import 'package:mojtam3/utillites/utillity_class.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:dio/dio.dart';
//
//class Auth with ChangeNotifier {
//  String _token;
//  String _errormessage = "";
//  AuthpModel _user;
//  Data _data;
//
//
//  AuthpModel get user => _user;
//
//  set user(AuthpModel value) {
//    _user = value;
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
//  ///----------- signup -----------------
//
//  Future<bool> signup(String name, String email, String password) async {
//    print("tttttttttttttttttttttttttt");
//    print(name);
//    print(email);
//    print(password);
//    final url = 'http://mojtama3.life/api/register';
//
//    final response = await http.post(
//      url,
//      body: {
//        'name': name.trim(),
//        'email': email.trim(),
//        'password': password.trim(),
//        'password_confirmation': password.trim(),
//      },
//    );
//
//    final responseData = json.decode(response.body);
//
//    if (responseData["msg"] == "success") {
//      _user = AuthpModel.fromJson(responseData);
//      saveAdvertiserDatainLocal(
//        name: _user.data.name,
//        email: _user.data.email,
//        apiToken: _user.apiToken,
//      );
//
//      return true;
//    } else if (responseData["msg"] == "error") {
//      errormessage = responseData["data"]["email"][0].toString();
//      return false;
//    }
//  }
//
//  ///------------------ login --------------------
//  ////////////////////////
//  Future<bool> AddRoom(String name, String descrition, String details,
//      String story, String lang, File imagefile) async {
//    SharedPreferences pref = await SharedPreferences.getInstance();
//    String token = pref.getString(Utility.TOKEN);
//    //String email = pref.getString(Utility.Email);
//    print("hhhhhhhhhhhhhhhhhhhhh");
//    print(imagefile.path.split('/').last);
//    print("Bearer ${token}");
//    Dio dio = new Dio();
//
//    FormData formData = FormData();
//    formData.fields..add(MapEntry('api_token', token));
//    formData.fields..add(MapEntry('name', name));
//    formData.fields..add(MapEntry('description', descrition));
//    formData.fields..add(MapEntry('story', story));
//    formData.fields..add(MapEntry('language', "english"));
//
//    formData.files.add(MapEntry('image',
//      await MultipartFile.fromFile(imagefile.path,
//    filename: imagefile.path.split('/').last
//      ),
//    ));
//
//
//
//    print("befor");
//    print("Bearer ${token}");
//    final response = await dio.post(
//      "http://mojtama3.life/api/rooms",
//      data: formData,
//      onSendProgress: (int sent, int total) {
//        print("$sent $total");
//      }
//    );
//    print("after");
//    print("ssssssssssssssssssssssssss");
//    print(response);
//    if (response.data["msg"] == "success") {
//    } else if (response.data["msg"] == "error") {
//      errormessage = response.data['data'].toString();
//      return false;
//    }
//  }
//
//  /////////////////////////
//  Future<bool> login(String email, String password) async {
//    print("tttttttttttttttttttttttttt");
//
//    print(email);
//    print(password);
//    final url = 'http://mojtama3.life/api/login';
//
//    final response = await http.post(
//      url,
//      body: {
//        'email': email.trim(),
//        'password': password.trim(),
//      },
//    );
//    print("saad1");
//    final responseData = json.decode(response.body);
//    print("saad2");
//    print(responseData);
//    if (responseData["msg"] == "success") {
//      _user = AuthpModel.fromJson(responseData);
//      print("saad3");
//      print(responseData);
//      saveAdvertiserDatainLocal(
//        name: _user.data.name,
//        email: _user.data.email,
//        apiToken: _user.apiToken,
//      );
//
//      return true;
//    } else if (responseData["msg"] == "error") {
//      print("auth2");
//      errormessage = responseData['data'].toString();
//      return false;
//    }
//    notifyListeners();
//  }
//
/////////////////////////////////////
//
//  Future<bool> getUser() async {
//
//    SharedPreferences pref = await SharedPreferences.getInstance();
//    String token = pref.getString(Utility.TOKEN);
//
//
//    final url = 'http://mojtama3.life/api/profile';
//
//    final response = await http.get(url, headers: {
//      'Authorization': 'Bearer ${token.trim()}',
//    });
//    print("khaled1");
//    final responseData = json.decode(response.body);
//print("khaled2");
//    print(responseData);
//
//    user = AuthpModel.fromJson(
//        {'api_token': token, 'Data': responseData, 'msg': "success"});
//    print("//////////////////////////////////////////////");
////    print(user.data.roomsTalk[0].toJson());
//    notifyListeners();
//
//  }
//
//  //////////////////////////////////
//  void saveAdvertiserDatainLocal({
//    String name,
//    String email,
//    String apiToken,
//  }) async {
//    print("save in shared prefrance");
//    SharedPreferences pref = await SharedPreferences.getInstance();
//    pref.setString(Utility.Name, name.trim());
//    pref.setString(Utility.Email, email.trim());
//
//    if (apiToken != null && apiToken.length > 0)
//      pref.setString(Utility.TOKEN, apiToken.trim());
//  }
//}
