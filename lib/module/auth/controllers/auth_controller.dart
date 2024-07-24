import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/auth/models/user_model.dart';
import 'package:divine_pooja/module/auth/views/otp_view.dart';
import 'package:divine_pooja/module/home/controllers/home_controller.dart';
import 'package:divine_pooja/module/home/views/home_view.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  TextEditingController mobile = TextEditingController();
  var otp = "";
  HomeController controller=Get.put(HomeController());
  Future<void> login() async {
    try {
      showProgress();
      var result = await ApiService.loginApi(mobile.text);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        var mobileNo = mobile.text;
        Get.to(() => OtpView(mobile: mobileNo));
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

  Future<void> verifyOtp() async {
    try {
      showProgress();
      var result = await ApiService.verifyOtpApi(mobile.text, otp);
      var json = jsonDecode(result.body);
      final apiResponse = UserModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();

        var pref = await SharedPreferences.getInstance();
        await pref.setString('currentUser', jsonEncode(apiResponse.toJson()));
        await pref.setString('currentToken', apiResponse.accessToken.toString());
        await pref.setString('mobile', apiResponse.user!.mobile.toString());
        controller.homeApiCall(true);
        successToast(apiResponse.message!);
        Get.offAll(() => const HomeView());
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
}
