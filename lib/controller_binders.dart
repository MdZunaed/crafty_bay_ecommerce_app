import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data-controller.dart';
import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileDataController());
    Get.put(CompleteProfileController());
    Get.put(AuthController());
  }
}
