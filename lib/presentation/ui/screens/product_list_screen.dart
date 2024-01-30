import 'package:crafty_bay/presentation/state_holders/product_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_item_card.dart';

class ProductListScreen extends StatefulWidget {
  final String? category;
  final int? categoryId;
  const ProductListScreen({super.key, this.category, this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      Get.find<ProductController>().getProductList(widget.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category ?? "Product List",
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GetBuilder<ProductController>(builder: (controller) {
          if (controller.inProgress) {
            return const CenterProgressIndicator();
          }
          if (controller.productListModel.productList!.isEmpty) {
            return const Center(child: Text("No Products found"));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 4, childAspectRatio: 0.80),
            itemCount: controller.productListModel.productList?.length ?? 0,
            itemBuilder: (context, index) {
              return FittedBox(
                  child: ProductItemCard(
                product: controller.productListModel.productList![index],
              ));
            },
          );
        }),
      ),
    );
  }
}
