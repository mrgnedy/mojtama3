class RoomMemberList {
  String msg;
  List<Usersnotsuspened> usersnotsuspened;
  List<Usersnotsuspened> userssuspened;

  RoomMemberList({this.msg, this.usersnotsuspened, this.userssuspened});

  RoomMemberList.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['usersnotsuspened'] != null) {
      usersnotsuspened = new List<Usersnotsuspened>();
      json['usersnotsuspened'].forEach((v) {
        usersnotsuspened.add(new Usersnotsuspened.fromJson(v));
      });
    }
    if (json['userssuspened'] != null) {
      userssuspened = new List<Usersnotsuspened>();
      json['userssuspened'].forEach((v) {
        userssuspened.add(new Usersnotsuspened.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.usersnotsuspened != null) {
      data['usersnotsuspened'] =
          this.usersnotsuspened.map((v) => v.toJson()).toList();
    }
    if (this.userssuspened != null) {
      data['userssuspened'] =
          this.userssuspened.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usersnotsuspened {
  int userId;
  String userName;
  String userImage;
  String yourMind;

  Usersnotsuspened({this.userId, this.userName, this.userImage, this.yourMind});

  Usersnotsuspened.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['userName'];
    userImage = json['userImage'];
    yourMind = json['your_mind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['your_mind'] = this.yourMind;
    return data;
  }
}