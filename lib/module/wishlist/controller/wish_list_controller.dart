import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/home/models/product_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class WishListController extends GetxController implements GetxService {
  var wishList = <Product>[].obs;
  bool isLoading = false;

  Future<void> addWishList(String productId) async {
    try {
      showProgress();
      var result = await ApiService.addWishlist(productId);
      var json = jsonDecode(result.body);
      if (json["status"] = true) {
        closeProgress();
        wishlistList();
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

  Future<void> wishlistList() async {
    try {
      isLoading = true;
      wishList.clear();
      var result = await ApiService.wishlistList();
      var json = jsonDecode(result.body);
      if (json["status"] = true) {
        isLoading = false;
        wishList.value = List<Product>.from(json["data"].map((i) => Product.fromJson(i))).toList(growable: true);
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
  Future<void> addCartApi(String productId, String quantity) async {
    try {
      showProgress();
      var result = await ApiService.addCart(productId, quantity,"0");
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
}
