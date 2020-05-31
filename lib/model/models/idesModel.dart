class IdesModel {
  String msg;
  Data data;

  IdesModel({this.msg, this.data});

  IdesModel.fromJson(Map<String, dynamic> json) {
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
  List<SpecialIds> specialIds;

  Data({this.specialIds});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['special_ids'] != null) {
      specialIds = new List<SpecialIds>();
      json['special_ids'].forEach((v) {
        specialIds.add(new SpecialIds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specialIds != null) {
      data['special_ids'] = this.specialIds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpecialIds {
  int id;
  String type;
  int specialId;
  String coins;
  String createdAt;
  String updatedAt;

  SpecialIds(
      {this.id,
        this.type,
        this.specialId,
        this.coins,
        this.createdAt,
        this.updatedAt});

  SpecialIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    specialId = json['special_id'];
    coins = json['coins'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['special_id'] = this.specialId;
    data['coins'] = this.coins;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}