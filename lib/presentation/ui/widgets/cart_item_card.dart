import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/assets_path.dart';
import 'filled_icon_button.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset(AssetsPath.logo, fit: BoxFit.cover)),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            Text(
                              "fgjdhskhfkjsdf dfghdhsdhsdfgsdgsdfg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Color: Red",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Size: XL",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      FilledIconButton(
                          icon: Icons.delete_forever_outlined,
                          iconSize: 20,
                          iconColor: Colors.red,
                          color: Colors.transparent,
                          surfaceColor: Colors.red,
                          shadowColor: Colors.transparent,
                          onTap: () {}),
                    ],
                  ),
                  //SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "\$100",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                      ),
                      Row(
                        children: [
                          FilledIconButton(
                            icon: Icons.remove,
                            color: AppColors.primaryColor.withOpacity(0.6),
                            shadowColor: Colors.transparent,
                            onTap: () {
                              noOfItem.value--;
                            },
                          ),
                          ValueListenableBuilder(
                            valueListenable: noOfItem,
                            builder: (context, value, _) {
                              return Text(value.toString());
                            },
                          ),
                          FilledIconButton(
                            icon: Icons.add,
                            onTap: () {
                              noOfItem.value++;
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
