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
    this.holiday1 = 0,
    this.holiday2 = 0,
    this.country = 0,
    this.religionEn = "",
    this.religionAr = "",
    this.countryEn = "",
    this.countryAr = "",
  });

  int empId;
  String exp;
  String nameEn;
  String nameAr;
  int country;
  String image;
  int holiday1;
  int holiday2;
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
        country: json["country"] ?? 0,
        religionAr: json["religion_ar"] ?? "",
        holiday1: json["holiday_1"] ?? 0,
        holiday2: json["holiday_2"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        image: json["image"] ?? "",
        isActive: json["isActive"] ?? 0,
        isDeleted: json["isDeleted"] ?? 0,
        isBlocked: json["isBlocked"] ?? 0,
        religionEn: json["religion_en"] ?? "",
        countryEn: json["country_en"] ?? "",
        countryAr: json["country_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "exp": exp,
        "country": country,
        "name_en": nameEn,
        "holiday_1": holiday1,
        "holiday_2": holiday2,
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
