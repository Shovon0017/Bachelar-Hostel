class HostelListModel {
  List<Hostel>? hostel;

  HostelListModel({this.hostel});

  HostelListModel.fromJson(Map<String, dynamic> json) {
    if (json['hostel'] != null) {
      hostel = <Hostel>[];
      json['hostel'].forEach((v) {
        hostel!.add(new Hostel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hostel != null) {
      data['hostel'] = this.hostel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hostel {
  String? name;
  String? id;
  String? address;
  String? number;
  String? email;
  num? price;
  String? description;
  String? environment;
  String? image;

  Hostel(
      {this.name,
        this.id,
        this.address,
        this.number,
        this.email,
        this.price,
        this.description,
        this.environment,
        this.image});

  Hostel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    address = json['address'];
    number = json['number'];
    email = json['email'];
    price = json['price'];
    description = json['description'];
    environment = json['Environment'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['address'] = this.address;
    data['number'] = this.number;
    data['email'] = this.email;
    data['price'] = this.price;
    data['description'] = this.description;
    data['Environment'] = this.environment;
    data['image'] = this.image;
    return data;
  }
}
