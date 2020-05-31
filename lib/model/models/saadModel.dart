class SaadModel {
  bool success;
  List<Data> data;
  String message;

  SaadModel({this.success, this.data, this.message});

  SaadModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  String title;
  String excerpt;
  List<String> body;
  String slug;
  String image;
  List<Pdf> pdf;
  String startDate;
  String endDate;
  String status;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.title,
        this.excerpt,
        this.body,
        this.slug,
        this.image,
        this.pdf,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    excerpt = json['excerpt'];
    body = json['body'].cast<String>();
    slug = json['slug'];
    image = json['image'];
    if (json['pdf'] != null) {
      pdf = new List<Pdf>();
      json['pdf'].forEach((v) {
        pdf.add(new Pdf.fromJson(v));
      });
    }
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['excerpt'] = this.excerpt;
    data['body'] = this.body;
    data['slug'] = this.slug;
    data['image'] = this.image;
    if (this.pdf != null) {
      data['pdf'] = this.pdf.map((v) => v.toJson()).toList();
    }
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pdf {
  String downloadLink;
  String originalName;

  Pdf({this.downloadLink, this.originalName});

  Pdf.fromJson(Map<String, dynamic> json) {
    downloadLink = json['download_link'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['download_link'] = this.downloadLink;
    data['original_name'] = this.originalName;
    return data;
  }
}