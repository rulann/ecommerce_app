// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
    int status;
    List<Datum> data;

    SliderModel({
        required this.status,
        required this.data,
    });

    factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
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
    String image;
    String brand;

    Datum({
        required this.id,
        required this.image,
        required this.brand,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        brand: json["brand"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "brand": brand,
    };
}
