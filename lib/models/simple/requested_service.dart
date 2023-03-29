import 'package:bq_admin/models/simple/provider_service.dart';

class RequestedService {
  RequestedService({
    this.id = 0,
    this.requestId = 0,
    this.serviceId = 0,
    this.price = 0,
    this.disount = 0,
    this.priceAfterDiscount = 0,
    this.discountDescription = "",
    this.status = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.providerService,
  });

  int id;
  int requestId;
  int serviceId;
  double price;
  int disount;
  double priceAfterDiscount;
  int status;
  String discountDescription;

  String createdAt;
  String updatedAt;
  ProviderService? providerService;

  factory RequestedService.fromJson(Map<String, dynamic> json) =>
      RequestedService(
        id: json["id"] ?? 0,
        requestId: json["request_id"] ?? 0,
        serviceId: json["service_id"] ?? 0,
        price: double.tryParse(json["price"].toString()) ?? 0,
        disount: json["disount"] ?? 0,
        priceAfterDiscount:
            double.tryParse(json["price_after_discount"].toString()) ?? 0,
        discountDescription: json["discount_description"] ?? "",
        status: json["status"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        providerService:
            ProviderService.fromJson(json["provider_service"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "request_id": requestId,
        "service_id": serviceId,
        "price": price,
        "disount": disount,
        "price_after_discount": priceAfterDiscount,
        "discount_description": discountDescription,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "provider_service": providerService,
      };
}
