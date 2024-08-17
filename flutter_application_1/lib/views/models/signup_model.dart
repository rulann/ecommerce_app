// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  int status;
  Data data;

  SignUpModel({
    required this.status,
    required this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
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
        uid: json["uid"],
        role: json["role"],
        userName: json["user_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        token: json["token"],
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
