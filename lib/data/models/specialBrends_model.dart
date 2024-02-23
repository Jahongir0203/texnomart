class SpecialBrendsModel {
  bool? success;
  String? message;
  int? code;
  Brends? data;

  SpecialBrendsModel({this.success, this.message, this.code, this.data});

  SpecialBrendsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Brends.fromJson(json['data']) : null;
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
 
class Brends {
  List<Data>? data;

  Brends({this.data});

  Brends.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
  String? name;
  String? slug;
  String? image;
  String? imageAlt;
  Meta? meta;

  Data({this.name, this.slug, this.image, this.imageAlt, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    imageAlt = json['image_alt'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['image_alt'] = this.imageAlt;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Meta {
  String? title;
  Null? description;
  Null? keywords;

  Meta({this.title, this.description, this.keywords});

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['keywords'] = this.keywords;
    return data;
  }
}