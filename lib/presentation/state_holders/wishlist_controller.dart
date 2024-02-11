import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/models/wishlist_model.dart';
import '../../data/services/network_caller.dart';

class WishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  WishlistModel _wishlistModel = WishlistModel();
  WishlistModel get wishlistModel => _wishlistModel;
  // List<int> _wishProductIdList = [];
  // List<int> get wishProductIdList => _wishProductIdList;

  // RxBool _existInWishlist = false.obs;
  // RxBool get existInWishlist => _existInWishlist;

  Future<bool> getWishlist() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.wishlist);

    if (response.isSuccess) {
      _wishlistModel = WishlistModel.fromJson(response.responseData);
      isSuccess = true;
      // for (WishlistData item in _wishlistModel.wishlistData ?? []) {
      //   _wishProductIdList.add(item.product!.id!);
      // }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  // bool checkIfExistInWishlist(int productId) {
  //   if (_wishProductIdList.contains(productId)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //
  // void removeProductIdFromWishlist(int productId) {
  //   _wishProductIdList.remove(productId);
  //   checkIfExistInWishlist(productId);
  // }
}
