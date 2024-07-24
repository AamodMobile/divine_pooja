

class AddressListModel {
  int? id;
  String? name;
  String? houseNumber;
  String? apartmentName;
  String? address;
  String? pincode;
  String? city;
  String? nearByLandmark;
  String? addressType;
  String? isSelected;

  AddressListModel({
    this.id,
    this.name,
    this.houseNumber,
    this.apartmentName,
    this.address,
    this.pincode,
    this.city,
    this.nearByLandmark,
    this.addressType,
    this.isSelected,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
    id: json["id"],
    name: json["name"],
    houseNumber: json["house_number"],
    apartmentName: json["apartment_name"],
    address: json["address"],
    pincode: json["pincode"],
    city: json["city"],
    nearByLandmark: json["near_by_landmark"],
    addressType: json["address_type"],
    isSelected: json["is_selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "house_number": houseNumber,
    "apartment_name": apartmentName,
    "address": address,
    "pincode": pincode,
    "city": city,
    "near_by_landmark": nearByLandmark,
    "address_type": addressType,
    "is_selected": isSelected,
  };
}
