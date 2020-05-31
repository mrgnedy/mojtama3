class Decorationss {
  List<Decorations> decorations;

  Decorationss({this.decorations});

  Decorationss.fromJson(Map<String, dynamic> json) {
    if (json['decorations'] != null) {
      decorations = new List<Decorations>();
      json['decorations'].forEach((v) {
        decorations.add(new Decorations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.decorations != null) {
      data['decorations'] = this.decorations.map((v) => v.toJson()).toList();
    }
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