



import 'package:divine_pooja/constants/constants.dart';

class AddAddressController extends GetxController implements GetxService {
  TextEditingController houseNo = TextEditingController();
  TextEditingController apartmentName = TextEditingController();
  TextEditingController addressLine = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController nearby = TextEditingController();


  String addressType = "";
  bool isLoading=false;

}
