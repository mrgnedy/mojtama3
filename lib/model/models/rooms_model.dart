import 'package:mojtam3/model/models/room.dart';

class RoomsModel {
  String msg;
  Data data;

  RoomsModel({this.msg, this.data});

  RoomsModel.fromJson(Map<String, dynamic> json) {
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
  List<Room_Model> special;
  List<Room_Model> active;

  Data({this.userImage, this.special, this.active});

  Data.fromJson(Map<String, dynamic> json) {
    userImage = json['user_image'];
    if (json['special'] != null) {
      special = new List<Room_Model>();
      json['special'].forEach((v) {
        special.add(new Room_Model.fromJson(v));
      });
    }
    if (json['active'] != null) {
      active = new List<Room_Model>();
      json['active'].forEach((v) {
        active.add(new Room_Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_image'] = this.userImage;
    if (this.special != null) {
      data['special'] = this.special.map((v) => v.toJson()).toList();
    }
    if (this.active != null) {
      data['active'] = this.active.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

