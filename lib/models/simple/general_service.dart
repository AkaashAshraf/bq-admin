class GeneralService {
  GeneralService({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.image = "",
  });

  int id;
  String nameEn;
  String nameAr;
  String image;

  factory GeneralService.fromJson(Map<String, dynamic> json) => GeneralService(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        image: json["image"] ?? "",
      );
}
