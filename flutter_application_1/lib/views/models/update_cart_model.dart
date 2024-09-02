// To parse this JSON data, do
//
//     final updateCartModel = updateCartModelFromJson(jsonString);

import 'dart:convert';

UpdateCartModel updateCartModelFromJson(String str) =>
    UpdateCartModel.fromJson(json.decode(str));

String updateCartModelToJson(UpdateCartModel data) =>
    json.encode(data.toJson());

class UpdateCartModel {
  int status;
  String message;

  UpdateCartModel({
    required this.status,
    required this.message,
  });

  factory UpdateCartModel.fromJson(Map<String, dynamic> json) =>
      UpdateCartModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
