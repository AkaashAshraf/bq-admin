class City {
  City({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
  });

  int? id;
  String? nameEn;
  String? nameAr;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
      };
}
