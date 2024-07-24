import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/check_out/views/check_out_view.dart';
import 'package:divine_pooja/module/home/controllers/home_controller.dart';
import 'package:divine_pooja/module/home/models/product_model.dart';
import 'package:divine_pooja/module/item_list/models/coupon_list_model.dart';
import 'package:divine_pooja/module/item_list/models/feedback_list_model.dart';
import 'package:divine_pooja/module/item_list/models/product_detail_model.dart';
import 'package:divine_pooja/module/item_list/models/product_rating_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class ItemController extends GetxController implements GetxService {
  var itemList = <Product>[].obs;
  bool isLoading = false;
  bool noData = false;
  var productDetail = ProductDetailModel().obs;
  var productRatingModel = ProductRatingModel().obs;
  var couponList = <CouponListModel>[].obs;
  var feedbackList = <FeedBackListModel>[].obs;
  var allFeedbackList = <FeedBackListModel>[].obs;
  HomeController homeCont = Get.find();

  Future<void> itemListGet(String categoryId, bool load) async {
    try {
      isLoading = load;
      var result = await ApiService.productList(categoryId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        itemList.value = List<Product>.from((json["products"]["data"]).map((i) => Product.fromJson(i))).toList(growable: true);
      } else {
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> productDetails(String productId, bool load) async {
    try {
      couponList.clear();
      feedbackList.clear();
      isLoading = load;
      var result = await ApiService.productDetails(productId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        noData = false;
        homeCont.homeApiCall(false);
        productDetail.value = ProductDetailModel.fromJson(json["product"]);
        productRatingModel.value = ProductRatingModel.fromJson(json["product_rating"]);
        couponList.value = List<CouponListModel>.from(json["coupons"].map((i) => CouponListModel.fromJson(i))).toList(growable: true);
        feedbackList.value = List<FeedBackListModel>.from(json["feedback"].map((i) => FeedBackListModel.fromJson(i))).toList(growable: true);
      } else {
        noData = true;
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      noData = true;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> addCartApi(String categoryId,String productId, String quantity, bool isBuyNow,bool isDetails) async {
    try {
      showProgress();
      var result = await ApiService.addCart(productId, quantity, "0");
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        homeCont.homeApiCall(false);
        productDetails(productId, false);
        closeProgress();
        if (isDetails == true) {
          productDetails(productId, false).then((value) {
            closeProgress();
          });
        } else {
          itemListGet(categoryId, false).then((value) {});
        }
        if (isBuyNow == true) {
          Get.to(() => const CheckOutView());
          successToast(json["message"].toString());
        } else {
          successToast(json["message"].toString());
        }
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

  Future<void> couponApply(String couponCode, String amount, String remove) async {
    try {
      showProgress();
      var result = await ApiService.couponApply(couponCode, amount, remove);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
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

  Future<void> addWishList(String categoryId, String productId, bool isDetails) async {
    try {
      showProgress();
      var result = await ApiService.addWishlist(productId);
      var json = jsonDecode(result.body);
      if (json["status"] = true) {
        homeCont.homeApiCall(false);
        if (isDetails == true) {
          productDetails(productId, false).then((value) {
            closeProgress();
          });
        } else {
          itemListGet(categoryId, false).then((value) {});
        }

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

  Future<void> feedbackListGet(String productId) async {
    try {
      isLoading = true;
      var result = await ApiService.feedbackList(productId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        allFeedbackList.value = List<FeedBackListModel>.from((json["data"]).map((i) => FeedBackListModel.fromJson(i))).toList(growable: true);
      } else {
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }
}
