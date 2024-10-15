import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/filled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ItemCounter extends StatefulWidget {
  final int? id;
  //final int? qty;
  final ValueNotifier<int> initialValue;
  const ItemCounter({
    super.key,
    required this.initialValue,
    this.id,
    //this.qty
  });

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  //late int initialValue;
  //ValueNotifier<int> noOfItem = ValueNotifier(widget.initialValue);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledIconButton(
          icon: Icons.remove,
          color: AppColors.primaryColor.withOpacity(0.6),
          shadowColor: Colors.transparent,
          onTap: () {
            if (widget.initialValue.value > 1) {
              widget.initialValue.value--;
              //Get.find<CartListController>().updateQuantity(widget.id ?? 0, widget.qty ?? 0);
              Get.find<CartListController>()
                  .updateQuantity(widget.id ?? 0, widget.initialValue.value);
            }
          },
        ),
        ValueListenableBuilder(
          valueListenable: widget.initialValue,
          builder: (context, value, _) {
            return Text(value.toString());
          },
        ),
        FilledIconButton(
          icon: Icons.add,
          onTap: () {
            widget.initialValue.value++;
            //Get.find<CartListController>().updateQuantity(widget.id ?? 0, widget.qty ?? 0);
            Get.find<CartListController>()
                .updateQuantity(widget.id ?? 0, widget.initialValue.value);
          },
        ),
      ],
    );
  }
}
