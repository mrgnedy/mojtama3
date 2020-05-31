import 'package:mojtam3/model/models/room.dart';

class JoinedRoom {
  String msg;
  Data data;

  JoinedRoom({this.msg, this.data});

  JoinedRoom.fromJson(Map<String, dynamic> json) {
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
  List<Room_Model> roomswherejoined;

  Data({this.userImage, this.roomswherejoined});

  Data.fromJson(Map<String, dynamic> json) {
    userImage = json['user_image'];
    if (json['roomswherejoined'] != null) {
      roomswherejoined = new List<Room_Model>();
      json['roomswherejoined'].forEach((v) {
        roomswherejoined.add(new Room_Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_image'] = this.userImage;
    if (this.roomswherejoined != null) {
      data['roomswherejoined'] =
          this.roomswherejoined.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

