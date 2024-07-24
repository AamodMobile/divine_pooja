import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/service/api_service.dart';
import 'package:image_picker/image_picker.dart';

class GiveFeedBackController extends GetxController implements GetxService {
  var itemImages = [].obs;
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController feedback = TextEditingController();
  var rating = "".obs;

  Future<void> selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.length > 3) {
      errorToast("Max ScreenShot Image limit is 3");
    } else {
      if (selectedImages.isNotEmpty) {
        if (selectedImages.length + itemImages.length > 3) {
          errorToast("Max ScreenShot Image limit is 3");
        } else {
          itemImages.addAll(selectedImages);
        }
      }
    }
    update();
  }

  void updateRating(String ratings) {
    rating.value = ratings;
    update();
  }

  Future<void> giveFeedback(String productId, String orderId) async {
    try {
      showProgress();
      var result = await ApiService.giveFeedback(productId, feedback.text, rating.value, orderId, itemImages);
      if (result["status"] == true) {
        closeProgress();
        Get.back();
        successToast(result["message"].toString());
      } else {
        closeProgress();
        errorToast(result["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
}
