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
  List<dynamic> products;

  Data({
    required this.categoryChilds,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryChilds: List<CategoryChild>.from(
            json["categoryChilds"].map((x) => CategoryChild.fromJson(x))),
        products: List<dynamic>.from(json["products"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "categoryChilds":
            List<dynamic>.from(categoryChilds.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x)),
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
