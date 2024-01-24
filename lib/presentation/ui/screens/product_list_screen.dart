import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../widgets/product_item_card.dart';

class ProductListScreen extends StatelessWidget {
  final String? category;
  const ProductListScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category ?? "Product List",
          style: const TextStyle(fontSize: 18),
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
    );
  }
}
