class User {
  User({
    this.id,
    this.name,
    this.email,
    this.contact,
    this.isBlocked,
    this.imagePath = "",
    this.nameEn = "",
    this.nameAr = "",
    this.isActive,
    this.deviceId,
    this.totalBooking,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;

  String nameEn;
  String nameAr;
  String? email;
  String? contact;
  String imagePath;

  int? isBlocked;
  int? isActive;
  dynamic deviceId;
  int? totalBooking;
  String? password;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        contact: json["contact"] ?? "",
        isBlocked: json["isBlocked"] ?? 0,
        isActive: json["isActive"] ?? 1,
        deviceId: json["device_id"],
        totalBooking: json["total_booking"] ?? 0,
        password: json["password"] ?? "",
        imagePath: json["image_path"],
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name ?? "",
        "name_en": nameEn,
        "name_ar": nameAr,
        "email": email ?? "",
        "contact": contact ?? "",
        "isBlocked": isBlocked ?? 0,
        "isActive": isActive ?? 1,
        "device_id": deviceId,
        "total_booking": totalBooking ?? 0,
        "password": password ?? "",
        "image_path": imagePath,
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
      };
}
