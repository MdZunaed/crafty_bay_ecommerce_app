import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../widgets/bottom_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (c, i) {
                  return const SizedBox(height: 5);
                },
                itemBuilder: (context, index) {
                  return const CartItemCard();
                },
              ),
            ),
            checkoutContainer(),
          ],
        ),
      ),
    );
  }

  BottomContainer checkoutContainer() {
    return BottomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total price",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black54)),
              Text(
                "\$100000",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
              ),
            ],
          ),
          FilledButton(
            onPressed: () {},
            child: const Text("Checkout"),
          )
        ],
      ),
    );
  }
}
