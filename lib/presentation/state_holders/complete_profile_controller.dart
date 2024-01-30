import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/models/profile.dart';
import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  Profile _profile = Profile();
  Profile get profile => _profile;
  Future<bool> createProfileData(String token, CreateProfileParams params) async {
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().postRequest(Urls.completeProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
