import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class CMSController extends GetxController implements GetxService {
  bool isLoading = false;
  bool onData = false;
  var des = "".obs;

  Future<void> cmsGetApi(String type) async {
    try {
      isLoading = true;
      var result = await ApiService.cmsGet(type);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        onData = false;
        isLoading = false;
        des.value = json["data"]["description"].toString();
      } else {
        onData = true;
        isLoading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      onData = true;
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }
}
