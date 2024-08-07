import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  String? accessToken;
  String? tokenType;
  User? user;
  String? message;

  UserModel({
    this.status,
    this.accessToken,
    this.tokenType,
    this.user,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "access_token": accessToken,
    "token_type": tokenType,
    "user": user?.toJson(),
    "message": message,
  };
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  dynamic userName;
  String? countryCode;
  String? mobile;
  String? mobileWithcountry;
  String? registerOtp;
  String? verifyOtpStatus;
  String? loginBy;
  String? role;
  String? registrationSource;
  String? isPayingCustomer;
  String? avatarUrl;
  String? referalCode;
  String? referCode;
  dynamic deviceKey;
  DateTime? emailVerifiedAt;
  String? address;
  String? city;
  String? state;
  String? country;
  String? profileImage;
  String? billingCompany;
  dynamic isNotification;
  dynamic notification;
  dynamic onesignalId;
  String? status;
  dynamic isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.countryCode,
    this.mobile,
    this.mobileWithcountry,
    this.registerOtp,
    this.verifyOtpStatus,
    this.loginBy,
    this.role,
    this.registrationSource,
    this.isPayingCustomer,
    this.avatarUrl,
    this.referalCode,
    this.referCode,
    this.deviceKey,
    this.emailVerifiedAt,
    this.address,
    this.city,
    this.state,
    this.country,
    this.profileImage,
    this.billingCompany,
    this.isNotification,
    this.notification,
    this.onesignalId,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userName: json["user_name"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    mobileWithcountry: json["mobile_withcountry"],
    registerOtp: json["register_otp"],
    verifyOtpStatus: json["verify_otp_status"],
    loginBy: json["login_by"],
    role: json["role"],
    registrationSource: json["registration_source"],
    isPayingCustomer: json["is_paying_customer"],
    avatarUrl: json["avatar_url"],
    referalCode: json["referal_code"],
    referCode: json["refer_code"],
    deviceKey: json["device_key"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    profileImage: json["profile_image"],
    billingCompany: json["billing_company"],
    isNotification: json["is_notification"],
    notification: json["notification"],
    onesignalId: json["onesignal_id"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "user_name": userName,
    "country_code": countryCode,
    "mobile": mobile,
    "mobile_withcountry": mobileWithcountry,
    "register_otp": registerOtp,
    "verify_otp_status": verifyOtpStatus,
    "login_by": loginBy,
    "role": role,
    "registration_source": registrationSource,
    "is_paying_customer": isPayingCustomer,
    "avatar_url": avatarUrl,
    "referal_code": referalCode,
    "refer_code": referCode,
    "device_key": deviceKey,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "profile_image": profileImage,
    "billing_company": billingCompany,
    "is_notification": isNotification,
    "notification": notification,
    "onesignal_id": onesignalId,
    "status": status,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
