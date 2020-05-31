import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mojtam3/model/models/RoomMemmbersList.dart';
import 'package:mojtam3/model/models/SystemMessagesModel.dart';

import 'package:mojtam3/model/models/idesModel.dart';
import 'package:mojtam3/model/models/joinedRoom.dart';
import 'package:mojtam3/model/models/myRoomsModel.dart';
import 'package:mojtam3/model/models/personModel.dart';

import 'package:mojtam3/model/models/seachChatModel.dart';
import 'package:mojtam3/model/models/searchRoomModel.dart';
import 'package:mojtam3/model/models/updateModel.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
import 'package:multi_image_picker/src/asset.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mojtam3/model/models/marketModel.dart';

import 'model/models/authModel.dart';
import 'model/models/frindsrequestModel.dart';

import 'model/models/mychatsModel.dart';
import 'model/models/profileModel.dart';
import 'model/models/rooms_model.dart';
import 'model/models/saadModel.dart';
import 'model/models/conditionsModel.dart';
import 'model/provider/dataUser.dart';

class ApiRequests {
  ///=================== contact us page  ======================

  ///------------------get system message  in contact page page ------------------------
  Future<SystemMessagesModel> getSystemMessages() async {
    print("get room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("--------------get system message function b---------------");
    print(token);
    final url = 'http://mojtama3.life/api/messages';
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("--------------get system message function a---------------");
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData["msg"] == "success") {
        print("entereeeeeeeeeeeeeeeeeeeeeeee");
        var _data = SystemMessagesModel.fromJson(json.decode(response.body));
        print(_data);
        print("data");

        return _data;
      }
    } else {
      print("no inter net connection ");
      return null;
    }

