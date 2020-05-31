class SearchChatModel {
  String msg;
  Data data;

  SearchChatModel({this.msg, this.data});

  SearchChatModel.fromJson(Map<String, dynamic> json) {
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
  List<ChatSearch> chatSearch;

  Data({this.chatSearch});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['chat_search'] != null) {
      chatSearch = new List<ChatSearch>();
      json['chat_search'].forEach((v) {
        chatSearch.add(new ChatSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatSearch != null) {
      data['chat_search'] = this.chatSearch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatSearch {
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

  ChatSearch(
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

  ChatSearch.fromJson(Map<String, dynamic> json) {
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