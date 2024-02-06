import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';

class DeleteCartItemController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Future<bool> deleteCartItem(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.deleteCartItem(productId));

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
