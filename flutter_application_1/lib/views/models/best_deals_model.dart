// To parse this JSON data, do
//
//     final bestDealsModel = bestDealsModelFromJson(jsonString);

import 'dart:convert';

BestDealsModel bestDealsModelFromJson(String str) =>
    BestDealsModel.fromJson(json.decode(str));

String bestDealsModelToJson(BestDealsModel data) => json.encode(data.toJson());

class BestDealsModel {
  int status;
  Data data;

  BestDealsModel({
    required this.status,
    required this.data,
  });

  factory BestDealsModel.fromJson(Map<String, dynamic> json) => BestDealsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  List<Product> products;

  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  String pid;
  String title;
  String body;
  String image;
  int favorite;
  String price;
  String vid;
  int discountShow;
  int discountPercentage;
  String calculatedPrice;
  String basePrice;

  Product({
    required this.pid,
    required this.title,
    required this.body,
    required this.image,
    required this.favorite,
    required this.price,
    required this.vid,
    required this.discountShow,
    required this.discountPercentage,
    required this.calculatedPrice,
    required this.basePrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        pid: json["pid"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        favorite: json["favorite"],
        price: json["price"],
        vid: json["vid"],
        discountShow: json["discount_show"],
        discountPercentage: json["discount_percentage"],
        calculatedPrice: json["calculated_price"],
        basePrice: json["base_price"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "title": title,
        "body": body,
        "image": image,
        "favorite": favorite,
        "price": price,
        "vid": vid,
        "discount_show": discountShow,
        "discount_percentage": discountPercentage,
        "calculated_price": calculatedPrice,
        "base_price": basePrice,
      };
}
