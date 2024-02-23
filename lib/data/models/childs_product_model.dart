class ChildsProductModel {
  bool? success;
  String? message;
  int? code;
  Data? data;

  ChildsProductModel({this.success, this.message, this.code, this.data});

  ChildsProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Products>? products;
  List<Filter>? filter;
  Price? price;
  List<Stickers>? stickers;
  List<Brand>? brands;
  List<SaleMonths>? saleMonths;
  int? saleMonthsCount;
  int? brandsCount;
  Pagination? pagination;

  Data(
      {this.products,
        this.filter,
        this.price,
        this.stickers,
        this.brands,
        this.saleMonths,
        this.saleMonthsCount,
        this.brandsCount,
        this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['filter'] != null) {
      filter = <Filter>[];
      json['filter'].forEach((v) {
        filter!.add(new Filter.fromJson(v));
      });
    }
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    if (json['stickers'] != null) {
      stickers = <Stickers>[];
      json['stickers'].forEach((v) {
        stickers!.add(new Stickers.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brand>[];
      json['brands'].forEach((v) {
        brands!.add(new Brand.fromJson(v));
      });
    }
    if (json['sale_months'] != null) {
      saleMonths = <SaleMonths>[];
      json['sale_months'].forEach((v) {
        saleMonths!.add(new SaleMonths.fromJson(v));
      });
    }
    saleMonthsCount = json['sale_months_count'];
    brandsCount = json['brands_count'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.filter != null) {
      data['filter'] = this.filter!.map((v) => v.toJson()).toList();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.stickers != null) {
      data['stickers'] = this.stickers!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.saleMonths != null) {
      data['sale_months'] = this.saleMonths!.map((v) => v.toJson()).toList();
    }
    data['sale_months_count'] = this.saleMonthsCount;
    data['brands_count'] = this.brandsCount;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? image;
  List<dynamic>? saleMonths;
  List<dynamic>? stickers;
  String? availability;
  int? discount;
  String? code;
  List<MainCharacters>? mainCharacters;
  int? salePrice;
  String? fSalePrice;
  num? oldPrice;
  String? fOldPrice;
  num? loanPrice;
  String? fLoanPrice;
  String? axiomMonthlyPrice;
  int? reviewsCount;
  num? reviewsAverage;
  int? allCount;
  Brand? brand;

  Products(
      {this.id,
        this.name,
        this.image,
        this.saleMonths,
        this.stickers,
        this.availability,
        this.discount,
        this.code,
        this.mainCharacters,
        this.salePrice,
        this.fSalePrice,
        this.oldPrice,
        this.fOldPrice,
        this.loanPrice,
        this.fLoanPrice,
        this.axiomMonthlyPrice,
        this.reviewsCount,
        this.reviewsAverage,
        this.allCount,
        this.brand});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    saleMonths = json['sale_months'];
    availability = json['availability'];
    discount = json['discount'];
    code = json['code'];
    if (json['main_characters'] != null) {
      mainCharacters = <MainCharacters>[];
      json['main_characters'].forEach((v) {
        mainCharacters!.add(new MainCharacters.fromJson(v));
      });
    }
    salePrice = json['sale_price'];
    fSalePrice = json['f_sale_price'];
    oldPrice = json['old_price'];
    fOldPrice = json['f_old_price'];
    loanPrice = json['loan_price'];
    fLoanPrice = json['f_loan_price'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    reviewsCount = json['reviews_count'];
    reviewsAverage = json['reviews_average'];
    allCount = json['all_count'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sale_months'] = this.saleMonths;
    data['availability'] = this.availability;
    data['discount'] = this.discount;
    data['code'] = this.code;
    if (this.mainCharacters != null) {
      data['main_characters'] =
          this.mainCharacters!.map((v) => v.toJson()).toList();
    }
    data['sale_price'] = this.salePrice;
    data['f_sale_price'] = this.fSalePrice;
    data['old_price'] = this.oldPrice;
    data['f_old_price'] = this.fOldPrice;
    data['loan_price'] = this.loanPrice;
    data['f_loan_price'] = this.fLoanPrice;
    data['axiom_monthly_price'] = this.axiomMonthlyPrice;
    data['reviews_count'] = this.reviewsCount;
    data['reviews_average'] = this.reviewsAverage;
    data['all_count'] = this.allCount;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    return data;
  }
}

class MainCharacters {
  String? name;
  String? value;
  int? order;

  MainCharacters({this.name, this.value, this.order});

  MainCharacters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['order'] = this.order;
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  String? name;

  Brand({this.id, this.slug, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    return data;
  }
}

class Filter {
  int? id;
  String? name;
  int? count;
  List<Values>? values;

  Filter({this.id, this.name, this.count, this.values});

  Filter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  int? id;
  String? value;
  int? count;

  Values({this.id, this.value, this.count});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['count'] = this.count;
    return data;
  }
}

class Price {
  int? maxPrice;
  int? minPrice;

  Price({this.maxPrice, this.minPrice});

  Price.fromJson(Map<String, dynamic> json) {
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max_price'] = this.maxPrice;
    data['min_price'] = this.minPrice;
    return data;
  }
}

class Stickers {
  int? id;
  String? name;
  int? count;

  Stickers({this.id, this.name, this.count});

  Stickers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    return data;
  }
}

class SaleMonths {
  int? id;
  String? key;
  String? name;
  String? appTitle;
  int? count;

  SaleMonths({this.id, this.key, this.name, this.appTitle, this.count});

  SaleMonths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    appTitle = json['app_title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['name'] = this.name;
    data['app_title'] = this.appTitle;
    data['count'] = this.count;
    return data;
  }
}

class Pagination {
  int? totalCount;
  int? currentPage;
  int? totalPage;
  int? pageSize;

  Pagination(
      {this.totalCount, this.currentPage, this.totalPage, this.pageSize});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['current_page'] = this.currentPage;
    data['total_page'] = this.totalPage;
    data['page_size'] = this.pageSize;
    return data;
  }
}