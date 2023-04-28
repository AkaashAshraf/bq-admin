// To parse this JSON data, do
//
//     final employeeDetails = employeeDetailsFromJson(jsonString);

import 'dart:convert';

EmployeeDetails employeeDetailsFromJson(String str) =>
    EmployeeDetails.fromJson(json.decode(str));

class EmployeeDetails {
  int status;
  String message;
  Stats? stats;

  EmployeeDetails({
    this.status = 0,
    this.message = "",
    this.stats,
  });

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        status: json["status"] ?? 0,
        message: json["message"] ?? "",
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      );
}

class Stats {
  int totalAppoinments;
  double totalEarning;

  int starRatters1;
  int starRatters2;

  int starRatters3;

  int starRatters4;

  int starRatters5;
  int totalStarRatters;
  double totalStarRatting;

  Stats({
    this.totalAppoinments = 0,
    this.totalEarning = 0.0,
    this.starRatters1 = 0,
    this.starRatters2 = 0,
    this.starRatters3 = 0,
    this.starRatters4 = 0,
    this.starRatters5 = 0,
    this.totalStarRatters = 0,
    this.totalStarRatting = 0,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        totalAppoinments: json["total_appoinments"] ?? 0,
        totalEarning: double.tryParse(json["total_earning"].toString()) ?? 0.0,
        starRatters1: json["star_ratters_1"] ?? 0,
        starRatters2: json["star_ratters_2"] ?? 0,
        starRatters3: json["star_ratters_3"] ?? 0,
        starRatters4: json["star_ratters_4"] ?? 0,
        starRatters5: json["star_ratters_5"] ?? 0,
        totalStarRatters: json["total_star_ratters"] ?? 0,
        totalStarRatting:
            double.tryParse(json["total_star_ratting"].toString()) ?? 0.0,
      );
}
