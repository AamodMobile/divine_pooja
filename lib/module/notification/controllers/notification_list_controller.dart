import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/notification/models/notification_list_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class NotificationListController extends GetxController implements GetxService{
  bool isLoading = false;
  var notificationList = <NotificationListModel>[].obs;
  Future<void>notificationListGet() async {
    try {
      isLoading = true;
      var result = await ApiService.notificationList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        notificationList.value = List<NotificationListModel>.from(json["data"].map((i) => NotificationListModel.fromJson(i))).toList(growable: true);
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