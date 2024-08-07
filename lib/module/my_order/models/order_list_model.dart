// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  int? id;
  dynamic productId;
  dynamic orderId;
  dynamic transactionId;
  dynamic unitPrice;
  dynamic quantity;
  dynamic amount;
  dynamic isApplyCoupon;
  dynamic couponCode;
  dynamic couponAmount;
  dynamic chargeableAmount;
  dynamic gstPer;
  dynamic gstAmt;
  dynamic deliveryCharge;
  dynamic taxableAmount;
  dynamic totalAmount;
  dynamic paymentMethod;
  dynamic deliveryStatus;
  DateTime? createdAt;
  dynamic customerNote;
  dynamic trackingId;
  dynamic shippingDate;
  dynamic shippingCompany;
  dynamic productName;
  dynamic productImage;

  OrderListModel({
    this.id,
    this.productId,
    this.orderId,
    this.transactionId,
    this.unitPrice,
    this.quantity,
    this.amount,
    this.isApplyCoupon,
    this.couponCode,
    this.couponAmount,
    this.chargeableAmount,
    this.gstPer,
    this.gstAmt,
    this.deliveryCharge,
    this.taxableAmount,
    this.totalAmount,
    this.paymentMethod,
    this.deliveryStatus,
    this.createdAt,
    this.customerNote,
    this.trackingId,
    this.shippingDate,
    this.shippingCompany,
    this.productName,
    this.productImage,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    id: json["id"],
    productId: json["product_id"],
    orderId: json["order_id"],
    transactionId: json["transaction_id"],
    unitPrice: json["unit_price"],
    quantity: json["quantity"],
    amount: json["amount"],
    isApplyCoupon: json["is_apply_coupon"],
    couponCode: json["coupon_code"],
    couponAmount: json["coupon_amount"],
    chargeableAmount: json["chargeable_amount"],
    gstPer: json["gst_per"],
    gstAmt: json["gst_amt"],
    deliveryCharge: json["delivery_charge"],
    taxableAmount: json["taxable_amount"],
    totalAmount: json["total_amount"],
    paymentMethod: json["payment_method"],
    deliveryStatus: json["delivery_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    customerNote: json["customer_note"],
    trackingId: json["tracking_id"]??"",
    shippingDate: json["shipping_date"],
    shippingCompany: json["shipping_company"]??"",
    productName: json["product_name"],
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "order_id": orderId,
    "transaction_id": transactionId,
    "unit_price": unitPrice,
    "quantity": quantity,
    "amount": amount,
    "is_apply_coupon": isApplyCoupon,
    "coupon_code": couponCode,
    "coupon_amount": couponAmount,
    "chargeable_amount": chargeableAmount,
    "gst_per": gstPer,
    "gst_amt": gstAmt,
    "delivery_charge": deliveryCharge,
    "taxable_amount": taxableAmount,
    "total_amount": totalAmount,
    "payment_method": paymentMethod,
    "delivery_status": deliveryStatus,
    "created_at": createdAt?.toIso8601String(),
    "customer_note": customerNote,
    "tracking_id": trackingId,
    "shipping_date": shippingDate,
    "shipping_company": shippingCompany,
    "product_name": productName,
    "product_image": productImage,
  };
}
