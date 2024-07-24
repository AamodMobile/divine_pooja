import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class HelpSupportController extends GetxController implements GetxService {
  var email = "".obs;
  var mobile = "".obs;
  var address = "".obs;
  var customCare = "".obs;
  bool isLoading = false;

  Future<void> contactUsGet() async {
    try {
      isLoading = true;
      var result = await ApiService.contactUsGet();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        email.value = json["email"].toString();
        mobile.value = json["mobile"].toString();
        address.value = json["address"].toString();
        customCare.value = json["customCare"] ?? "";
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
}
