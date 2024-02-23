class SlidersModel {
  bool? success;
  String? message;
  int? code;
  SlidersList? data;

  SlidersModel({this.success, this.message, this.code, this.data});

  SlidersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new SlidersList.fromJson(json['data']) : null;
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

class SlidersList {
  List<Data>? data;

  SlidersList({this.data});

  SlidersList.fromJson(Map<String, dynamic> json) {
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
  String? link;
  String? title;
  String? imageWeb;
  String? imageMobileWeb;

  Data({this.id, this.link, this.title, this.imageWeb, this.imageMobileWeb});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    title = json['title'];
    imageWeb = json['image_web'];
    imageMobileWeb = json['image_mobile_web'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['title'] = this.title;
    data['image_web'] = this.imageWeb;
    data['image_mobile_web'] = this.imageMobileWeb;
    return data;
  }
}