class FavoriteProductModel {
  int? id;
  String? imageUrl;
  String? name;
  String? monthlyPrice;
  int? salePrice;

  FavoriteProductModel(
      {this.id, this.imageUrl, this.name, this.monthlyPrice, this.salePrice});

  FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    monthlyPrice = json['monthlyPrice'];
    salePrice = json['salePrice'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'imageUrl': this.imageUrl,
      'monthlyPrice': this.monthlyPrice,
      'salePrice': this.salePrice,
    };
  }
}
