class PrfileModel {
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
  List<Stories> stories;
  List<Langauges> langauges;
  List<Decorations> decorations;
  String createdAt;

  PrfileModel(
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
      this.stories,
      this.langauges,
      this.decorations,
      this.createdAt});

  PrfileModel.fromJson(Map<String, dynamic> json) {
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
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
    if (this.langauges != null) {
      data['langauges'] = this.langauges.map((v) => v.toJson()).toList();
    }
    if (this.decorations != null) {
      data['decorations'] = this.decorations.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
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