import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/auth/views/login_view.dart';
import 'package:divine_pooja/module/home/models/banner_model.dart';
import 'package:divine_pooja/module/home/models/category_model.dart';
import 'package:divine_pooja/module/home/models/product_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController implements GetxService {
  var categoryList = <CategoryModel>[].obs;
  var bannerList = <BannerModel>[].obs;
  var recentlyViewed = <Product>[].obs;
  var unreadNotification = "".obs;
  var cartTotal = "".obs;
  var cartCount = "".obs;
  var mobileNo = "".obs;
  bool isLoading = false;

  void reset() {
    categoryList.clear();
    bannerList.clear();
    recentlyViewed.clear();
    unreadNotification.value = "";
    cartTotal.value = "";
    cartCount.value = "";
  }
  @override
  void onInit() {
    super.onInit();
    loadCountFromPrefs();
    homeApiCall(true);
  }
  void loadCountFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    cartCount.value = prefs.getString('cart_count') ?? "0";
    mobileNo.value = prefs.getString('mobile') ?? "1234567890";
  }

  void _saveCountToPrefs(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart_count', cartCount.value);
  }
  void mobileReload(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('mobile', cartCount.value);
    prefs.reload();
  }
  Future<void> homeApiCall(bool load) async {
    try {
      isLoading = load;
      if (load == true) {
        reset();
      }
      var result = await ApiService.homeApi();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        unreadNotification.value = json["unread_notification"].toString();
        cartTotal.value = json["cart_total"].toString();
        cartCount.value = json["cart_count"].toString();
        _saveCountToPrefs(json["cart_count"].toString());
        loadCountFromPrefs();
        categoryList.value = List<CategoryModel>.from(json["category"].map((i) => CategoryModel.fromJson(i))).toList(growable: true);
        recentlyViewed.value = List<Product>.from(json["recently_viewed"].map((i) => Product.fromJson(i))).toList(growable: true);
        bannerList.value = List<BannerModel>.from(json["banner"].map((i) => BannerModel.fromJson(i))).toList(growable: true);
      } else {
        isLoading = false;
       // errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> addWishList(String productId) async {
    try {
      showProgress();
      var result = await ApiService.addWishlist(productId);
      var json = jsonDecode(result.body);
      if (json["status"] = true) {
        homeApiCall(false).then((value) {
          closeProgress();
        });
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
  Future<void> deleteAccount() async {
    try {
      showProgress();
      var result = await ApiService.deleteAccount();
      var json = jsonDecode(result.body);
      if (json["status"] = true) {
        Get.back();
        SharedPreferences preferences =
        await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => const LoginView());
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
