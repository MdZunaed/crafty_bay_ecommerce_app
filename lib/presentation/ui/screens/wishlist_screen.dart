import 'package:crafty_bay/presentation/ui/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/nav_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

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
          title: const Text(
            "Wishlist",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 4, childAspectRatio: 0.80),
              itemCount: 20,
              itemBuilder: (context, index) {
                return const FittedBox(child: ProductItemCard());
              }),
        ),
      ),
    );
  }
}
