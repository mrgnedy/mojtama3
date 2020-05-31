class PersonModel {
  String msg;
  User user;

  PersonModel({this.msg, this.user});

  PersonModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String image;
  String dateBirth;
  int status;
  String gender;
  int suspended;
  int roleId;
  int isActive;
  String yourMind;
  dynamic level;
  dynamic precent;
  List<Stories> stories;
  List<Langauges> langauges;
  List<Decorations> decorations;
  int isFriend;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.dateBirth,
      this.status,
      this.gender,
      this.suspended,
      this.roleId,
      this.isActive,
      this.yourMind,
      this.level,
      this.precent,
      this.stories,
      this.langauges,
      this.decorations,
      this.isFriend,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    dateBirth = json['date_birth'];
    status = json['status'];
    gender = json['gender'];
    suspended = json['suspended'];
    roleId = json['role_id'];
    isActive = json['is_active'];
    yourMind = json['your_mind'];
    level = json['level'];
    precent = json['precent'];
    if (json['stories'] != null) {
      stories = new List<Stories>();
      json['stories'].forEach((v) {
        stories.add(new Stories.fromJson(v));
      });
    }
    if (json['langauges'] != null) {
      langauges = new List<Langauges>();
      json['langauges'].forEach((v) {
        langauges.add(new Langauges.fromJson(v));
      });
    }
    if (json['decorations'] != null) {
      decorations = new List<Decorations>();
      json['decorations'].forEach((v) {
        decorations.add(new Decorations.fromJson(v));
      });
    }
    isFriend = json['is_friend'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['date_birth'] = this.dateBirth;
    data['status'] = this.status;
    data['gender'] = this.gender;
    data['suspended'] = this.suspended;
    data['role_id'] = this.roleId;
    data['is_active'] = this.isActive;
    data['your_mind'] = this.yourMind;
    data['level'] = this.level;
    data['precent'] = this.precent;
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
    if (this.langauges != null) {
      data['langauges'] = this.langauges.map((v) => v.toJson()).toList();
    }
    if (this.decorations != null) {
      data['decorations'] = this.decorations.map((v) => v.toJson()).toList();
    }
    data['is_friend'] = this.isFriend;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Stories {
  int id;
  String type;
  String story;

  Stories({this.id, this.type, this.story});

  Stories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    story = json['story'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['story'] = this.story;
    return data;
  }
}

class Langauges {
  int id;
  String lang;

  Langauges({this.id, this.lang});

  Langauges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lang'] = this.lang;
    return data;
  }
}

class Decorations {
  int id;
  String decoration;
  int number;

  Decorations({this.id, this.decoration, this.number});

  Decorations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    decoration = json['decoration'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['decoration'] = this.decoration;
    data['number'] = this.number;
    return data;
  }
}