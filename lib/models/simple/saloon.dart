import 'package:bq_admin/models/simple/city.dart';
import 'package:bq_admin/models/simple/service.dart';

class Saloon {
  Saloon({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.city,
    this.type = 0,
    this.contact = "",
    this.latitude = "",
    this.longitude = "",
    this.descriptionEn = "",
    this.descriptionAr = "",
    this.openTime1 = "",
    this.closeTime1 = "",
    this.openTime2 = "",
    this.closeTime2 = "",
    this.status = 0,
    this.holiday = "",
    this.remainingAppointments = 0,
    this.imagePath = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.cityEn = "",
    this.cityAr = "",
    this.services,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  City? city;
  int? type;
  String? contact;
  String? latitude;
  String? longitude;
  String? descriptionEn;
  String? descriptionAr;
  String? openTime1;
  String? closeTime1;
  String? openTime2;
  String? closeTime2;
  int? status;
  String? holiday;
  int? remainingAppointments;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  String? cityEn;
  String? cityAr;
  List<Service>? services;

  factory Saloon.fromJson(Map<String, dynamic> json) => Saloon(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        type: json["type"] ?? 0,
        contact: json["contact"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        descriptionEn: json["description_en"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
        openTime1: json["open_time_1"] ?? "",
        closeTime1: json["close_time_1"] ?? "",
        openTime2: json["open_time_2"] ?? "",
        closeTime2: json["close_time_2"] ?? '',
        status: json["status"] ?? 0,
        holiday: json["holiday"] ?? "",
        remainingAppointments: json["remaining_appointments"] ?? 0,
        imagePath: json["image_path"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        cityEn: json["city_en"] ?? "",
        cityAr: json["city_ar"] ?? "",
        services: json["services"] == null
            ? []
            : json["services"] == null
                ? []
                : List<Service>.from(
                    json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "city": city?.toJson(),
        "type": type,
        "contact": contact,
        "latitude": latitude,
        "longitude": longitude,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
        "open_time_1": openTime1,
        "close_time_1": closeTime1,
        "open_time_2": openTime2,
        "close_time_2": closeTime2,
        "status": status,
        "holiday": holiday,
        "remaining_appointments": remainingAppointments,
        "image_path": imagePath,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "city_en": cityEn,
        "city_ar": cityAr,
      };
}
