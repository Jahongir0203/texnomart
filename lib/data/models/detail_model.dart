class DetailModel {
  bool? success;
  String? message;
  int? code;
  Details? data;

  DetailModel({this.success, this.message, this.code, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Details.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Details {
  Data? data;

  Details({this.data});

  Details.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? guarantee;
  Catalog? catalog;
  List<String>? smallImages;
  List<String>? largeImages;
  String? availability;
  String? brand;
  int? salePrice;
  int? loanPrice;
  String? monthlyPrice;
  String? code;
  int? reviewsCount;
  Seo? seo;
  List<MainCharacters>? mainCharacters;
  List<Breadcrumbs>? breadcrumbs;
  String? description;
  String? overview;
  List<CharactericsModel>? characters;
  List<AvailableStores>? availableStores;

  Data({
    this.id,
    this.name,
    this.guarantee,
    this.catalog,
    this.smallImages,
    this.largeImages,
    this.availability,
    this.brand,
    this.salePrice,
    this.loanPrice,
    this.monthlyPrice,
    this.code,
    this.reviewsCount,
    this.seo,
    this.mainCharacters,
    this.breadcrumbs,
    this.description,
    this.overview,
    this.characters,
    this.availableStores,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guarantee = json['guarantee'];
    catalog =
        json['catalog'] != null ? new Catalog.fromJson(json['catalog']) : null;
    smallImages = json['small_images'].cast<String>();
    largeImages = json['large_images'].cast<String>();
    availability = json['availability'];
    brand = json['brand'];
    salePrice = json['sale_price'];
    loanPrice = json['loan_price'];
    monthlyPrice = json['monthly_price'];
    code = json['code'];

    reviewsCount = json['reviews_count'];

    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;

    if (json['main_characters'] != null) {
      mainCharacters = <MainCharacters>[];
      json['main_characters'].forEach((v) {
        mainCharacters!.add(new MainCharacters.fromJson(v));
      });
    }

    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(new Breadcrumbs.fromJson(v));
      });
    }
    description = json['description'];
    overview = json['overview'];
    if (json['characters'] != null) {
      characters = <CharactericsModel>[];
      json['characters'].forEach((v) {
        characters!.add(new CharactericsModel.fromJson(v));
      });
    }
    if (json['available_stores'] != null) {
      availableStores = <AvailableStores>[];
      json['available_stores'].forEach((v) {
        availableStores!.add(new AvailableStores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guarantee'] = this.guarantee;
    if (this.catalog != null) {
      data['catalog'] = this.catalog!.toJson();
    }
    data['small_images'] = this.smallImages;
    data['large_images'] = this.largeImages;
    data['availability'] = this.availability;
    data['brand'] = this.brand;
    data['sale_price'] = this.salePrice;
    data['loan_price'] = this.loanPrice;
    data['monthly_price'] = this.monthlyPrice;
    data['code'] = this.code;

    data['reviews_count'] = this.reviewsCount;
    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }

    if (this.mainCharacters != null) {
      data['main_characters'] =
          this.mainCharacters!.map((v) => v.toJson()).toList();
    }

    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['overview'] = this.overview;
    if (this.characters != null) {
      data['characters'] = this.characters!.map((v) => v.toJson()).toList();
    }
    if (this.availableStores != null) {
      data['available_stores'] =
          this.availableStores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catalog {
  String? name;
  int? minPrice;
  int? maxPrice;

  Catalog({this.name, this.minPrice, this.maxPrice});

  Catalog.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    return data;
  }
}

class Seo {
  String? title;
  String? description;
  String? keywords;
  String? image;
  String? scriptSeo;

  Seo(
      {this.title,
      this.description,
      this.keywords,
      this.image,
      this.scriptSeo});

  Seo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    image = json['image'];
    scriptSeo = json['script_seo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['keywords'] = this.keywords;
    data['image'] = this.image;
    data['script_seo'] = this.scriptSeo;
    return data;
  }
}

class MainCharacters {
  String? name;
  String? value;

  MainCharacters({this.name, this.value});

  MainCharacters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Breadcrumbs {
  String? name;
  String? slug;
  int? id;
  String? type;

  Breadcrumbs({this.name, this.slug, this.id, this.type});

  Breadcrumbs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class CharactericsModel {
  String? name;
  List<Characters>? characters;

  CharactericsModel({this.name, this.characters});

  CharactericsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters!.add(new Characters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.characters != null) {
      data['characters'] = this.characters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Characters {
  String? name;
  String? value;

  Characters({this.name, this.value});

  Characters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class AvailableStores {
  int? id;
  String? name;
  String? lat;
  String? long;
  String? phone;
  String? address;
  String? description;
  String? workTime;

  AvailableStores(
      {this.id,
      this.name,
      this.lat,
      this.long,
      this.phone,
      this.address,
      this.description,
      this.workTime});

  AvailableStores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    workTime = json['work_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['description'] = this.description;
    data['work_time'] = this.workTime;
    return data;
  }
}
