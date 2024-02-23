class HitProductsModel {
  bool? success;
  String? message;
  int? code;
  Products? data;

  HitProductsModel({this.success, this.message, this.code, this.data});

  HitProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Products.fromJson(json['data']) : null;
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

class Products {  
  List<Data>? data;

  Products({this.data});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  String? availability;
  String? axiomMonthlyPrice;
  int? salePrice;
  int? oldPrice;
  int? reviewsCount;
  int? reviewsAverage;
  int? allCount;
  List<Stickers>? stickers;
  List<SaleMonths>? saleMonths;

  Data(
      {this.id,
        this.name,
        this.image,
        this.availability,
        this.axiomMonthlyPrice,
        this.salePrice,
        this.oldPrice,
        this.reviewsCount,
        this.reviewsAverage,
        this.allCount,
        this.stickers,
        this.saleMonths});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    availability = json['availability'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    salePrice = json['sale_price'];
    oldPrice = json['old_price'];
    reviewsCount = json['reviews_count'];
    reviewsAverage = json['reviews_average'];
    allCount = json['all_count'];
    if (json['stickers'] != null) {
      stickers = <Stickers>[];
      json['stickers'].forEach((v) {
        stickers!.add(new Stickers.fromJson(v));
      });
    }
    if (json['sale_months'] != null) {
      saleMonths = <SaleMonths>[];
      json['sale_months'].forEach((v) {
        saleMonths!.add(new SaleMonths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['availability'] = this.availability;
    data['axiom_monthly_price'] = this.axiomMonthlyPrice;
    data['sale_price'] = this.salePrice;
    data['old_price'] = this.oldPrice;
    data['reviews_count'] = this.reviewsCount;
    data['reviews_average'] = this.reviewsAverage;
    data['all_count'] = this.allCount;
    if (this.stickers != null) {
      data['stickers'] = this.stickers!.map((v) => v.toJson()).toList();
    }
    if (this.saleMonths != null) {
      data['sale_months'] = this.saleMonths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stickers {
  String? name;
  String? backgroundColor;
  String? textColor;
  bool? isImage;
  bool? showInCard;
  Null? image;

  Stickers(
      {this.name,
        this.backgroundColor,
        this.textColor,
        this.isImage,
        this.showInCard,
        this.image});

  Stickers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    backgroundColor = json['background_color'];
    textColor = json['text_color'];
    isImage = json['is_image'];
    showInCard = json['show_in_card'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['background_color'] = this.backgroundColor;
    data['text_color'] = this.textColor;
    data['is_image'] = this.isImage;
    data['show_in_card'] = this.showInCard;
    data['image'] = this.image;
    return data;
  }
}

class SaleMonths {
  int? id;
  String? key;
  String? name;
  String? image;

  SaleMonths({this.id, this.key, this.name, this.image});

  SaleMonths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}