import 'package:divine_pooja/constants/constants.dart';

class IntroController extends GetxController implements GetxService {
  var currentPage = 0.obs;
  final totalPages = 3.obs;

  var images = [
    introOneImg,
    introTwoImg,
    introThreeImg,
  ].obs;
}
