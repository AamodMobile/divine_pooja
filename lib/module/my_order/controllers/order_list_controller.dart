import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/my_order/models/order_list_model.dart';
import 'package:divine_pooja/module/my_order/models/shapping_address_model.dart';
import 'package:divine_pooja/module/my_order/models/shapping_status_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';

class OrderListController extends GetxController implements GetxService {
  bool isLoading = false;
  var orderList = <OrderListModel>[].obs;
  bool onData = false;
  var order = OrderListModel().obs;
  var addressShipping = ShippingAddress().obs;
  var product = OrderListModel().obs;
  var shippingStatus = <ShippingStatus>[].obs;

  Future<void> orderListGet() async {
    try {
      isLoading = true;
      var result = await ApiService.orderList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        orderList.value = List<OrderListModel>.from(json["order"].map((i) => OrderListModel.fromJson(i))).toList(growable: true);
      } else {
        orderList.clear();
        isLoading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      orderList.clear();
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> orderDetail(String orderId) async {
    try {
      isLoading = true;
      var result = await ApiService.orderDetail(orderId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        onData = false;
        isLoading = false;
        order.value = OrderListModel.fromJson(json["order"]);
        addressShipping.value = ShippingAddress.fromJson(json["shipping_address"]);
        product.value = OrderListModel.fromJson(json["order"]);
        shippingStatus.value = List<ShippingStatus>.from(json["shipping_status"].map((i) => ShippingStatus.fromJson(i))).toList(growable: true);
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
