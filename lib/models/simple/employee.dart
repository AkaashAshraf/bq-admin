class Employee {
  Employee({
    this.empId = 0,
    this.exp = "",
    this.nameEn = "",
    this.nameAr = "",
    this.image = "",
    this.isActive = 0,
    this.isDeleted = 0,
    this.isBlocked = 0,
    this.religionEn = "",
    this.religionAr = "",
    this.countryEn = "",
    this.countryAr = "",
  });

  int empId;
  String exp;
  String nameEn;
  String nameAr;
  String image;
  int isActive;
  int isDeleted;
  int isBlocked;
  String religionEn;
  String religionAr;
  String countryEn;
  String countryAr;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        empId: json["emp_id"] ?? 0,
        exp: json["exp"] ?? "",
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        image: json["image"] ?? "",
        isActive: json["isActive"] ?? 0,
        isDeleted: json["isDeleted"] ?? 0,
        isBlocked: json["isBlocked"] ?? 0,
        religionEn: json["religion_en"] ?? "",
        religionAr: json["religion_ar"] ?? "",
        countryEn: json["country_en"] ?? "",
        countryAr: json["country_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "exp": exp,
        "name_en": nameEn,
        "name_ar": nameAr,
        "image": image,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "isBlocked": isBlocked,
        "religion_en": religionEn,
        "religion_ar": religionAr,
        "country_en": countryEn,
        "country_ar": countryAr,
      };
}
