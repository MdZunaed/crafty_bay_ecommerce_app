import 'dart:developer';

import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
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
  List colors = [
    Colors.black,
    Colors.teal,
    Colors.brown,
    Colors.amber,
    Colors.lightGreen,
  ];
  List sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

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
                          const ItemCounter(),
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

  Card addToWishListCard() {
    return Card(
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
    );
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
              Text("\$${productDetails.product?.price ?? 0}",
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
                  final String colorCode = colorToHexCode(selectedColor!);

                  if (AuthController.token != null) {
                    final response =
                        await controller.addToCart(productDetails.productId, colorCode, selectedSize);
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

  Color getColorFromString(String colorCode) {
    String code = colorCode.replaceAll('#', '');
    String hexCode = "FF$code";
    return Color(int.parse("0x$hexCode"));
  }

  String colorToHexCode(Color colorCode) {
    return colorCode.toString().replaceAll('Color(0xff', '#').replaceAll(')', '');
  }
}
