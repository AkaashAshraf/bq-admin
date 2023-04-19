// To parse this JSON data, do
//
//     final generalResponse = generalResponseFromJson(jsonString);

import 'dart:convert';

GeneralResponse generalResponseFromJson(String str) =>
    GeneralResponse.fromJson(json.decode(str));

String generalResponseToJson(GeneralResponse data) =>
    json.encode(data.toJson());

class GeneralResponse {
  GeneralResponse({
    this.status = 0,
    this.message = "",
    this.messageAr = "",
    this.data,
  });

  int status;
  String message;
  String messageAr;
  String? data;

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      GeneralResponse(
        status: json["status"] ?? 0,
        message: json["message"] ?? "",
        messageAr: json["message_ar"] ?? "",
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ar": messageAr,
        "data": data,
      };
}
