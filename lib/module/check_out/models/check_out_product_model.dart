class CheckOutProductModel {
  dynamic productId;
  dynamic quantity;
  dynamic productName;
  dynamic regularPrice;
  dynamic price;
  dynamic productImage;

  CheckOutProductModel({
    this.productId,
    this.quantity,
    this.productName,
    this.regularPrice,
    this.price,
    this.productImage,
  });

  factory CheckOutProductModel.fromJson(Map<String, dynamic> json) => CheckOutProductModel(
    productId: json["product_id"],
    quantity: json["quantity"],
    productName: json["product_name"],
    regularPrice: json["regular_price"],
    price: json["price"],
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "product_name": productName,
    "regular_price": regularPrice,
    "price": price,
    "product_image": productImage,
  };
}
