import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data-controller.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  bool _shouldNavigateCompleteProfile = true;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String _token = '';
  String get token => _token;
  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));

    if (response.isSuccess) {
      _token = response.responseData['data'];
      //await Future.delayed(const Duration(seconds: 3));
      final result = await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileComplete == false;
        if (_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>()
              .saveUserDetails(token, Get.find<ReadProfileDataController>().profile);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      _inProgress = false;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      _inProgress = false;
      update();
      return false;
    }
  }
}
