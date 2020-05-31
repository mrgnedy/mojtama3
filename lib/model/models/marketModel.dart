class MarketModel {
  String msg;
  Data data;

  MarketModel({this.msg, this.data});

  MarketModel.fromJson(Map<String, dynamic> json) {
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
  int remains;
  List<Ads> ads;
  List<Games> games;
  List<Gifs> gifs;
  List<SpecialIds> specialIds;
  List<Places> places;
  Inside inside;

  Data(
      {this.remains,
      this.ads,
      this.games,
      this.gifs,
      this.specialIds,
      this.places,
      this.inside});

  Data.fromJson(Map<String, dynamic> json) {
    remains = json['remains'];
    if (json['ads'] != null) {
      ads = new List<Ads>();
      json['ads'].forEach((v) {
        ads.add(new Ads.fromJson(v));
      });
    }
    if (json['games'] != null) {
      games = new List<Games>();
      json['games'].forEach((v) {
        games.add(new Games.fromJson(v));
      });
    }
    if (json['gifs'] != null) {
      gifs = new List<Gifs>();
      json['gifs'].forEach((v) {
        gifs.add(new Gifs.fromJson(v));
      });
    }
    if (json['special_ids'] != null) {
      specialIds = new List<SpecialIds>();
      json['special_ids'].forEach((v) {
        specialIds.add(new SpecialIds.fromJson(v));
      });
    }
    if (json['places'] != null) {
      places = new List<Places>();
      json['places'].forEach((v) {
        places.add(new Places.fromJson(v));
      });
    }
    inside =
        json['inside'] != null ? new Inside.fromJson(json['inside']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remains'] = this.remains;
    if (this.ads != null) {
      data['ads'] = this.ads.map((v) => v.toJson()).toList();
    }
    if (this.games != null) {
      data['games'] = this.games.map((v) => v.toJson()).toList();
    }
    if (this.gifs != null) {
      data['gifs'] = this.gifs.map((v) => v.toJson()).toList();
    }
    if (this.specialIds != null) {
      data['special_ids'] = this.specialIds.map((v) => v.toJson()).toList();
    }
    if (this.places != null) {
      data['places'] = this.places.map((v) => v.toJson()).toList();
    }
    if (this.inside != null) {
      data['inside'] = this.inside.toJson();
    }
    return data;
  }
}

class Ads {
  int id;
  String desc;
  String image;
  String createdAt;
  String updatedAt;

  Ads({this.id, this.desc, this.image, this.createdAt, this.updatedAt});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desc = json['desc'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Games {
  int id;
  String name;
  String url;
  String image;
  String createdAt;
  String updatedAt;

  Games(
      {this.id,
      this.name,
      this.url,
      this.image,
      this.createdAt,
      this.updatedAt});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Gifs {
  int id;
  String type;
  String coins;
  String image;
  String createdAt;
  String updatedAt;

  Gifs(
      {this.id,
      this.type,
      this.coins,
      this.image,
      this.createdAt,
      this.updatedAt});

  Gifs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    coins = json['coins'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['coins'] = this.coins;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Places {
  int id;
  int place;
  String value;
  String createdAt;
  String updatedAt;

  Places({this.id, this.place, this.value, this.createdAt, this.updatedAt});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    place = json['place'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['place'] = this.place;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Inside {
  int remains;
  List<Coins> coins;
  List<Offers> offers;
  List<Ads> ads;
  List<Games> games;

  Inside({this.remains, this.coins, this.offers, this.ads, this.games});

  Inside.fromJson(Map<String, dynamic> json) {
    remains = json['remains'];
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = new List<Ads>();
      json['ads'].forEach((v) {
        ads.add(new Ads.fromJson(v));
      });
    }
    if (json['games'] != null) {
      games = new List<Games>();
      json['games'].forEach((v) {
        games.add(new Games.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remains'] = this.remains;
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    if (this.ads != null) {
      data['ads'] = this.ads.map((v) => v.toJson()).toList();
    }
    if (this.games != null) {
      data['games'] = this.games.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coins {
  int id;
  int value;
  String salary;
  String createdAt;
  String updatedAt;

  Coins({this.id, this.value, this.salary, this.createdAt, this.updatedAt});

  Coins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    salary = json['salary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['salary'] = this.salary;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Offers {
  int id;
  int value;
  String salary;
  int status;
  String offer;
  String createdAt;
  String updatedAt;

  Offers(
      {this.id,
      this.value,
      this.salary,
      this.status,
      this.offer,
      this.createdAt,
      this.updatedAt});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    salary = json['salary'];
    status = json['status'];
    offer = json['offer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['salary'] = this.salary;
    data['status'] = this.status;
    data['offer'] = this.offer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}