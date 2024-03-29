import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddReviewController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = "";

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> addNewReview(int productId, String review, int rating) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> addReviewBody = {"description": review, "product_id": productId, "rating": rating};
    ResponseData response = await NetworkCaller().postRequest(Urls.addNewReview, body: addReviewBody);
    _inProgress = false;
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
      update();
    }

    update();
    return isSuccess;
  }
}
