class Room_Model {
  int roomId;
  String roomName;
  String description;
  String details;
  String image;
  int userId;
  String userName;
  String userImage;
  String story;
  String language;
  int level;
  int precent;
  String color;
  int suspend;
  int member;
  int users;
  int staticId;

  Room_Model(
      {this.roomId,
      this.roomName,
      this.description,
      this.details,
      this.image,
      this.userId,
      this.userName,
      this.userImage,
      this.story,
      this.language,
      this.level,
      this.precent,
      this.color,
      this.suspend,
      this.member,
      this.users,
      this.staticId});

  Room_Model.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    roomName = json['room_name'];
    description = json['description'];
    details = json['details'];
    image = json['image'];
    userId = json['user_id'];
    userName = json['userName'];
    userImage = json['UserImage'];
    story = json['story'];
    language = json['language'];
    level = json['level'];
    precent = json['precent'];
    color = json['color'];
    suspend = json['suspend'];
    member = json['member'];
    users = json['users'];
    staticId = json['static_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['room_name'] = this.roomName;
    data['description'] = this.description;
    data['details'] = this.details;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['userName'] = this.userName;
    data['UserImage'] = this.userImage;
    data['story'] = this.story;
    data['language'] = this.language;
    data['level'] = this.level;
    data['precent'] = this.precent;
    data['color'] = this.color;
    data['suspend'] = this.suspend;
    data['member'] = this.member;
    data['users'] = this.users;
    data['static_id'] = this.staticId;
    return data;
  }
}