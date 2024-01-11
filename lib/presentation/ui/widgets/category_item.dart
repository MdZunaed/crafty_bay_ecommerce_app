import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final VoidCallback? onTap;
  const CategoryItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.computer,
                size: 32,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const Text(
            'Electronics',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
