class ProductModel {
  Data? data;
  String? message;
  int? code;

  ProductModel({this.data, this.message, this.code});

  ProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['code'] = code;

    return data;
  }
}

class Data {
  List<Product>? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['data'] = product!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  int? quantity;
  int? price;
  int? offer;
  String? image;
  String? available;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.description,
      this.quantity,
      this.price,
      this.offer,
      this.image,
      this.available,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    offer = json['offer'];
    image = json['image'];
    available = json['available'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['offer'] = offer;
    data['image'] = image;
    data['available'] = available;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
