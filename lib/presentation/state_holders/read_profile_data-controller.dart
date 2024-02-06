import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/models/response_data.dart';

class ReadProfileDataController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  Profile _profile = Profile();
  Profile get profile => _profile;
  bool _isProfileComplete = false;
  bool get isProfileComplete => _isProfileComplete;
  Future<bool> readProfileData(String token) async {
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.readProfile, token: token);
    _inProgress = false;
    if (response.isSuccess) {
      final profileData = response.responseData['data'];
      if (profileData == null) {
        _isProfileComplete = false;
      } else {
        _profile = await Profile.fromJson(profileData);
        _isProfileComplete = true;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
