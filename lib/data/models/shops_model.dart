class ShopsModel {
  int? id;
  String? name;
  String? lat;
  String? long;
  String? phone;
  String? address;
  String? description;
  String? workTime;

  ShopsModel(
      {this.id,
        this.name,
        this.lat,
        this.long,
        this.phone,
        this.address,
        this.description,
        this.workTime});

  ShopsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    workTime = json['work_time'];
  }
}