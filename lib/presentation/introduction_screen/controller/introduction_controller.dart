import 'package:get/get.dart';

class IntroductionController extends GetxController {
  var isLoading = false.obs;

  void updateLoading() {
    isLoading.value = true;
    update();
    Future.delayed(const Duration(seconds: 4), () {
      isLoading.value = false;
      update();
    });
  }
}
