import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/delete_cart_item_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/item_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';
import 'filled_icon_button.dart';

class CartItemCard extends StatefulWidget {
  final CartModel cartModel;
  const CartItemCard({super.key, required this.cartModel});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late ValueNotifier<int> noOfItem = ValueNotifier(widget.cartModel.qty);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.network(widget.cartModel.product?.image ?? '', fit: BoxFit.cover)),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartModel.product?.title ?? "Product Name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Color: ${widget.cartModel.color ?? "color"}",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Size: ${widget.cartModel.size ?? "size"}",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<DeleteCartItemController>(builder: (controller) {
                        if (controller.inProgress) {
                          return const CupertinoActivityIndicator();
                        }
                        return FilledIconButton(
                            icon: Icons.delete_forever_outlined,
                            iconSize: 20,
                            iconColor: Colors.red,
                            color: Colors.transparent,
                            surfaceColor: Colors.red,
                            shadowColor: Colors.transparent,
                            onTap: () async {
                              final response =
                                  await controller.deleteCartItem(widget.cartModel.productId ?? 0);
                              if (response) {
                                Get.find<CartListController>().getCartList();
                                UiHelper.showSnackBar("Success", "Product deleted from your cart");
                              } else {
                                UiHelper.showSnackBar("Failed", "Something went wrong");
                              }
                            });
                      }),
                    ],
                  ),
                  //SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "৳${widget.cartModel.product?.price ?? "0"}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                      ),
                      ItemCounter(
                        id: widget.cartModel.id,
                        //qty: int.tryParse(widget.cartModel.qty ?? '') ?? 0,
                        qty: noOfItem.value,
                        initialValue: noOfItem,
                        //initialValue: ValueNotifier(int.tryParse(widget.cartModel.qty ?? '') ?? 0),
                      ),
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
