import 'package:mojtam3/model/models/room.dart';

class MyRoomsModel {
  String msg;
  Data data;

  MyRoomsModel({this.msg, this.data});

  MyRoomsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userImage;
  List<Room_Model> rooms;

  Data({this.userImage, this.rooms});

  Data.fromJson(Map<String, dynamic> json) {
    userImage = json['user_image'];
    if (json['rooms'] != null) {
      rooms = new List<Room_Model>();
      json['rooms'].forEach((v) {
        rooms.add(new Room_Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_image'] = this.userImage;
    if (this.rooms != null) {
      data['rooms'] = this.rooms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

