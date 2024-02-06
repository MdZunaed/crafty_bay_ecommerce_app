import 'package:crafty_bay/data/models/payment_method_model.dart';

class PaymentMethodListModel {
  String? msg;
  List<PaymentMethodList>? paymentMethodList;

  PaymentMethodListModel({this.msg, this.paymentMethodList});

  PaymentMethodListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      paymentMethodList = <PaymentMethodList>[];
      json['data'].forEach((v) {
        paymentMethodList!.add(new PaymentMethodList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.paymentMethodList != null) {
      data['data'] = this.paymentMethodList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentMethodList {
  List<PaymentMethodModel>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  PaymentMethodList({this.paymentMethod, this.payable, this.vat, this.total});

  PaymentMethodList.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethodModel>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(new PaymentMethodModel.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod!.map((v) => v.toJson()).toList();
    }
    data['payable'] = this.payable;
    data['vat'] = this.vat;
    data['total'] = this.total;
    return data;
  }
}
