import 'package:crafty_bay/presentation/state_holders/nav_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}