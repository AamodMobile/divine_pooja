class CouponListModel {
  String? couponName;
  String? couponDiscount;
  String? couponType;
  String? couponCode;
  String? beginDate;
  String? endDate;
  dynamic cartValue;
  dynamic couponUses;
  String? shortHeading;
  bool? isApplied;

  CouponListModel({
    this.couponName,
    this.couponDiscount,
    this.couponType,
    this.couponCode,
    this.beginDate,
    this.endDate,
    this.cartValue,
    this.couponUses,
    this.shortHeading,
    this.isApplied,
  });

  factory CouponListModel.fromJson(Map<String, dynamic> json) => CouponListModel(
        couponName: json["coupon_name"],
        couponDiscount: json["coupon_discount"],
        couponType: json["coupon_type"],
        couponCode: json["coupon_code"],
        beginDate: json["begin_date"],
        endDate: json["end_date"],
        cartValue: json["cart_value"],
        couponUses: json["coupon_uses"],
        shortHeading: json["short_heading"],
        isApplied: json["is_applied"],
      );

  Map<String, dynamic> toJson() => {
        "coupon_name": couponName,
        "coupon_discount": couponDiscount,
        "coupon_type": couponType,
        "coupon_code": couponCode,
        "begin_date": beginDate,
        "end_date": endDate,
        "cart_value": cartValue,
        "coupon_uses": couponUses,
        "short_heading": shortHeading,
        "is_applied": isApplied,
      };
}
