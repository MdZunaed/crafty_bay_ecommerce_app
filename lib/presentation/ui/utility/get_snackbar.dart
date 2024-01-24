import 'package:get/get.dart';

class UiHelper {
  static void showSnackBar(title, msg, {int? duration}) {
    Get.snackbar(
      title,
      msg,
      duration: Duration(seconds: duration ?? 2),
      isDismissible: true,
    );
  }
}
