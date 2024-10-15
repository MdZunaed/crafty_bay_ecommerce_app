import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  void changeScreen(index) {
    // if (currentIndex == index) {
    //   return;
    // }
    // if (currentIndex == 2 || currentIndex == 3) {
    //   if (Get.find<AuthController>().isTokenNotNull == false) {
    //     AuthController.goToLogin();
    //     backToHome();
    //     return;
    //   }
    // }
    currentIndex = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}
