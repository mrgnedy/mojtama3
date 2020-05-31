// class GamesModel {
//   String msg;
//   Data data;

//   GamesModel({this.msg, this.data});

//   GamesModel.fromJson(Map<String, dynamic> json) {
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
//   List<Games> games;

//   Data({this.games});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['games'] != null) {
//       games = new List<Games>();
//       json['games'].forEach((v) {
//         games.add(new Games.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.games != null) {
//       data['games'] = this.games.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Games {
//   int id;
//   String name;
//   String image;
//   String url;
//   String createdAt;
//   String updatedAt;

//   Games(
//       {this.id,
//         this.name,
//         this.image,
//         this.url,
//         this.createdAt,
//         this.updatedAt});

//   Games.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     url = json['url'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['url'] = this.url;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }