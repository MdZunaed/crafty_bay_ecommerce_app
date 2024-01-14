import 'package:crafty_bay/presentation/ui/widgets/filled_icon_button.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledIconButton(
          icon: Icons.remove,
          color: AppColors.primaryColor.withOpacity(0.6),
          shadowColor: Colors.transparent,
          onTap: () {
            if (noOfItem.value > 1) {
              noOfItem.value--;
            }
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
    );
  }
}
