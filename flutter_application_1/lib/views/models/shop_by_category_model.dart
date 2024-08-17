// To parse this JSON data, do
//
//     final shopByCategoryModel = shopByCategoryModelFromJson(jsonString);

import 'dart:convert';

ShopByCategoryModel shopByCategoryModelFromJson(String str) =>
    ShopByCategoryModel.fromJson(json.decode(str));

String shopByCategoryModelToJson(ShopByCategoryModel data) =>
    json.encode(data.toJson());

class ShopByCategoryModel {
  int status;
  List<Datum> data;

  ShopByCategoryModel({
    required this.status,
    required this.data,
  });

  factory ShopByCategoryModel.fromJson(Map<String, dynamic> json) =>
      ShopByCategoryModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String title;
  String image;

  Datum({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
