class GaleryModel {
  int id;
  String url;

  GaleryModel({
    required this.id,
    required this.url,
  });

  factory GaleryModel.fromJson(Map<String, dynamic> json) => GaleryModel(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
