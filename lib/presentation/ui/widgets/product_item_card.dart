import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        //height: 180,
        width: 150,
        child: Card(
          elevation: 1.5,
          //color: AppColors.primaryColor.withOpacity(0.5),
          color: Colors.white, surfaceTintColor: Colors.white70,
          child: Column(
            children: [
              const SizedBox(height: 110, width: 150, child: AppLogo()),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text("New year special shoe",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "\$100",
                          style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 8),
                        const Row(
                          children: [Icon(Icons.star, size: 18, color: Colors.amber), Text("4.6")],
                        ),
                        const SizedBox(width: 8),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          color: AppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
