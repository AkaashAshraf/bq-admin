import 'dart:convert';

import 'package:bq_admin/models/simple/employee.dart';

Employees employeesFromJson(String str) => Employees.fromJson(json.decode(str));

String employeesToJson(Employees data) => json.encode(data.toJson());

class Employees {
  Employees({
    this.status = 0,
    this.message = "",
    required this.data,
  });

  int status;
  String message;
  List<Employee> data;

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        status: json["status"],
        message: json["message"],
        data:
            List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
