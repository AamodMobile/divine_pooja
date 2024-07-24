import 'package:divine_pooja/module/home/models/product_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? bannerImage;
  List<Product>? products;

  CategoryModel({
    this.id,
    this.name,
    this.bannerImage,
    this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    bannerImage: json["banner_image"]??"",
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "banner_image": bannerImage,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}


