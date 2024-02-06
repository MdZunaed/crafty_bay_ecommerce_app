import 'package:crafty_bay/data/models/payment_method_list_model.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  PaymentMethodListModel _paymentMetodListModel = PaymentMethodListModel();

  PaymentMethodListModel get paymentMethodListModel => _paymentMetodListModel;

  RxDouble _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;
  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.createInvoice);

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
