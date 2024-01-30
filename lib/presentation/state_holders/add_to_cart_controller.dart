import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  Future<bool> addToCart(productId, color, size) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> addToCartBody = {
      "product_id": productId,
      "color": color,
      "size": size,
    };

    final response = await NetworkCaller().postRequest(Urls.addToCart, body: addToCartBody);
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
