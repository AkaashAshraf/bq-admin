// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

import 'package:bq_admin/models/simple/service.dart';

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));

class Services {
  Services({
    this.status = 0,
    this.message = "",
    this.data,
  });

  int status;
  String message;
  List<Service>? data;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        status: json["status"],
        message: json["message"],
        data: List<Service>.from(json["data"].map((x) => Service.fromJson(x))),
      );
}
