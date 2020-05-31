import 'package:mojtam3/model/models/room.dart';

class SearchRoomModel {
  String msg;
  Data data;

  SearchRoomModel({this.msg, this.data});

  SearchRoomModel.fromJson(Map<String, dynamic> json) {
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
  List<Room_Model> roomsSearch;

  Data({this.roomsSearch});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rooms_search'] != null) {
      roomsSearch = new List<Room_Model>();
      json['rooms_search'].forEach((v) {
        roomsSearch.add(new Room_Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roomsSearch != null) {
      data['rooms_search'] = this.roomsSearch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

