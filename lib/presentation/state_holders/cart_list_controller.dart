import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  RxDouble _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;
  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.cartList);

    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      _totalPrice.value = _calculateTotalPrice;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  updateQuantity(int id, int qty) {
    _cartListModel.cartList?.firstWhere((element) => element.id == id).qty = qty;
    _totalPrice.value = _calculateTotalPrice;
  }

  double get _calculateTotalPrice {
    double total = 0;
    for (CartModel item in _cartListModel.cartList ?? []) {
      total += double.parse(item.product?.price ?? '') * item.qty;
    }
    return total;
  }
}
