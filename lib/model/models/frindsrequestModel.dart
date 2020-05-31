import 'frindModel.dart';

class FrindsRequstsModel {
  String msg;
  List<Friend> friend;

  FrindsRequstsModel({this.msg, this.friend});

  FrindsRequstsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['friend'] != null) {
      friend = new List<Friend>();
      json['friend'].forEach((v) {
        friend.add(new Friend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.friend != null) {
      data['friend'] = this.friend.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

