import 'package:bq_admin/models/simple/general_service.dart';

class ProviderService {
  ProviderService({
    this.id = 0,
    this.companyId = 0,
    this.serviceId = 0,
    this.charges = "0",
    this.discount = 0,
    this.time = 0,
    this.chargesAfterDiscount = 0,
    this.isBlocked = 0,
    this.isActive = 1,
    this.discountTime = "0",
    this.estimatedTime = "0",
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
  int discount;
  int time;
  dynamic chargesAfterDiscount;
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

  factory ProviderService.fromJson(Map<String, dynamic> json) =>
      ProviderService(
        id: json["id"] ?? 0,
        companyId: json["company_id"] ?? 0,
        serviceId: json["service_id"] ?? 0,
        charges: json["charges"] ?? "0",
        discount: json["discount"] ?? 0,
        time: json["time"] ?? 0,
        chargesAfterDiscount: json["charges_after_discount"],
        isBlocked: json["isBlocked"] ?? 0,
        isActive: json["isActive"] ?? 1,
        discountTime: json["discount_time"] ?? "0",
        estimatedTime: json["estimated_time"] ?? "0",
        isDeleted: json["isDeleted"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        descriptionEn: json["description_en"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
        image: json["image"] ?? "",
        generalService: GeneralService.fromJson(json["general_service"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "service_id": serviceId,
        "charges": charges,
        "discount": discount,
        "time": time,
        "charges_after_discount": chargesAfterDiscount,
        "isBlocked": isBlocked,
        "isActive": isActive,
        "discount_time": discountTime,
        "estimated_time": estimatedTime,
        "isDeleted": isDeleted,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
        "image": image,
        "general_service": generalService,
      };
}
