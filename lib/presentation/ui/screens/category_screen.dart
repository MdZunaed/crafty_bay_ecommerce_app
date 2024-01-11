import 'package:crafty_bay/presentation/state_holders/nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
          title: const Text("Category"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, childAspectRatio: 0.9),
              itemCount: 20,
              itemBuilder: (context, index) {
                return CategoryItem(
                  onTap: () {
                    Get.to(const ProductListScreen());
                  },
                );
              }),
        ),
      ),
    );
  }
}
