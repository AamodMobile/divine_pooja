class ShippingAddress {
  String? shippingName;
  String? addressType;
  String? nearByLandmark;
  String? shippingHouseNumber;
  String? shippingApartmentName;
  String? shippingAddress;
  String? shippingCity;
  String? shippingPostcode;

  ShippingAddress({
    this.shippingName,
    this.addressType,
    this.nearByLandmark,
    this.shippingHouseNumber,
    this.shippingApartmentName,
    this.shippingAddress,
    this.shippingCity,
    this.shippingPostcode,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    shippingName: json["shipping_name"],
    addressType: json["address_type"],
    nearByLandmark: json["near_by_landmark"],
    shippingHouseNumber: json["shipping_house_number"],
    shippingApartmentName: json["shipping_apartment_name"],
    shippingAddress: json["shipping_address"],
    shippingCity: json["shipping_city"],
    shippingPostcode: json["shipping_postcode"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_name": shippingName,
    "address_type": addressType,
    "near_by_landmark": nearByLandmark,
    "shipping_house_number": shippingHouseNumber,
    "shipping_apartment_name": shippingApartmentName,
    "shipping_address": shippingAddress,
    "shipping_city": shippingCity,
    "shipping_postcode": shippingPostcode,
  };
}
