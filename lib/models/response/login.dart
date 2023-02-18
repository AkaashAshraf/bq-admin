// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

import 'package:bq_admin/models/user.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? "",
        "message": message ?? "",
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "token": token ?? "",
      };
}
