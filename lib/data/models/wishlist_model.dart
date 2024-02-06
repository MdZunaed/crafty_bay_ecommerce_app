import 'package:crafty_bay/data/models/product_model.dart';

class WishlistModel {
  String? msg;
  List<WishlistData>? wishlistData;

  WishlistModel({this.msg, this.wishlistData});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishlistData = <WishlistData>[];
      json['data'].forEach((v) {
        wishlistData!.add(new WishlistData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.wishlistData != null) {
      data['data'] = this.wishlistData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishlistData {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  WishlistData({this.id, this.productId, this.userId, this.createdAt, this.updatedAt, this.product});

  WishlistData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null ? new ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

// class Product {
//   int? id;
//   String? title;
//   String? shortDes;
//   String? price;
//   int? discount;
//   String? discountPrice;
//   String? image;
//   int? stock;
//   int? star;
//   String? remark;
//   int? categoryId;
//   int? brandId;
//   String? createdAt;
//   String? updatedAt;
//
//   Product(
//       {this.id,
//         this.title,
//         this.shortDes,
//         this.price,
//         this.discount,
//         this.discountPrice,
//         this.image,
//         this.stock,
//         this.star,
//         this.remark,
//         this.categoryId,
//         this.brandId,
//         this.createdAt,
//         this.updatedAt});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     shortDes = json['short_des'];
//     price = json['price'];
//     discount = json['discount'];
//     discountPrice = json['discount_price'];
//     image = json['image'];
//     stock = json['stock'];
//     star = json['star'];
//     remark = json['remark'];
//     categoryId = json['category_id'];
//     brandId = json['brand_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['short_des'] = this.shortDes;
//     data['price'] = this.price;
//     data['discount'] = this.discount;
//     data['discount_price'] = this.discountPrice;
//     data['image'] = this.image;
//     data['stock'] = this.stock;
//     data['star'] = this.star;
//     data['remark'] = this.remark;
//     data['category_id'] = this.categoryId;
//     data['brand_id'] = this.brandId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
