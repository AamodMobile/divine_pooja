

import 'package:divine_pooja/module/my_order/models/order_list_model.dart';
import 'package:divine_pooja/module/my_order/models/shapping_address_model.dart';

class SuccessPaymentModel {
  String? orderId;
  String? paymentMethod;
  String? bookingStatus;
  String? paymentStatus;
  String? deliveryStatus;
  ShippingAddress? address;
  List<OrderListModel>? orderDetails;

  SuccessPaymentModel({
    this.orderId,
    this.paymentMethod,
    this.bookingStatus,
    this.paymentStatus,
    this.deliveryStatus,
    this.address,
    this.orderDetails,
  });

  factory SuccessPaymentModel.fromJson(Map<String, dynamic> json) => SuccessPaymentModel(
    orderId: json["order_id"],
    paymentMethod: json["payment_method"],
    bookingStatus: json["booking_status"],
    paymentStatus: json["payment_status"],
    deliveryStatus: json["delivery_status"],
    address: json["address"] == null ? null : ShippingAddress.fromJson(json["address"]),
    orderDetails: json["order_details"] == null ? [] : List<OrderListModel>.from(json["order_details"]!.map((x) => OrderListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "payment_method": paymentMethod,
    "booking_status": bookingStatus,
    "payment_status": paymentStatus,
    "delivery_status": deliveryStatus,
    "address": address?.toJson(),
    "order_details": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
  };
}



