// class GifsModel {
//   String msg;
//   Data data;

//   GifsModel({this.msg, this.data});

//   GifsModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Gifs> gifs;

//   Data({this.gifs});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['gifs'] != null) {
//       gifs = new List<Gifs>();
//       json['gifs'].forEach((v) {
//         gifs.add(new Gifs.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.gifs != null) {
//       data['gifs'] = this.gifs.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Gifs {
//   int id;
//   String type;
//   String coins;
//   String image;
//   String createdAt;
//   String updatedAt;

//   Gifs(
//       {this.id,
//         this.type,
//         this.coins,
//         this.image,
//         this.createdAt,
//         this.updatedAt});

//   Gifs.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     coins = json['coins'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type'] = this.type;
//     data['coins'] = this.coins;
//     data['image'] = this.image;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }