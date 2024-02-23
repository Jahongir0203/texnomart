import 'catalog_page_model.dart';

class CatalogPageModel {
  bool? success;
  String? message;
  int? code;
  DataChild? data;

  CatalogPageModel({this.success, this.message, this.code, this.data});

  CatalogPageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new DataChild.fromJson(json['data']) : null;
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

class DataChild {
  List<DataCatalog>? data;

  DataChild({this.data});

  DataChild.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataCatalog>[];
      json['data'].forEach((v) {
        data!.add(new DataCatalog.fromJson(v));
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

class DataCatalog {
  String? slug;
  String? name;
  String? icon;
  bool? showChildsInWebMobile;
  List<Childs>? childs;

  DataCatalog(
      {this.slug,
        this.name,
        this.icon,
        this.showChildsInWebMobile,
        this.childs});

  DataCatalog.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    icon = json['icon'];
    showChildsInWebMobile = json['show_childs_in_web_mobile'];
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs!.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['show_childs_in_web_mobile'] = this.showChildsInWebMobile;
    if (this.childs != null) {
      data['childs'] = this.childs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  String? slug;
  String? name;
  bool? showChildsInWebMobile;
  List<ChildsModel>? childs;

  Childs({this.slug, this.name, this.showChildsInWebMobile, this.childs});

  Childs.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    showChildsInWebMobile = json['show_childs_in_web_mobile'];
    if (json['childs'] != null) {
      childs = <ChildsModel>[];
      json['childs'].forEach((v) { 
        childs!.add(new ChildsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['show_childs_in_web_mobile'] = this.showChildsInWebMobile;
    if (this.childs != null) {
      data['childs'] = this.childs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildsModel {
  String? slug;
  String? name;
  bool? showChildsInWebMobile;

  ChildsModel({this.slug, this.name, this.showChildsInWebMobile});

  ChildsModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    showChildsInWebMobile = json['show_childs_in_web_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['show_childs_in_web_mobile'] = this.showChildsInWebMobile;
    return data;
  }
}