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
    this.passwordUpdatedAt = "",
    this.deviceId,
    this.totalBooking,
    this.password,
    this.descriptionAr = "",
    this.createdAt,
    this.updatedAt,
    this.closeTime1 = "",
    this.closeTime2 = "",
    this.openTime1 = "",
    this.openTime2 = "",
  });

  int? id;
  String? name;

  String nameEn;
  String nameAr;
  String? email;
  String? contact;
  String imagePath;
  String? passwordUpdatedAt;
  String descriptionAr;
  String openTime1;
  String closeTime1;
  String openTime2;
  String closeTime2;
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
        passwordUpdatedAt: json["password_update_at"] ?? "",
        nameAr: json["name_ar"] ?? "",
        name: json["name"] ?? "",
        openTime1: json["open_time_1"] ?? "",
        closeTime1: json["close_time_1"] ?? "",
        openTime2: json["open_time_2"] ?? "",
        closeTime2: json["close_time_2"] ?? "",
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
        "password_update_at": passwordUpdatedAt,
        "email": email ?? "",
        "open_time_1": openTime1,
        "close_time_1": closeTime1,
        "open_time_2": openTime2,
        "close_time_2": closeTime2,
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
