import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/add_address/model/address_list_model.dart';
import 'package:divine_pooja/module/check_out/models/check_out_product_model.dart';
import 'package:divine_pooja/module/check_out/models/success_payment_model.dart';
import 'package:divine_pooja/module/home/controllers/home_controller.dart';
import 'package:divine_pooja/module/item_list/models/coupon_list_model.dart';
import 'package:divine_pooja/module/payment_status/views/payment_status_view.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class CartController extends GetxController implements GetxService {
  HomeController homeController = Get.find();
  var cartProductList = <CheckOutProductModel>[].obs;
  var successPaymentModel = SuccessPaymentModel().obs;
  var couponList = <CouponListModel>[].obs;
  var addressList = <AddressListModel>[].obs;
  bool isLoading = false;
  var cartCount = "0".obs;
  var cartTotal = "0".obs;
  var gstAmount = "0".obs;
  var discount = "0".obs;
  var deliveryCharge = "0".obs;
  var totalAmount = "0".obs;
  var firstTotalAmount = "0".obs;
  var addressSelected = "".obs;
  TextEditingController comment = TextEditingController();
  var selectedValue = "".obs;
  var couponCode = "".obs;

  void reset() {
    cartProductList.clear();
    couponList.clear();
    addressList.clear();
    cartCount.value = "0";
    cartTotal.value = "0";
    gstAmount.value = "0";
    discount.value = "0";
    deliveryCharge.value = "0";
    totalAmount.value = "0";
    firstTotalAmount.value = "0";
    addressSelected.value = "";
    selectedValue.value = "";
    comment.text = "";
  }

  void addressUpdate(String address, String id) {
    addressSelected.value = address;
    selectedValue.value = id;
    update();
  }

  Future<void> cartListGet(bool loading) async {
    try {
      isLoading = loading;
      var result = await ApiService.cartList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        cartProductList.value = List<CheckOutProductModel>.from(json["product_list"].map((i) => CheckOutProductModel.fromJson(i))).toList(growable: true);
        couponList.value = List<CouponListModel>.from(json["coupons"].map((i) => CouponListModel.fromJson(i))).toList(growable: true);
        addressList.value = List<AddressListModel>.from(json["address"].map((i) => AddressListModel.fromJson(i))).toList(growable: true);
        if (addressList.isEmpty) {
          selectedValue.value = "";
          addressSelected.value = "";
        } else {
          if (addressList.length != 1) {
            for (int i = 0; i < addressList.length; i++) {
              if (addressList[i].isSelected == "1") {
                selectedValue.value = addressList[i].id.toString();
                addressSelected.value = "${addressList[i].houseNumber} ${addressList[i].apartmentName} ${addressList[i].nearByLandmark} ${addressList[i].city} ${addressList[i].pincode}";
              }
            }
          } else {
            for (int i = 0; i < addressList.length; i++) {
              selectedValue.value = addressList[i].id.toString();
              addressSelected.value = "${addressList[i].houseNumber} ${addressList[i].apartmentName} ${addressList[i].nearByLandmark} ${addressList[i].city} ${addressList[i].pincode}";
            }
          }
        }
        cartCount.value = json["cart_count"].toString();
        cartTotal.value = json["cart_total"].toString();
        homeController.homeApiCall(false);
        gstAmount.value = json["gst_amount"].toString();
        discount.value = json["discount"].toString();
        deliveryCharge.value = json["delivery_charge"].toString();
        totalAmount.value = json["total_amount"].toString();
        if (loading == true) {
          firstTotalAmount.value = json["total_amount"].toString();
        }
      } else {
        isLoading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> deleteCartProduct(String productId) async {
    try {
      showProgress();
      var result = await ApiService.deleteCartProduct(productId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        cartListGet(false);
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

  Future<void> addCartApi(String productId, String quantity, String remove) async {
    try {
      showProgress();
      var result = await ApiService.addCart(productId, quantity, remove);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        homeController.homeApiCall(false);
        cartListGet(false);
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

  Future<void> couponApply(String couponCodeS, String amount, String remove) async {
    try {
      showProgress();
      var result = await ApiService.couponApply(couponCodeS, amount, remove);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        if (remove == "1") {
          couponCode.value = "";
        } else {
          couponCode.value = couponCodeS;
        }
        closeProgress();
        cartListGet(false);
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      showProgress();
      var result = await ApiService.deleteAddress(addressId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        cartListGet(false);
        Get.back();
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

  Future<void> saveOrder() async {
    try {
      showProgress();
      var result = await ApiService.saveOrder("PhonePay","complete", "123456", selectedValue.value, couponCode.value, totalAmount.value, comment.text);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        homeController.homeApiCall(false);
        cartListGet(false);
        successPaymentModel.value = SuccessPaymentModel.fromJson(json["data"]);
        Get.to(() => PaymentStatusView(successPaymentModel: successPaymentModel.value));
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
}
