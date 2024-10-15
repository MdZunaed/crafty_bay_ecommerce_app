import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/checkout_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_item_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../widgets/bottom_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartListController>().getCartList();
      print(AuthController.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.find<BottomNavController>().backToHome();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            title: const Text("Cart")),
        body: Get.find<AuthController>().isTokenNotNull
            ? GetBuilder<CartListController>(
                builder: (controller) {
                  if (controller.inProgress == true) {
                    return const CenterProgressIndicator();
                  } else if (controller.cartListModel.cartList?.isEmpty ?? true) {
                    return const Center(child: Text("No item found"));
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: controller.cartListModel.cartList?.length ?? 0,
                          separatorBuilder: (c, i) => const SizedBox(height: 5),
                          itemBuilder: (context, index) {
                            return CartItemCard(
                                key: ValueKey(index), cartModel: controller.cartListModel.cartList![index]);
                          },
                        ),
                      ),
                      checkoutContainer(controller.totalPrice),
                    ],
                  );
                },
              )
            : const Center(
                child: Text("Please Login to see your cart products"),
              ),
      ),
    );
  }

  BottomContainer checkoutContainer(RxDouble totalPrice) {
    return BottomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total price",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black54)),
              Obx(
                () => Text(
                  "৳${totalPrice}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          FilledButton(
            onPressed: () {
              Get.to(() => const CheckoutScreen());
            },
            child: const Text("Checkout"),
          )
        ],
      ),
    );
  }
}
