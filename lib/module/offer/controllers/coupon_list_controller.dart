import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/item_list/models/coupon_list_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class CouponListController extends GetxController implements GetxService {
  bool isLoading = false;
  var couponList = <CouponListModel>[].obs;

  Future<void> couponListGet() async {
    try {
      isLoading = true;
      var result = await ApiService.couponList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        couponList.value = List<CouponListModel>.from(json["data"].map((i) => CouponListModel.fromJson(i))).toList(growable: true);
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

  Future<void> couponApply(String couponCode, String amount, String remove) async {
    try {
      showProgress();
      var result = await ApiService.couponApply(couponCode, amount, remove);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        couponListGet();
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
