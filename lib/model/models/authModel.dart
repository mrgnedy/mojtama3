class AuthpModel {
  String msg;
  String apiToken;
  Data data;

  AuthpModel({this.msg, this.apiToken, this.data});

  AuthpModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    apiToken = json['api_token'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['api_token'] = this.apiToken;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int iD;
  String image;
  String name;
  String email;
  String status;
  String yourMind;
  String role;
  String gender;
  String dateOfBirth;
  dynamic level;
  dynamic precent;
  dynamic roomNotify;
  dynamic chatNotify;
  dynamic messageNotify;
  String createdAt;

  Data(
      {this.iD,
      this.image,
      this.name,
      this.email,
      this.status,
      this.yourMind,
      this.role,
      this.gender,
      this.dateOfBirth,
      this.level,
      this.precent,
      this.roomNotify,
      this.chatNotify,
      this.messageNotify,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    yourMind = json['your_mind'];
    role = json['role'];
    gender = json['gender'];
    dateOfBirth = json['Date_of_Birth'];
    level = json['level'];
    precent = json['precent'];
    roomNotify = json['room_notify'];
    chatNotify = json['chat_notify'];
    messageNotify = json['message_notify'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['your_mind'] = this.yourMind;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['Date_of_Birth'] = this.dateOfBirth;
    data['level'] = this.level;
    data['precent'] = this.precent;
    data['room_notify'] = this.roomNotify;
    data['chat_notify'] = this.chatNotify;
    data['message_notify'] = this.messageNotify;
    data['created_at'] = this.createdAt;
    return data;
  }
}