class ProductDetailModel {
  int? id;
  String? name;
  String? slug;
  String? type;
  dynamic deliveryStartDay;
  dynamic deliveryEndDay;
  dynamic isDeliveryCharge;
  dynamic deliveryAmount;
  dynamic isReturnAccepted;
  String? status;
  String? featured;
  dynamic catalogVisibility;
  String? description;
  String? shortDescription;
  dynamic productVideo;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? currency;
  dynamic onSale;
  String? purchasable;
  String? totalSales;
  String? taxStatus;
  String? averageRating;
  String? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic isLike;
  dynamic isCart;
  List<ProductImage>? productImages;
  dynamic ratingCount;

  ProductDetailModel({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.deliveryStartDay,
    this.deliveryEndDay,
    this.isDeliveryCharge,
    this.deliveryAmount,
    this.isReturnAccepted,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.productVideo,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.currency,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.taxStatus,
    this.averageRating,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.isLike,
    this.isCart,
    this.productImages,
    this.ratingCount,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    type: json["type"],
    deliveryStartDay: json["delivery_start_day"],
    deliveryEndDay: json["delivery_end_day"],
    isDeliveryCharge: json["is_delivery_charge"],
    deliveryAmount: json["delivery_amount"],
    isReturnAccepted: json["is_return_accepted"],
    status: json["status"],
    featured: json["featured"],
    catalogVisibility: json["catalog_visibility"],
    description: json["description"],
    shortDescription: json["short_description"],
    productVideo: json["product_video"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    currency: json["currency"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    taxStatus: json["tax_status"],
    averageRating: json["average_rating"],
    categoryId: json["category_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isLike: json["is_like"],
    isCart: json["is_cart"],
    productImages: json["product_images"] == null ? [] : List<ProductImage>.from(json["product_images"]!.map((x) => ProductImage.fromJson(x))),
    ratingCount: json["rating_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "type": type,
    "delivery_start_day": deliveryStartDay,
    "delivery_end_day": deliveryEndDay,
    "is_delivery_charge": isDeliveryCharge,
    "delivery_amount": deliveryAmount,
    "is_return_accepted": isReturnAccepted,
    "status": status,
    "featured": featured,
    "catalog_visibility": catalogVisibility,
    "description": description,
    "short_description": shortDescription,
    "product_video": productVideo,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "currency": currency,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "tax_status": taxStatus,
    "average_rating": averageRating,
    "category_id": categoryId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_like": isLike,
    "is_cart": isCart,
    "product_images": productImages == null ? [] : List<dynamic>.from(productImages!.map((x) => x.toJson())),
    "rating_count": ratingCount,
  };
}

class ProductImage {
  int? id;
  String? imageId;
  String? productId;
  String? src;
  String? name;
  String? alt;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductImage({
    this.id,
    this.imageId,
    this.productId,
    this.src,
    this.name,
    this.alt,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    imageId: json["image_id"],
    productId: json["product_id"],
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_id": imageId,
    "product_id": productId,
    "src": src,
    "name": name,
    "alt": alt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
