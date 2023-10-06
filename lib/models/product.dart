class Product {
  int? id;
  String? name;
  String? price;
  String? description;
  String? pictureURL;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({this.name, this.price, this.description, this.pictureURL});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "description": description,
      "pictureURL": pictureURL,
    };
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    pictureURL = json['pictureURL'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
