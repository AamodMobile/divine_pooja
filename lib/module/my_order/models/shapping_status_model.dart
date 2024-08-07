class ShippingStatus {
  String? orderId;
  String? deliveryStatus;
  dynamic isTrack;
  String? shippingTime;

  ShippingStatus({
    this.orderId,
    this.deliveryStatus,
    this.isTrack,
    this.shippingTime,
  });

  factory ShippingStatus.fromJson(Map<String, dynamic> json) => ShippingStatus(
    orderId: json["order_id"],
    deliveryStatus: json["delivery_status"],
    isTrack: json["is_track"],
    shippingTime: json["shipping_time"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "delivery_status": deliveryStatus,
    "is_track": isTrack,
    "shipping_time": shippingTime,
  };
}
