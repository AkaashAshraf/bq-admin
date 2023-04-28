class CartItem {
  CartItem(
      {this.productID = 0,
      this.nameEn = "",
      this.nameAr = "",
      this.imagePath = "",
      this.qty = 1,
      this.time = 0,
      this.unitPrice = 0,
      this.providerID = 0});

  int productID;
  int providerID;

  String nameEn;
  String imagePath;
  String nameAr;
  int qty;
  double unitPrice;
  int time;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productID: json["productID"] ?? 0,
        providerID: json["providerID"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        imagePath: json["image_path"] ?? "",
        qty: json["qty"] ?? 0,
        unitPrice: json["unitPrice"] ?? 0,
        time: json["time"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "productID": productID,
        "providerID": providerID,
        "name_en": nameEn,
        "name_ar": nameAr,
        "image_path": imagePath,
        "qty": qty,
        "unitPrice": unitPrice,
        "time": time,
      };
}
