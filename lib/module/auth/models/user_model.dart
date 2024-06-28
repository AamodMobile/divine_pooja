class UserModel {
  bool? status;
  String? accessToken;
  String? tokenType;
  String? message;

  UserModel(
      {this.status,  this.accessToken, this.tokenType, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['message'] = message;
    return data;
  }
}