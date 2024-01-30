import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model.dart';
import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(category: category.categoryName ?? "category", categoryId: category.id));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(category.categoryImg ?? '', height: 55, width: 55),
              //Icon(Icons.computer, size: 32, color: AppColors.primaryColor),
            ),
          ),
          Text(
            category.categoryName ?? 'Electronics',
            style: const TextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
