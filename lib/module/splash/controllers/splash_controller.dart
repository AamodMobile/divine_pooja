import 'dart:convert';

import 'package:divine_pooja/module/auth/models/user_model.dart';
import 'package:divine_pooja/module/home/views/home_view.dart';
import 'package:divine_pooja/module/intro/views/intro_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController implements GetxService {
  void navigator() async {
    var instance = await SharedPreferences.getInstance();
    var crtData = instance.getString('currentUser');
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (crtData != null) {
          UserModel crtUser = UserModel.fromJson(jsonDecode(crtData));
          Get.offAll(() => const HomeView(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 2));
        } else {
          Get.offAll(() => const IntroView(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 2));
        }
      },
    );
  }
}
