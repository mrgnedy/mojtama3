class Friend {
  int chatId;
  int userId;
  String userName;
  String userImage;
  int ownerId;
  String description;
  String story;

  Friend(
      {this.chatId,
      this.userId,
      this.userName,
      this.userImage,
      this.ownerId,
      this.description,
      this.story});

  Friend.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    userId = json['user_id'];
    userName = json['userName'];
    userImage = json['userImage'];
    ownerId = json['owner_id'];
    description = json['description'];
    story = json['story'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['user_id'] = this.userId;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['owner_id'] = this.ownerId;
    data['description'] = this.description;
    data['story'] = this.story;
    return data;
  }
}