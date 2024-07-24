import 'dart:convert';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/add_address/model/address_list_model.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddAddressController extends GetxController implements GetxService {
  TextEditingController name = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController apartmentName = TextEditingController();
  TextEditingController addressLine = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController nearby = TextEditingController();

  String? currentAddress;
  Position? _currentPosition;
  var state = "";
  String addressType = "";
  bool isLoading = false;
  var addressList = <AddressListModel>[].obs;

  void reset() {
    name.text = "";
    houseNo.text = "";
    apartmentName.text = "";
    addressLine.text = "";
    pincode.text = "";
    city.text = "";
    nearby.text = "";
    state = "";
    addressType = "";
    currentAddress = "";
  }

  Future<void> addAddress(String addressId) async {
    try {
      showProgress();
      var result = await ApiService.addAddress(name.text, houseNo.text, apartmentName.text, addressLine.text, pincode.text, city.text, nearby.text, addressType, addressId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        Get.back(result: "200");
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
  }

  Future<void> addressListGet(bool load) async {
    try {
      isLoading = load;
      addressList.clear();
      var result = await ApiService.addressList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        addressList.value = List<AddressListModel>.from(json["data"].map((i) => AddressListModel.fromJson(i))).toList(growable: true);
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

  Future<void> deleteAddress(String addressId) async {
    try {
      showProgress();
      var result = await ApiService.deleteAddress(addressId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        addressListGet(true);
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

  Future<void> selectAddress(String addressId) async {
    try {
      showProgress();
      var result = await ApiService.selectAddress(addressId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        addressListGet(true);
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

  Future<void> getCheckInStatus(BuildContext context) async {
    try {
      final position = await LocationStatus().determinePosition();
      if (position.latitude != 0.0 && position.longitude != 0.0) {
        await getCurrentPosition();
      } else {
        errorToast('Location is not detected. Please check if location is enabled and try again.');
      }
    } catch (e) {
      Log.console(e.toString());
    }
  }

  Future<void> getCurrentPosition() async {
    try {
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
        _currentPosition = position;
        _getAddressFromLatLng(_currentPosition!);
      }).catchError((e) {
        debugPrint("$e");
      });
    } catch (e) {
      Log.console(e.toString());
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      await placemarkFromCoordinates(position.latitude, position.longitude).then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        Log.console(place);
        currentAddress = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}';
        Log.console(currentAddress);
        houseNo.text = "${place.name}";
        addressLine.text = "${place.street}";
        nearby.text = "${place.subLocality}";
        pincode.text = '${place.postalCode}';
        city.text = '${place.locality}';
        state = place.administrativeArea ?? '';
        Log.console(state);
        update();
      }).catchError((e) {
        debugPrint(e);
      });
    } catch (e) {
      Log.console(e.toString());
    }
  }
}

class LocationStatus {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Please enable your location, it seems to be turned off.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions. Please give permission and try again.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  }
}
