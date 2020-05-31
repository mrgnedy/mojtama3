class MyChats {
  String msg;
  Data data;

  MyChats({this.msg, this.data});

  MyChats.fromJson(Map<String, dynamic> json) {
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
  List<Chats> chats;

  Data({this.userImage, this.chats});

  Data.fromJson(Map<String, dynamic> json) {
    userImage = json['user_image'];
    if (json['chats'] != null) {
      chats = new List<Chats>();
      json['chats'].forEach((v) {
        chats.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_image'] = this.userImage;
    if (this.chats != null) {
      data['chats'] = this.chats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int id;
  String name;
  String description;
  int ownerId;
  int userId;
  String image;
  String userName;
  String userImage;
  String story;
  String status;

  Chats(
      {this.id,
      this.name,
      this.description,
      this.ownerId,
      this.userId,
      this.image,
      this.userName,
      this.userImage,
      this.story,
      this.status});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    image = json['image'];
    userName = json['userName'];
    userImage = json['userImage'];
    story = json['story'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['owner_id'] = this.ownerId;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['story'] = this.story;
    data['status'] = this.status;
    return data;
  }
}