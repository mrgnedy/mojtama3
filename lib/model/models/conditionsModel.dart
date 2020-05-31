class ConditionModel {
  String msg;
  Settings settings;

  ConditionModel({this.msg, this.settings});

  ConditionModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
    return data;
  }
}

class Settings {
  int id;
  String siteName;
  String siteLogo;
  String about;
  String policy;
  String usage;
  String createdAt;
  String updatedAt;

  Settings(
      {this.id,
      this.siteName,
      this.siteLogo,
      this.about,
      this.policy,
      this.usage,
      this.createdAt,
      this.updatedAt});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteName = json['site_name'];
    siteLogo = json['site_logo'];
    about = json['about'];
    policy = json['policy'];
    usage = json['usage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_name'] = this.siteName;
    data['site_logo'] = this.siteLogo;
    data['about'] = this.about;
    data['policy'] = this.policy;
    data['usage'] = this.usage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}