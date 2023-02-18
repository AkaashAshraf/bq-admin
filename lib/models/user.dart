class User {
  User({
    this.id,
    this.name,
    this.email,
    this.contact,
    this.isBlocked,
    this.isActive,
    this.deviceId,
    this.totalBooking,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? contact;
  int? isBlocked;
  int? isActive;
  dynamic deviceId;
  int? totalBooking;
  String? password;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        contact: json["contact"] ?? "",
        isBlocked: json["isBlocked"] ?? 0,
        isActive: json["isActive"] ?? 1,
        deviceId: json["device_id"],
        totalBooking: json["total_booking"] ?? 0,
        password: json["password"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name ?? "",
        "email": email ?? "",
        "contact": contact ?? "",
        "isBlocked": isBlocked ?? 0,
        "isActive": isActive ?? 1,
        "device_id": deviceId,
        "total_booking": totalBooking ?? 0,
        "password": password ?? "",
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
      };
}
