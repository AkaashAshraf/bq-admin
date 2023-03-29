class Religion {
  Religion({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
  });

  int? id;
  String? nameEn;
  String? nameAr;

  factory Religion.fromJson(Map<String, dynamic> json) => Religion(
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
