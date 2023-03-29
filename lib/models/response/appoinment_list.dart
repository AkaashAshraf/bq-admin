// To parse this JSON data, do
//
//     final appointments = appointmentsFromJson(jsonString);

import 'dart:convert';

import 'package:bq_admin/models/simple/appointment.dart';

Appointments appointmentsFromJson(String str) =>
    Appointments.fromJson(json.decode(str));

String appointmentsToJson(Appointments data) => json.encode(data.toJson());

class Appointments {
  Appointments({
    this.status = '',
    this.message = '',
    required this.data,
  });

  String status;
  String message;
  List<Appointment> data;

  factory Appointments.fromJson(Map<String, dynamic> json) => Appointments(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        data: List<Appointment>.from(
            json["data"].map((x) => Appointment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
