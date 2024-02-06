import 'product_model.dart';

class CartListModel {
  String? msg;
  List<CartModel>? cartList;

  CartListModel({this.msg, this.cartList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartList = <CartModel>[];
      json['data'].forEach((v) {
        cartList!.add(new CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.cartList != null) {
      data['data'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartModel {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  String? price;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;
  int qty = 1;

  CartModel(
      {this.id,
      this.userId,
      this.productId,
      this.color,
      this.size,
      //this.qty,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = int.tryParse(json['qty']) ?? 1;
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['color'] = this.color;
    data['size'] = this.size;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
