import 'package:bq_admin/models/simple/general_service.dart';

class Service {
  Service({
    this.id = 0,
    this.companyId = 0,
    this.serviceId = 0,
    this.charges = "",
    this.discount = '',
    this.time = '',
    this.chargesAfterDiscount = "",
    this.isBlocked = 0,
    this.isActive = 0,
    this.discountTime = "",
    this.estimatedTime,
    this.isDeleted = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.descriptionEn = "",
    this.descriptionAr = "",
    this.image = "",
    required this.generalService,
  });

  int id;
  int companyId;
  int serviceId;
  String charges;
  String discount;
  String time;
  String chargesAfterDiscount;
  int isBlocked;
  int isActive;
  String discountTime;
  dynamic estimatedTime;
  int isDeleted;
  String createdAt;
  String updatedAt;
  String descriptionEn;
  String descriptionAr;
  String image;
  GeneralService generalService;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"] ?? 0,
        companyId: json["company_id"] ?? 0,
        serviceId: json["service_id"] ?? 0,
        charges: json["charges"].toString(),
        discount: json["discount"].toString(),
        time: json["time"].toString(),
        chargesAfterDiscount: json["charges_after_discount"].toString(),
        isBlocked: json["isBlocked"] ?? 0,
        isActive: json["isActive"] ?? 0,
        discountTime: json["discount_time"] ?? "",
        estimatedTime: json["estimated_time"] ?? "",
        isDeleted: json["isDeleted"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        descriptionEn: json["description_en"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
        image: json["image"] ?? "",
        generalService: json["general_service"] == null
            ? GeneralService()
            : GeneralService.fromJson(json["general_service"]),
      );
}
