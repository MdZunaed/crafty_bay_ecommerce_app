import 'package:crafty_bay/data/models/banner_list_model.dart';
import 'package:crafty_bay/data/models/response_data.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class HomeBannerController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  BannerListModel _bannerList = BannerListModel();
  BannerListModel get bannerList => _bannerList;
  Future<bool> getBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.homeBannerList);
    _inProgress = false;
    if (response.isSuccess) {
      _bannerList = BannerListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
