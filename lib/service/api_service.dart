// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/auth/models/user_model.dart';
import 'package:divine_pooja/service/api_client.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetConnect {
  static var client = http.Client();

  ///loginApi
  static Future<http.Response> loginApi(String phone) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.login, body: {
      'mobile': phone,
      'country_code': "91",
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///verifyOtpApi
  static Future<http.Response> verifyOtpApi(String phone, String otp) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.otpVerify, body: {
      'mobile': phone,
      'otp': otp,
      'country_code': "91",
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///homeApi
  static Future<http.Response> homeApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.homeApi, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///productListApi
  static Future<http.Response> productList(String categoryId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.productList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "category_id": categoryId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///productDetailsApi
  static Future<http.Response> productDetails(String productId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.productDetails, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "product_id": productId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addCart
  static Future<http.Response> addCart(String productId, String quantity, String remove) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.addCart, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "product_id": productId,
      "quantity": quantity,
      "remove": remove
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///cartList
  static Future<http.Response> cartList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.cartList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///deleteCartProduct
  static Future<http.Response> deleteCartProduct(String productId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.deleteCart, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "product_id": productId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///couponApply
  static Future<http.Response> couponApply(String couponCode, String amount, String remove) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.couponApply, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "coupon_code": couponCode,
      "amount": amount,
      "remove": remove,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addAddress
  static Future<http.Response> addAddress(
      String name, String houseNumber, String apartmentName, String address, String pincode, String city, String nearByLandmark, String addressType, String addressId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.addAddress, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "name": name,
      "house_number": houseNumber,
      "apartment_name": apartmentName,
      "address": address,
      "pincode": pincode,
      "city": city,
      "near_by_landmark": nearByLandmark,
      "address_type": addressType,
      "address_id": addressId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///deleteAddress
  static Future<http.Response> deleteAddress(String addressId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.deleteAddress, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "address_id": addressId,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addressList
  static Future<http.Response> addressList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.addressList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addressList
  static Future<http.Response> selectAddress(String addressId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.selectAddress, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "address_id": addressId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///addWishlist
  static Future<http.Response> addWishlist(String productId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.addWishlist, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "product_id": productId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///wishlistList
  static Future<http.Response> wishlistList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.wishlistList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///couponList
  static Future<http.Response> couponList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.couponList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///saveOrder
  static Future<http.Response> saveOrder(String paymentOption,String paymentStatus, String transactionId, String addressId, String couponCode, String amount, String comment) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.saveOrder, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "payment_option": paymentOption,
      "payment_status": paymentStatus,
      "transaction_id": transactionId,
      "address_id": addressId,
      "amount": amount,
      "comment": comment,
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///orderList
  static Future<http.Response> orderList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.orderList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///orderDetail
  static Future<http.Response> orderDetail(String orderId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.orderDetail, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "order_id": orderId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///cmsGet
  static Future<http.Response> cmsGet(String type) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.cms, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "type": type
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///notificationList
  static Future<http.Response> notificationList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.notification, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  ///deleteAccount
  static Future<http.Response> deleteAccount() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.deleteAccount, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  ///contactUsGet
  static Future<http.Response> contactUsGet() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {
      'Authorization': 'Bearer $token',
    }, body: {});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///giveFeedback
  static Future<dynamic> giveFeedback(
    String productId,
    String feedback,
    String rating,
    String orderId,
    var images,
  ) async {
    var result;
    http.Response response;
    try {
      var url = ApiUrl.giveFeedback;
      Log.console('Http.Post Url: $url');
      var instance = await SharedPreferences.getInstance();
      var token = instance.getString('currentToken');
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      Log.console('Http.Post Headers: ${request.headers}');
      request.fields['product_id'] = productId;
      request.fields['feedback'] = feedback;
      request.fields['rating'] = rating;
      request.fields['order_id'] = orderId;
      if (images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          if (images[i].toString() != "upload") {
            final File file = File(images[i].path);
            http.MultipartFile file2 = await http.MultipartFile.fromPath("images[$i]", file.path.toString());
            request.files.add(file2);
          }
        }
      }
      Log.console('Http.Post filed: ${request.fields}');
      response = await http.Response.fromStream(await request.send());
      Log.console('Http.Response Body: ${response.body}');
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        result = {'status_code': 400, 'message': '404'};
      } else if (response.statusCode == 401) {
        result = jsonDecode(response.body);
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  ///feedbackList
  static Future<http.Response> feedbackList(String productId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.feedbackList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "product_id": productId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///profileImage
  static Future<dynamic> profileImage(String profileImage) async {
    var result;
    http.Response response;
    try {
      var url = ApiUrl.profileUpdate;
      Log.console('Http.Post Url: $url');
      var instance = await SharedPreferences.getInstance();
      var token = instance.getString('currentToken');
      var crtData = instance.getString('currentUser');
      UserModel crtUser = UserModel.fromJson(jsonDecode(crtData!));
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      Log.console('Http.Post Headers: ${request.headers}');
      request.fields['email'] = crtUser.user!.email.toString();
      if (profileImage.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('profile_image', profileImage);
        request.files.add(file);
      }
      Log.console('Http.Post filed: ${request.fields}');
      response = await http.Response.fromStream(await request.send());
      Log.console('Http.Response Body: ${response.body}');
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        result = {'status_code': 400, 'message': '404'};
      } else if (response.statusCode == 401) {
        result = jsonDecode(response.body);
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }
  ///checkNumber
  static Future<http.Response> checkNumber(String mobile) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.checkNumber, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "mobile": mobile
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  ///verifyNumber
  static Future<http.Response> verifyNumber(String mobile,String otp) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.verifyNumber, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "mobile": mobile,
      "otp": otp
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  ///newNumber
  static Future<http.Response> newNumber(String mobile) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.newNumber, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "mobile": mobile
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  ///verifyNewNumber
  static Future<http.Response> verifyNewNumber(String mobile,String otp) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString('currentToken');
    var result = await ApiClient.postData(ApiUrl.verifyNewNumber, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "mobile": mobile,
      "otp": otp
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
}
