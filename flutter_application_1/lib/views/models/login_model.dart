// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  int status;
  Data data;

  LogInModel({
    required this.status,
    required this.data,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        status: json["status"],
        data: Data.fromJson(json[
            "data"]), // (type 'Null' is not a subtype of type 'Map<String, dynamic>'
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String uid;
  String role;
  String userName;
  String email;
  String phoneNumber;
  String token;

  Data({
    required this.uid,
    required this.role,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uid: json["uid"] ?? '',
        role: json["role"] ?? '',
        userName: json["user_name"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "role": role,
        "user_name": userName,
        "email": email,
        "phone_number": phoneNumber,
        "token": token,
      };
}
