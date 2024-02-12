import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay/data/models/invoice_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../data/utility/urls.dart';

class InvoiceListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  List<InvoiceModel> _invoiceList = [];

  List<InvoiceModel> get invoiceList => _invoiceList;

  Future<bool> getInvoiceList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    // final response = await NetworkCaller().getRequest(Urls.invoiceList);
    // if (response.isSuccess) {
    //   _invoiceList = response.responseData;
    //   isSuccess = true;
    //   log(response.responseData);
    // } else {
    //   isSuccess = false;
    //   _errorMessage = response.errorMessage;
    // }
    final response = await get(Uri.parse(Urls.invoiceList),
        headers: {'Content-type': 'application/json', 'token': AuthController.token.toString()});
    if (response.statusCode == 200) {
      log(response.body);
      List<dynamic> data = jsonDecode(response.body);
      for (var item in data) {
        _invoiceList.add(InvoiceModel.fromJson(item));
      }
      log(_invoiceList.toString());
      isSuccess = true;
      _inProgress = false;
      update();
    } else if (response.statusCode == 401) {
      print("unauthorized");
    } else {
      _errorMessage = "Failed to get invoice list";
    }
    return isSuccess;
  }
}
