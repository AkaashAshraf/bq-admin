// To parse this JSON data, do
//
//     final constants = constantsFromJson(jsonString);

import 'dart:convert';

import 'package:bq_admin/models/simple/city.dart';
import 'package:bq_admin/models/simple/country.dart';
import 'package:bq_admin/models/simple/general_service.dart';
import 'package:bq_admin/models/simple/religion.dart';

Constants constantsFromJson(String str) => Constants.fromJson(json.decode(str));

String constantsToJson(Constants data) => json.encode(data.toJson());

class Constants {
  Constants({
    this.status = 0,
    this.message = "",
    this.data,
  });

  int status;
  String message;
  Data? data;

  factory Constants.fromJson(Map<String, dynamic> json) => Constants(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.cities,
    this.religions,
    this.countries,
    this.generalServices,
  });

  List<City>? cities;
  List<Religion>? religions;
  List<Country>? countries;
  List<GeneralService>? generalServices;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
        religions: List<Religion>.from(
            json["religions"].map((x) => Religion.fromJson(x))),
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
        generalServices: List<GeneralService>.from(
            json["general_services"].map((x) => GeneralService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
        "religions": List<dynamic>.from(religions!.map((x) => x.toJson())),
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}
