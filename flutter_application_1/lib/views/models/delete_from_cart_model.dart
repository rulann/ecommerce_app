// To parse this JSON data, do
//
//     final removeFromCartModel = removeFromCartModelFromJson(jsonString);

import 'dart:convert';

RemoveFromCartModel removeFromCartModelFromJson(String str) =>
    RemoveFromCartModel.fromJson(json.decode(str));

String removeFromCartModelToJson(RemoveFromCartModel data) =>
    json.encode(data.toJson());

class RemoveFromCartModel {
  int status;
  String message;

  RemoveFromCartModel({
    required this.status,
    required this.message,
  });

  factory RemoveFromCartModel.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
