import 'dart:developer';

import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/add_wishlist_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/review_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/item_counter.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color? selectedColor;
  String? selectedSize;
  ValueNotifier<int> noOfItems = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    log(AuthController.token.toString());
    Get.find<ProductDetailsController>().getProductDetailsData(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenterProgressIndicator();
        } else if (controller.productDetailsDataList!.isEmpty) {
          return const Center(child: Text("Product not available"));
        }
        return Column(
          children: [
            ProductImageSlider(urls: [
              controller.productDetails.img1 ?? '',
              controller.productDetails.img2 ?? '',
              controller.productDetails.img3 ?? '',
              controller.productDetails.img4 ?? '',
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              controller.productDetails.product?.title ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          ItemCounter(
                            initialValue: noOfItems,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(children: [
                            const Icon(Icons.star, size: 20, color: Colors.amber),
                            Text(controller.productDetails.product!.star!.toStringAsPrecision(2))
                          ]),
                          TextButton(
                              onPressed: () {
                                Get.to(ReviewListScreen(productId: controller.productDetails.productId!));
                              },
                              child: const Text("Reviews")),
                          addToWishListCard(),
                        ],
                      ),
                      Text("Color", style: titleTextStyle()),
                      const SizedBox(height: 5),
                      ColorSelector(
                          colors: controller.productDetails.color
                                  ?.split(',')
                                  .map((c) => getColorFromString(c))
                                  .toList() ??
                              [],
                          onChange: (c) {
                            selectedColor = c;
                          }),
                      const SizedBox(height: 5),
                      Text("Size", style: titleTextStyle()),
                      const SizedBox(height: 5),
                      SizeSelector(
                          sizes: controller.productDetails.size?.split(',') ?? [],
                          onChange: (s) {
                            selectedSize = s;
                          }),
                      const SizedBox(height: 5),
                      Text("Description", style: titleTextStyle()),
                      const SizedBox(height: 5),
                      Text(
                        controller.productDetails.des ?? '',
                        style: const TextStyle(color: Colors.black54, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
            addToCartContainer(controller.productDetails),
          ],
        );
      }),
    );
  }

  GetBuilder<AddToWishlistController> addToWishListCard() {
    return GetBuilder<AddToWishlistController>(builder: (controller) {
      if (controller.inProgress) {
        return const CupertinoActivityIndicator(color: AppColors.primaryColor);
      }
      return InkWell(
        onTap: () async {
          final response = await controller.addToWishlist(widget.productId);
          if (response) {
            UiHelper.showSnackBar("Success", "Product added to wishlist");
          } else {
            UiHelper.showSnackBar("Success", "Add to wishlist failed, try again!");
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: AppColors.primaryColor,
          child: const Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.favorite_outline,
              size: 14,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

  TextStyle titleTextStyle() =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800);

  BottomContainer addToCartContainer(ProductDetailsData productDetails) {
    return BottomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Price",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black54)),
              Text("৳${productDetails.product?.price ?? 0}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
            ],
          ),
          GetBuilder<AddToCartController>(builder: (controller) {
            return Visibility(
              visible: controller.inProgress == false,
              replacement: const CenterProgressIndicator(),
              child: FilledButton(
                onPressed: () async {
                  final String colorCode = colorToString(selectedColor!);

                  if (AuthController.token != null) {
                    final response = await controller.addToCart(
                        productDetails.productId, colorCode, selectedSize, noOfItems.value);
                    if (response) {
                      UiHelper.showSnackBar("Success", "Product added to cart");
                    } else {
                      UiHelper.showSnackBar("Failed", "Add to cart failed");
                    }
                  } else {
                    Get.to(const VerifyEmailScreen());
                  }
                },
                child: const Text("Add to cart"),
              ),
            );
          }),
        ],
      ),
    );
  }

  getColorFromString(String color) {
    color = color.toLowerCase();
    if (color == 'red') {
      return Colors.red;
    } else if (color == 'green') {
      return Colors.green;
    } else if (color == 'white') {
      return Colors.white;
    }
    return Colors.grey;
  }

  String colorToString(Color color) {
    if (color == Colors.red) {
      return 'red';
    } else if (color == Colors.green) {
      return 'green';
    } else if (color == Colors.white) {
      return 'white';
    }
    return 'grey';
  }
// Color getColorFromString(String colorCode) {
//   String code = colorCode.replaceAll('#', '');
//   String hexCode = "FF$code";
//   return Color(int.parse("0x$hexCode"));
// }

  // String colorToHexCode(Color colorCode) {
  //   return colorCode.toString().replaceAll('Color(0xff', '#').replaceAll(')', '');
  // }
}
