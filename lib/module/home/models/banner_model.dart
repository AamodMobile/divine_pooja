class BannerModel {
  int? id;
  String? banner;
  String? link;
  String? title;
  String? description;
  int? status;
  BannerModel({
    this.id,
    this.banner,
    this.link,
    this.status,
    this.title,
    this.description,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    banner: json["banner"],
    link: json["link"],
    status: json["status"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner": banner,
    "link": link,
    "status": status,
    "title": title,
    "description": description,
  };
}