    return null;
  }

  ///=================== discution page  =======================
  ///---------------------- get chat where join function -------------------
  Future<MyChats> getmyChatsWhereJoin() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/chatswherejoined';
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = MyChats.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      return null;
    }
  }

  ///=================== settings page  ========================
  Future<ConditionModel> getConditions() async {
    print("get room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/setting';

    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData["msg"] == "success") {
        print("entereeeeeeeeeeeeeeeeeeeeeeee");
        //  print(RoomsModel.fromJson(responseData));
        var _data = ConditionModel.fromJson(json.decode(response.body));
        print(_data);
        print("data");
        // print(_data.toJson());
        return _data;
        // return roomsModel.data;
      }
    } else {
      print("no inter net connection ");
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  ///------------------- get rooms in discover page -------------- -----------------
  Future<RoomsModel> getRomes() async {
    print("get room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    final url = 'http://mojtama3.life/api/rooms';

    print("=================get gromes function b----------------");
    print(token);
    // print("=================get gromes function b----------------");
try{
    
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("=================get gromes function a----------------");
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData["msg"] == "success") {
        print("entereeeeeeeeeeeeeeeeeeeeeeee");
        //  print(RoomsModel.fromJson(responseData));
        var _data = RoomsModel.fromJson(json.decode(response.body));
        print(_data);
        print("data");

        return _data;
      } else {
           final responseData = json.decode(response.body);
           print("-----------------else-------------------");
           print(responseData);


        return null;
      }
    } else {
      print("no inter net connection ");
      return null;
    }}catch(e){
      print("---------get rooms error");
      print(e);
      return null;
    }
  }

  ///=================== Signup page  =========================
  //------------- sign up function ------------------------
  Future<AuthpModel> signup(
      String name, String email, String password, String goodleToken) async {
    print("tttttttttttttttttttttttttt");
    print(name);
    print(email);
    print(password);
    final url = 'http://mojtama3.life/api/register';
    print("--------------------------------------1");
    try {
      print("------------- sign up function b------------------------");
      final response = await http.post(
        url,
        body: { 
          'name': name, //.trim(),
          'email': email, //.trim(),
          'password': password, //.trim(),
          'password_confirmation': password, //.trim(),
          'google_token': goodleToken,
        },
      );
      print("------------- sign up function a------------------------");

      print(response);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        if (responseData["msg"] == "success") {
          var signUpResponse = AuthpModel.fromJson(responseData);

          DataUser _dataUser = DataUser.instance;
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(Utility.BackGroundColor, Utility.WhiteColor);
          pref.setString(Utility.FontColor, Utility.BlackColor);
          pref.setString(Utility.roomNotify, signUpResponse.data.roomNotify.toString());
           pref.setString(Utility.chatNotify, signUpResponse.data.chatNotify.toString());
           pref.setString(Utility.messageNotify, signUpResponse.data.messageNotify.toString());
            _dataUser.setKey(
              {'key': Utility.messageNotify, 'value':  signUpResponse.data.messageNotify.toString()});
                _dataUser.setKey(
              {'key': Utility.roomNotify, 'value':  signUpResponse.data.roomNotify.toString()});
                _dataUser.setKey(
              {'key': Utility.chatNotify, 'value':  signUpResponse.data.chatNotify.toString()});
          _dataUser.setKey(
              {'key': Utility.BackGroundColor, 'value': Utility.WhiteColor});
          _dataUser
              .setKey({'key': Utility.FontColor, 'value': Utility.BlackColor});
          pref.setString(Utility.DarkMode, "false");
          _dataUser.setKey({'key': Utility.DarkMode, 'value': "false"});
          saveAdvertiserDatainLocal(
              name: signUpResponse.data.name,
              email: signUpResponse.data.email,
              apiToken: signUpResponse.apiToken,
              imageurl: signUpResponse.data.image,
              id: signUpResponse.data.iD.toString());
          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          var signUpResponse = AuthpModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("------------- sign up function error------------------------");

      print(e);
      return null;
    }
    return null;
  }

  ///=================== rewrite password  page  ============
  //   -------------resetpassword function --------------
  Future<String> sendnewpassword(
      String email, String code, String password) async {
    final url = 'http://mojtama3.life/api/reset_password';

    print(email);
    print(code);
    print(password);
    try {
      print("-------------resetpassword function b--------------");
      final response = await http.post(url, body: {
        'active_code':code.trim() ,
        'email': email.trim(),
        'password': password.trim(),
        'password_confirmation': password.trim(),
      }, headers: {
        'Accept': 'application/json'
      });
      print("-------------resetpassword function a--------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print(
          "-------------reset password function errorexeption --------------");
      print(e);
      return null;
    }
  }






  Future<String> deletestory(String storyId) async {
    final url = 'http://mojtama3.life/api/delstory';
  SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("-------delete story");
    print(storyId);
    try {
      print("---------------------vervied code function b------------------");

      final response = await http.post(url, body: {
        'story_id': storyId.trim(),
        'api_token':token
        //'active_code': code.trim(),
      }, headers: {
        'Accept': 'application/json'
      });
      print("---------------------vervied code function a------------------");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");

          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------verfied code function error --------------");
      print(e);
      return null;
    }
  }
  ///=================== verfied code password  page  ============
  //---------------------vervied code function ------------------
  Future<String> verfiypcode(String email, String code) async {
    final url = 'http://mojtama3.life/api/users/verify';

    print(email);
    try {
      print("---------------------vervied code function b------------------");

      final response = await http.post(url, body: {
        'email': email.trim(),
        'active_code': code.trim(),
      }, headers: {
        'Accept': 'application/json'
      });
      print("---------------------vervied code function a------------------");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");

          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------verfied code function error --------------");
      print(e);
      return null;
    }
  }

  ///=================== by id  page  ============
  //---------------------by id  function ------------------
  Future<String> butIdfriend(String gif_id, String user_id) async {
    final url = 'http://mojtama3.life/api/payids';

    print(gif_id);
    print(user_id);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("--------------------by id funcion b ------------------");
      final response = await http.post(url, body: {
        'special_id': gif_id.trim(),
        'user_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      print("--------------------by id funcion a ------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          return responseData["data"];
        }
      } else {
       // final responseData2 = json.decode(response.body);
        print("no internet conection ");
      //  print(responseData2);
        return "no internet conection ";
      }
    } catch (e) {
      print("--------------------by id funcion error ------------------");
      print(e);
      return null;
    }
  }
  //---------------------by id me function ------------------

  Future<String> butId(String gif_id, String user_id) async {
    final url = 'http://mojtama3.life/api/payids';
    print(gif_id);
    print(user_id);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("--------------------by id me funcion b ------------------");
      final response = await http.post(url, body: {
        'special_id': gif_id.trim(),
        'user_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      print("--------------------by id me funcion a ------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          print(responseData["data"]["ids_payments"]["user_id"]);

          DataUser _dataUser = DataUser.instance;
          _dataUser.setKey({
            'key': Utility.ID.toString(),
            'value': responseData["data"]["ids_payments"]["user_id"].toString()
          });
          print("-------after data user-------------------");
          pref.setString(Utility.ID,
              responseData["data"]["ids_payments"]["user_id"].toString());
          print("-------after sharedprfrance-------------------");
          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return responseData["data"] ;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------by id for me function  --------------");
      print(e);
      return null;
    }
  }

  ///=================== by gif  page  ============
  //---------------------by gif  function ------------------
  Future<String> butGIFfriend(String gif_id, String user_id) async {
    final url = 'http://mojtama3.life/api/paygifs';

    print(gif_id);
    print(user_id);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("---------------------by gif  function a------------------");
      final response = await http.post(url, body: {
        'gif_id': gif_id.trim(),
        'user_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("---------------------by gif  function b------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return responseData["data"];
        }
      } else {
        print("no internet conection ");
        return "no internet conection";
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  //---------------------by gif me function ------------------
  Future<String> butGIF(String gif_id, String user_id) async {
    final url = 'http://mojtama3.life/api/paygifs';

    print(gif_id);
    print(user_id);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("-------------------- by gif me function b ------------------");
      final response = await http.post(url, body: {
        'gif_id': gif_id.trim(),
        'user_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      print("-------------------- by gif me function a ------------------");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          print(responseData["data"]["gifs_payments"]["gif"]);
          DataUser _dataUser = DataUser.instance;
          _dataUser.setKey({
            'key': Utility.ProfileImage,
            'value': responseData["data"]["gifs_payments"]["gif"]
          });
          pref.setString(Utility.ProfileImage,
              responseData["data"]["gifs_payments"]["gif"]);
          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return "user not have coins";
        }
      } else {
        print("no internet conection gif me");
        final responseData2 = json.decode(response.body);
        print(responseData2);
        return "no internet conection ";
      }
    } catch (e) {
      print("-------------by fig me function error --------------");
      print(e);
      return null;
    }
  }

  ///=================== by room id  page  ============
  //---------------------by room id  function ------------------
  Future<String> butroomId(String gif_id, String user_id) async {
    final url = 'http://mojtama3.life/api/payids';

    print(gif_id);
    print(user_id);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("---------------------by room id  function b------------------");
      final response = await http.post(url, body: {
        'special_id': gif_id.trim(),
        'room_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("---------------------by room id  function a------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return responseData["data"];
        }
      } else {
        print("no internet conection ");
        return "no internet conection ";
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///=================== by room gif  page  ============
  ///
  ///
  ///
  ///
  //----------------spical room posstion-----------------
    Future<String> spicalrom(String topid, String roomid,String pp) async {
    final url = 'http://mojtama3.life/api/tops';

    // print(gif_id);
    // print(user_id);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("---------------------by room id  function b------------------");
      final response = await http.post(url, body: {
        'top_id': topid.trim(),
        'room_id': roomid,
        'place':pp
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("---------------------by room id  function a------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return responseData["data"];
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }
  //----------------------
    Future<String> leaveRoom(String userId, String roomId) async {
    final url = 'http://mojtama3.life/api/out/room';

   

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("--------------------by id funcion b ------------------");
      final response = await http.post(url, body: {
        'user_id': userId.trim(),
        'room_id': roomId
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      print("--------------------by id funcion a ------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          return responseData["data"];
        }
      } else {
        print("no internet conection ");
        return "no internet conection ";
      }
    } catch (e) {
      print("--------------------by id funcion error ------------------");
      print(e);
      return null;
    }
  }
  //---------------------by room gif  function ------------------
  Future<String> butroomGIF(String gif_id, String user_id) async {
    final url = 'http://mojtama3.life/api/paygifs';
    print(gif_id);
    print(user_id);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print(token);

    try {
      print("---------------------by room gif  function b------------------");
      final response = await http.post(url, body: {
        'gif_id': gif_id.trim(),
        'room_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("---------------------by room id  function a------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------gif rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          print(responseData["data"]["gifs_payments"]["gif"]);

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");

          return responseData["data"];
        }
      } else {
        print("no internet conection ");
        return "no internet conection";
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///======================= room page  =====================
  //----------------------delete room function -------------------
  Future<bool> deleteRoom(String room_id) async {
    final url = 'http://mojtama3.life/api/delete/room';
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    try {
      print("--------------------delet room function b-------------------");
      final response = await http.post(url, body: {
        'room_id': room_id.trim(),
        //'user_id': user_id
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("--------------------delet room function a-------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          return true;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          return false;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------delete room function error --------------");
      print(e);
      return null;
    }
  }

//----------------------hazer member function -------------------
  Future<String> hazer(String userid, String roomid) async {
    final url = 'http://mojtama3.life/api/usersuspened';
          SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("get joinde search chat function ");
    try {
      print("--------------------hazer function b ------------------");
      final response = await http.post(url, body: {
        'user_id': userid.trim(),
        'room_id': roomid.trim(),
      }, headers: {
       'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("--------------------hazer function a ------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------hazer function error --------------");
      print(e);
      return null;
    }
  }
//----------------------deletmember member function -------------------
  Future<String> deletmember(String userid, String roomid) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    final url = 'http://mojtama3.life/api/destroyuser';
    print("get joinde search chat function ");
    print(userid);
    print(roomid);
    try {
      print("--------------------hazer function b ------------------");
      final response = await http.post(url, body: {
        'user_id': userid,
        'room_id': roomid,
      }, headers: {
           'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("--------------------hazer function a ------------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------hazer function error --------------");
      print(e);
      return null;
    }
  }
//-------------------fake el hazer function -----------------
  Future<String> fakelhazer(String userid, String roomid) async {
    final url = 'http://mojtama3.life/api/usernotsuspened';
          SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("------------------fakelhazr------------");
    print(userid);
    print(roomid);
    try {
      print("-------------------fake el hazer function b-----------------");
      final response = await http.post(url, body: {
        'user_id': userid.trim(),
        'room_id': roomid.trim(),
      }, headers: {
          'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("-------------------fake el hazer function a-----------------");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------fakelhazr function error --------------");
      print(e);
      return null;
    }
  }

/////////////////////////////////////
  Future<SaadModel> saad() async {
    final url = 'http://www.my-way.site/api/catalogues';

    final response = await http.post(Uri.encodeFull(url), body: {
      'type': 'all'
    }, headers: {
      //'Authorization': 'Bearer ',

      'Accept': 'application/json'
    });

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      var sssaad = SaadModel.fromJson(responseData);
      return sssaad;
    } else {
      print("no inter net connection ");
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  ///
  Future<String> getvrivcationcod(String email) async {
    final url = 'http://mojtama3.life/api/reset';
    print("get joinde search chat function ");
    print(email);

    try {
      final response = await http.post(url, body: {
        'email': email.trim(),
      }, headers: {
        // 'Authorization': 'Bearer ${token}',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);

          return "success";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          // var signUpResponse = SearchChatModel.fromJson(responseData);
          return "error";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///
  ///////////////////
////////////////////////
  ///
  ///
  ///
  ///
  ///
  ///

  Future<RoomMemberList> getRoomMemmber(String room_id) async {
    final url = 'http://mojtama3.life/api/roomlist';
    print("get joinde search chat function ");
    print(room_id);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    try {
      final response = await http.post(url, body: {
        'room_id': room_id.trim(),
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "Success") {
          print("---------------success---------------------");
          var signUpResponse = RoomMemberList.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = RoomMemberList.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///
  ///
  ///
  ///
  Future<SearchChatModel> getSearchedchat(String room_name) async {
    final url = 'http://mojtama3.life/api/chats/search';
    print("get joinde search chat function ");
    print(room_name);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    try {
      final response = await http.post(url, body: {
        'search': room_name,
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          var signUpResponse = SearchChatModel.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = SearchChatModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
       
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

////////////////////////////
  //////
  ///
  /////
  ///
  ////
  ///
  Future<PersonModel> getpersonprofiletoken(String userid) async {
    final url = 'http://mojtama3.life/api/showtokenprofile';
    print("get joinde search chat function ");
    print(userid);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    
    print(token);

    try {
      final response = await http.post(url, body: {
        'api_token': userid,
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          var signUpResponse = PersonModel.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = PersonModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }
  ///
  ///
Future<String> changeemailandpassword(String email,String oldpassword,String newpassword) async {
    final url = 'http://mojtama3.life/api/change_password_by_old';
    print("get joinde search chat function ");
    print(email);
      print(oldpassword);
        print(newpassword);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
     DataUser _dataUser=DataUser.instance;
    
    print(token);

    try {
      final response = await http.post(url, body: {
        'current_password': oldpassword,
        'new_password': newpassword,
        'new_confirm_password': newpassword,
   email:email!=_dataUser.getKey(Utility.Email)?email: "",

      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
        //  var signUpResponse = PersonModel.fromJson(responseData);

          return "processsucess";
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
      //    var signUpResponse = PersonModel.fromJson(responseData);
      if(responseData["data"]=="Please enter correct current password")
      return "wrongpassword";
          return "emailtekan";
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }






  ///
  Future<PersonModel> getpersonprofile(String userid) async {
    final url = 'http://mojtama3.life/api/showprofile';
    print("get joinde search chat function ");
    print(userid);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    
    print(token);

    try {
      final response = await http.post(url, body: {
        'user_id': userid,
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          var signUpResponse = PersonModel.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = PersonModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///

  Future<SearchRoomModel> getSearchedrooms(String room_name) async {
    final url = 'http://mojtama3.life/api/rooms/search';
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    try {
      final response = await http.post(url, body: {
        'search': room_name.trim(),
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          var signUpResponse = SearchRoomModel.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = SearchRoomModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
        return null;
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///
  ///
  ///
////////////////////////////////
  Future<SearchRoomModel> getSearchedmyrooms(String room_name) async {
    final url = 'http://mojtama3.life/api/searchroom';
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    try {
      final response = await http.post(url, body: {
        'search': room_name.trim(),
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          var signUpResponse = SearchRoomModel.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = SearchRoomModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  Future<SearchRoomModel> getSearchedroom(String room_name) async {
    final url = 'http://mojtama3.life/api/rooms/search';
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    try {
      final response = await http.post(url, body: {
        'search': room_name.trim(),
      }, headers: {
        'Authorization': 'Bearer $token',
        //'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("--------------------search rooms ------------------");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("---------------success---------------------");
          var signUpResponse = SearchRoomModel.fromJson(responseData);

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          print("---------------falild---------------------");
          var signUpResponse = SearchRoomModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
      }
    } catch (e) {
      print("-------------exeption --------------");
      print(e);
      return null;
    }
  }

  ///
  ///
  Future<AuthpModel> login(
      String email, String password, String goodleToken) async {
    print("tttttttttttttttttttttttttt");

    print(email);
    print(password);
    print(goodleToken);
    final url = 'http://mojtama3.life/api/login';
    try {
      final response = await http.post(
        url,
        body: {
          'email': email.trim(),
          'password': password.trim(),
          'google_token': goodleToken,
        },
      );
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          var signUpResponse = AuthpModel.fromJson(responseData);

          DataUser _dataUser = DataUser.instance;
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(Utility.BackGroundColor, Utility.WhiteColor);
          pref.setString(Utility.FontColor, Utility.BlackColor);
          pref.setString(Utility.DarkMode, "false");
          _dataUser.setKey({'key': Utility.DarkMode, 'value': "false"});
          _dataUser.setKey(
              {'key': Utility.BackGroundColor, 'value': Utility.WhiteColor});
          _dataUser
              .setKey({'key': Utility.FontColor, 'value': Utility.BlackColor});
   pref.setString(Utility.roomNotify, signUpResponse.data.roomNotify.toString());
           pref.setString(Utility.chatNotify, signUpResponse.data.chatNotify.toString());
           pref.setString(Utility.messageNotify, signUpResponse.data.messageNotify.toString());
            _dataUser.setKey(
              {'key': Utility.messageNotify, 'value':  signUpResponse.data.messageNotify.toString()});
                _dataUser.setKey(
              {'key': Utility.roomNotify, 'value':  signUpResponse.data.roomNotify.toString()});
                _dataUser.setKey(
              {'key': Utility.chatNotify, 'value':  signUpResponse.data.chatNotify.toString()});
          saveAdvertiserDatainLocal(
              name: signUpResponse.data.name,
              email: signUpResponse.data.email,
              apiToken: signUpResponse.apiToken,
              imageurl: signUpResponse.data.image,
              id: signUpResponse.data.iD.toString());

          return signUpResponse;
        } else if (responseData["msg"] == "error") {
          var signUpResponse = AuthpModel.fromJson(responseData);
          return signUpResponse;
        }
      } else {
        print("no internet conection ");
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<UpdateProfile> UpdateUser(
      String name,
      String descreption,
      String birthday,
      String Gender,
      Map<String, String> llanguages,
      File story,
      File profileImage,
      List<Asset> images) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    String email = pref.getString(Utility.Email);

//for(var i in )

//    print(token);
//    final url =
//        'http://mojtama3.life/api/profile';
////?api_token=${token.trim()}
//    final response = await http.get(
//      url,
//      headers: {
//        'Authorization':'Bearer ${token.trim()}',
//      }
//
//    );
//    print("saad1");
//    final responseData = json.decode(response.body);
//    print("saad2");
//    print(responseData);
    print(name);
    print(descreption);
    print(birthday);
    print(Gender);
    print(token);
    print(llanguages.toString());
    print(json.encode(llanguages));

    print(llanguages != null);
    try {
      Dio dio = new Dio();
      print("-----------------------update---------------------");

      FormData formData = FormData();
      formData.fields..add(MapEntry('api_token', token));
      formData.fields..add(MapEntry('name', name));
      formData.fields..add(MapEntry('your_mind', descreption));
      //  formData.fields..add(MapEntry('date_birth', birthday));
      formData.fields..add(MapEntry('gender', Gender));

      // formData.fields..add(MapEntry('story', story));

      if (profileImage != null)
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(profileImage.path,
              filename: profileImage.path.split('/').last),
        ));
      if (images != null) if (images.length > 0) {
        for (var i = 0; i < images.length; i++) {
          ByteData byteData = await images[i].getByteData();
          List<int> imageData = byteData.buffer.asUint8List();
          String filename = images[i].name;
          formData.files.add(MapEntry(
            'media[$i]',
            MultipartFile.fromBytes(imageData, filename: filename),
          ));
        }
      }
      if (llanguages != null) {
        formData.fields..add(MapEntry('languages', llanguages.toString()));
      }
// for(int i=0;i<images.length;i++)
//   formData.files.add(MapEntry( 'media[$i]', await MultipartFile.fromFile(images[i].filepa,   filename: profileImage.path.split('/').last),));
      print("-----------------------update2---------------------");
      final response = await dio.post(
        "http://mojtama3.life/api/update",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

      print("-----------------------update3---------------------");
      print(response);

      print("-----------------------sucsses---------------------");
      //  final responseData = json.decode(response.data);
      print("-----------------------sucsses9---------------------");
      if (response.data["msg"] == "success") {
        print("-----------------------sucsses---------------------");
        var upaderesponse = UpdateProfile.fromJson(response.data);

        saveAdvertiserDatainLocal(
          name: upaderesponse.data.name,
          email: upaderesponse.data.email,
          imageurl: upaderesponse.data.image,
          id: upaderesponse.data.iD.toString(),
        );

        print("-----------------------sucsses2---------------------");
        return upaderesponse;
      } else if (response.data["msg"] == "error") {
        print("-----------------------error---------------------");
        var upaderesponse = UpdateProfile.fromJson(response.data);
        return upaderesponse;
      }
    } catch (e) {
      print("----------errrorr----------------");
      print(e);
      return null;
    }
  }

  Future<JoinedRoom> getmychats() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/chatswherejoined';

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
    JoinedRoom _data = new JoinedRoom();
    _data = JoinedRoom.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
      return _data;
      // return roomsModel.data;
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

//////////////////////
  ///
  ///
  ///
  Future<MyRoomsModel> getmyRooms() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
 
    print(token);
  

    final url = 'http://mojtama3.life/api/myrooms';
try{

 final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });


    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
    MyRoomsModel _data = new MyRoomsModel();
    _data = MyRoomsModel.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
      return _data;
      // return roomsModel.data;
    } else {
      return null;
    }
  
}catch(e){print("-----my rooms function -----");print(e);return null;}
   

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  ///
  ///
  ///
  ///
///////
  Future<JoinedRoom> getjoindRoom() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/Roomwherejoin';

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
    JoinedRoom _data = new JoinedRoom();
    _data = JoinedRoom.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
      return _data;
      // return roomsModel.data;
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  Future<bool> logoutapi() async {
    print("logout function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/logout';
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("kkkkkkkkkkkkkk1");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("kkkkkkkkkkkkkk2");
        print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

        if (responseData["msg"] == "success") {
          print("data");
          // print(_data.toJson());
          SharedPreferences pref = await SharedPreferences.getInstance();

          pref.clear();
          return true;
          // return roomsModel.data;
        } else {
          print("get game function erroe ");
          print(responseData.toString());
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("------------error logout-----");
      return false;
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  Future<FrindsRequstsModel> friendsReques(String url) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    // final url = 'http://mojtama3.life/api/friendrequests';
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("kkkkkkkkkkkkkk1");
      final responseData = json.decode(response.body);
      print("kkkkkkkkkkkkkk2");
      print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

      if (responseData["msg"] == "success") {
        print("data");
        // print(_data.toJson());
        var data = FrindsRequstsModel.fromJson(responseData);
        return data;
        // return roomsModel.data;
      } else {
        print("get game function erroe ");
        print(responseData.toString());
        return null;
      }
    } catch (e) {
      print("-----------error frindrequest function -------");
      return null;
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  Future<bool> acceptFriendRequest(String chatid, int check) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/upcheck?';
    try {
      final response = await http.post(url, body: {
        'chat_id': chatid,
        'check': check.toString(),
      }, headers: {
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("kkkkkkkkkkkkkk1");
      final responseData = json.decode(response.body);
      print("kkkkkkkkkkkkkk2");
      print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

      if (responseData["msg"] == "success") {
        // print("data");
        // print(_data.toJson());
        print("sucsess");
        // String data = responseData["data"];
        return true;
        // return roomsModel.data;
      } else {
        print("srror");
        String data = responseData["data"];
        print(data);
        return false;
      }
    } catch (e) {
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(e);
    }
//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  Future<String> requestroom(String friendId) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/joinRoom';
    try {
      final response = await http.post(url, body: {
        'room_id': friendId,
      }, headers: {
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("kkkkkkkkkkkkkk1");
      final responseData = json.decode(response.body);
      print("kkkkkkkkkkkkkk2");
      print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

      if (responseData["msg"] == "success") {
        // print("data");
        // print(_data.toJson());
        print("sucsess");
        // String data = responseData["data"];
        return "success";
        // return roomsModel.data;
      } else {
        print("srror");
        String data = responseData["data"];
        print(data);
        return data;
      }
    } catch (e) {
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(e);
      return null;
    }
//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  ///--------- requestet friend function ----------------
 Future<String> requestfriend(String friendId) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print(token);
    final url = 'http://mojtama3.life/api/add_friend';
    try {
      print("--------- requestet friend function b----------------");

      final response = await http.post(url, body: {
        'user_id': friendId,
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      print("--------- requestet friend function a----------------");
     
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("response data ;");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("sucsess");
          return "success";
        } else {
          return responseData["data"] ;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("------------error request friend function ---------");
      print(e);
      return null;
    }
  }
 Future<String> cancelfrien(String friendId) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print(token);
    final url = 'http://mojtama3.life/api/refuseadd';
    try {
      print("--------- requestet friend function b----------------");
      print(friendId);

      final response = await http.post(url, body: {
        'user_id': friendId,
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      print("--------- requestet friend function a----------------");
        final responseData = json.decode(response.body);
        print(responseData);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("response data ;");
        print(responseData);
        if (responseData["msg"] == "success") {
          print("sucsess");
          return "success";
        } else {
          return responseData["data"] ;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("------------error request friend function ---------");
      print(e);
      return null;
    }
  }
  Future<IdesModel> getRoomids() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/Roomids';

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
      var data = IdesModel.fromJson(responseData);
      return data;
      // return roomsModel.data;
    } else {
      print("get gif function erroe ");
      print(responseData.toString());
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  /////////////////
  ///
  ///
  ///
  ///
  Future<String> increaselevel(String userid) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/raisuserlevel';
try{
   final response = await http.post(url,
    body: {
      "user_id":userid,
    }, headers: {
      'Authorization': 'Bearer $token',
    //  'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
     // var data = IdesModel.fromJson(responseData);
      return "succes";
      // return roomsModel.data;
    } else {
      print("get gif function erroe ");
      print(responseData.toString());
      if(responseData["data"] == "user not found"){
 return "user not found";
      }
      
     
      else{
        return "error";
      }
    }
}catch(e){
  print(e);
  return null;
}
 

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }



 Future<String> paymentoffer(String userid,String coinid) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
print(userid);
print(coinid);
   final url = 'http://mojtama3.life/api/paywithCreditCard';
try{
   final response = await http.post(url,
    body: {
      "user_id":userid,
      "coin_id":coinid,
    }
    // ,
    //  headers: {
    //   'Authorization': 'Bearer $token',
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json'
    // }
    );
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

  print("---------------payment function--------------");
  return responseData["approval_url"];
}catch(e){
  print(e);
  return null;
}}

 Future<String> payment(String userid,String coinid) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
print(userid);
print(coinid);
   final url = 'http://mojtama3.life/api/paywithCreditCard';
try{
   final response = await http.post(url,
    body: {
      "user_id":userid,
      "coin_id":coinid,
    }
    // ,
    //  headers: {
    //   'Authorization': 'Bearer $token',
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json'
    // }
    );
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

  print("---------------payment function--------------");
  return responseData["approval_url"];
}catch(e){
  print(e);
  return null;
}}



  Future<String> changenotifcation(String userid,String key,String url) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

   // final url = 'http://mojtama3.life/api/upmessagenotify';
try{
   final response = await http.post(
     url,
    body: {
      "${key}":userid,
    }, headers: {
      'Authorization': 'Bearer $token',
    //  'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
     // var data = IdesModel.fromJson(responseData);
      return "success";
      // return roomsModel.data;
    } else {
      print("get gif function erroe ");
      print(responseData.toString());
      return "error";
    }
}catch(e){
  print(e);
  return null;
}}
//////////////////
  Future<IdesModel> getProfileids() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/Chatids';

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

    if (responseData["msg"] == "success") {
      print("data");
      // print(_data.toJson());
      var data = IdesModel.fromJson(responseData);
      return data;
      // return roomsModel.data;
    } else {
      print("get gif function erroe ");
      print(responseData.toString());
    }

//    retur    RoomsModel modelro;
//        modelro.fromJson(responseData).data;
  }

  Future<PrfileModel> getProfile() async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/profile';
try{  final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    if(response.statusCode==200){
 print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
    PrfileModel _data = new PrfileModel();
    _data = PrfileModel.fromJson(responseData);
    // print(_data);
    if (_data != null) {
      DataUser _dataUser = DataUser.instance;
      _dataUser.setKey({'key': Utility.ProfileImage, 'value': _data.image});
      _dataUser.setKey({'key': Utility.ID, 'value': _data.iD.toString()});
      // _dataUser.setKey({'key': Utility.Name, 'value': name});
      print("------------------------------------------");
      // print(apiToken);
      // print(name);
      // print(email);
      // print(imageurl);
      // print(id);

      print("save in shared prefrance");
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString(Utility.ProfileImage, _data.image);
      pref.setString(Utility.ID, _data.iD.toString());
    }

    return _data;
    }
    else{
      return null;
    }
   }catch(e){
 return null;
    }
  
  }

///////////////////
  ///
  ///
  ///
  Future<MarketModel> getMarketData() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/all';
try{
 final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    if(response.statusCode==200){

    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);
    MarketModel _data = new MarketModel();
    print("kkkkkkkkkkkkkk3");
    _data = MarketModel.fromJson(responseData);
    print("kkkkkkkkkkkkkk4");
    print(_data);
    return _data;

    }
    else{
      return null;
    }

}catch(e){
  print("market error");
  return null;
}
   
  }

  ///
////////////////////
  Future<String> DeleteProfile() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/delete_profile';

    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    print("kkkkkkkkkkkkkk1");
    final responseData = json.decode(response.body);
    print("kkkkkkkkkkkkkk2");
    print(responseData);

/////////////////////////////////////////////
    return responseData['message'];
  }

  Future<bool> AddRoom(String name, String descrition, String details,
      String story, String lang, File imagefile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    //String email = pref.getString(Utility.Email);
    print("hhhhhhhhhhhhhhhhhhhhh");
    print(imagefile.path.split('/').last);
    print("Bearer $token");
    Dio dio = new Dio();

    FormData formData = FormData();
    formData.fields..add(MapEntry('api_token', token));
    formData.fields..add(MapEntry('name', name));
    formData.fields..add(MapEntry('description', descrition));
    formData.fields..add(MapEntry('story', story));
    formData.fields..add(MapEntry('language', lang));

    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(imagefile.path,
          filename: imagefile.path.split('/').last),
    ));

    print("befor");
    print("Bearer $token");
  try{  final response = await dio.post(
      "http://mojtama3.life/api/addroom",
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
    print("after");
    print("ssssssssssssssssssssssssss");
    print(response);
    if (response.data["msg"] == "Success") {
      return true;
    } else if (response.data["msg"] == "error") {
      //errormessage = response.data['data'].toString();
      return false;
    }}catch(e){
    print("-------add room function error");
    print(e);
    return null;
  }
  }

////////////////////////
  ///
  ///
  ///
  Future<bool> EditeRoom(String room_id, String name, String descrition,
      String details, String story, String lang, File imagefile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);

    print("hhhhhhhhhhhhhhhhhhhhh");
    // print(imagefile.path.split('/').last);
    print("Bearer $token");
    Dio dio = new Dio();

    FormData formData = FormData();
    formData.fields..add(MapEntry('api_token', token));
    formData.fields..add(MapEntry('room_id', room_id));
    formData.fields..add(MapEntry('name', name));
    formData.fields..add(MapEntry('description', descrition));
    formData.fields..add(MapEntry('story', story));
    if (lang != null) {
      formData.fields..add(MapEntry('language', lang));
    }

    if (imagefile != null) {
      print("-------------edite page------------");
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(imagefile.path,
            filename: imagefile.path.split('/').last),
      ));
    }

    print("befor");
    print("Bearer $token");
    try {
      final response = await dio.post(
        "http://mojtama3.life/api/update/room",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response);
      print("after");
      print("ssssssssssssssssssssssssss");
      print(response);
      if (response.data["msg"] == "Success") {
        return true;
      } else if (response.data["msg"] == "error") {
        //errormessage = response.data['data'].toString();
        return false;
      }
    } catch (e) {
      print("-------------error------------");
      print(e);
    }

    // return null;
  }

  ///
  ///
  ///
  ///
/////////////////////////////
  Future<String> AddImage(File imagefile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    //String email = pref.getString(Utility.Email);
    print("hhhhhhhhhhhhhhhhhhhhh");
    print(imagefile.path.split('/').last);
    print("Bearer $token");
    Dio dio = new Dio();

    FormData formData = FormData();
    formData.fields..add(MapEntry('api_token', token));
    // formData.fields..add(MapEntry('name', name));
    // formData.fields..add(MapEntry('description', descrition));
    // formData.fields..add(MapEntry('story', story));
    // formData.fields..add(MapEntry('language', "english"));

    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(imagefile.path,
          filename: imagefile.path.split('/').last),
    ));

    print("befor");
    print("Bearer $token");
    final response = await dio.post(
      "http://mojtama3.life/api/roomimage",
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
    print("after");
    print("ssssssssssssssssssssssssss");
    print(response);
    if (response.data["msg"] == "Success") {
      return response.data["roomimages"]["image"];
    } else if (response.data["msg"] == "error") {
      //errormessage = response.data['data'].toString();
      return "cannot";
    }
  }

  void saveAdvertiserDatainLocal(
      {String name,
      String email,
      String apiToken,
      String imageurl,
      String id}) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    DataUser _dataUser = DataUser.instance;

    // if( token != null){
    print("------------------------------------------1");

    _dataUser.setKey({'key': Utility.ProfileImage, 'value': imageurl});
    _dataUser.setKey({'key': Utility.ID, 'value': id});
    _dataUser.setKey({'key': Utility.Name, 'value': name});
    _dataUser.setKey({'key': Utility.TOKEN, 'value': apiToken});
    // _dataUser.setKey({'key': Utility.BackGroundColor, 'value': name})

    print("------------------------------------------");
    print(apiToken);
    print(name);
    print(email);
    print(imageurl);
    print(id);

    print("save in shared prefrance");
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Utility.Name, name.toString());
    pref.setString(Utility.Email, email.toString());
    pref.setString(Utility.ProfileImage, imageurl.toString());
    pref.setString(Utility.ID, id);
    
    if (apiToken != null && apiToken.length > 0) {
      _dataUser.setKey({'key': Utility.TOKEN, 'value': apiToken});
      print("------------token-----------");
      pref.setString(Utility.TOKEN, apiToken);
    }
  }

  Future<String> sendnotifcationfriend(String groupId, String senderId,
      String senderName, String message) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    print(groupId);
    print(senderId);
    print(senderName);
    print(message);

    final url = 'http://mojtama3.life/api/chat_not';
    try {
      final response = await http.post(url, body: {
        'user_id': groupId,
        'sender_id': senderId,
        'sender_name': senderName,
        'message': message,
      }, headers: {
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("kkkkkkkkkkkkkk1");
      final responseData = json.decode(response.body);
      print("kkkkkkkkkkkkkk2");
      print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

      if (responseData["msg"] == "success") {
        // print("data");
        // print(_data.toJson());
        print("sucsess");
        // String data = responseData["data"];
        return "تم اضافة الولا";
        // return roomsModel.data;
      } else {
        print("srror");
        String data = responseData["data"];
        print(data);
        return data;
      }
    } catch (e) {
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(e);
    }
  }

  Future<String> sendnotifcation(String groupId, String senderId,
      String senderName, String message) async {
    print("get notfcation function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Utility.TOKEN);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print(groupId);
    print(senderId);
    print(senderName);
    print(message);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://mojtama3.life/api/send_not';
    try {
      final response = await http.post(url, body: {
        'groub_id': groupId,
        'sender_id': senderId,
        'sender_name': senderName,
        'message': message,
      }, headers: {
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("kkkkkkkkkkkkkk1");
      final responseData = json.decode(response.body);
      print("kkkkkkkkkkkkkk2");
      print(responseData);
//     GamesModel _data = new GamesModel();
//     _data = GamesModel.fromJson(responseData);

      if (responseData["msg"] == "success") {
        // print("data");
        // print(_data.toJson());
        print("sucsess");
        // String data = responseData["data"];
        return "تم اضافة الولا";
        // return roomsModel.data;
      } else {
        print("srror");
        String data = responseData["data"];
        print(data);
        return data;
      }
    } catch (e) {
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(e);
    }
  }
}
