class storieies {
  List<Stories> stories;

  storieies({this.stories});

  storieies.fromJson(Map<String, dynamic> json) {
    if (json['stories'] != null) {
      stories = new List<Stories>();
      json['stories'].forEach((v) {
        stories.add(new Stories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
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