// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) =>
    json.encode(data.toJson());

class SubCategoryModel {
  int status;
  Data data;

  SubCategoryModel({
    required this.status,
    required this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  List<CategoryChild> categoryChilds;
  List<Product> products;

  Data({
    required this.categoryChilds,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryChilds: List<CategoryChild>.from(
            json["categoryChilds"].map((x) => CategoryChild.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryChilds":
            List<dynamic>.from(categoryChilds.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class CategoryChild {
  String id;
  String title;
  String image;

  CategoryChild({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryChild.fromJson(Map<String, dynamic> json) => CategoryChild(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
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
