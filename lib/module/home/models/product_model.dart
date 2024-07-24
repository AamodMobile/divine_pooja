class Product {
  int? id;
  String? name;
  String? productId;
  String? productName;
  String? quantity;
  String? regularPrice;
  String? price;
  String? image;
  dynamic averageRating;
  int? ratingCount;
  int? isView;
  int? isLike;
  dynamic isCart;
  Product({
    this.id,
    this.name,
    this.productId,
    this.productName,
    this.quantity,
    this.regularPrice,
    this.price,
    this.image,
    this.averageRating,
    this.ratingCount,
    this.isLike,
    this.isView,
    this.isCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    productId: json["product_id"],
    productName: json["product_name"],
    quantity: json["quantity"],
    regularPrice: json["regular_price"],
    price: json["price"],
    image: json["product_image"],
    averageRating: json["average_rating"]??"0.0",
    ratingCount: json["rating_count"],
    isView: json["is_view"],
    isLike: json["is_like"],
    isCart: json["is_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_id": productId,
    "product_name": productName,
    "quantity": quantity,
    "regular_price": regularPrice,
    "price": price,
    "product_image": image,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "is_like": isLike,
    "is_view": isView,
    "is_cart": isCart,
  };
}