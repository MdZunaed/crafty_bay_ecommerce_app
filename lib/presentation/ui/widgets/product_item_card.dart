import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/add_wishlist_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ProductItemCard extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onTapFavourite;
  final ProductModel product;

  const ProductItemCard({super.key, this.onTap, required this.product, this.onTapFavourite});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap ??
          () {
            Get.to(ProductDetailsScreen(productId: product.id!));
          },
      child: SizedBox(
        //height: 180,
        width: 150,
        child: Card(
          elevation: 1.5,
          //color: AppColors.primaryColor.withOpacity(0.5),
          color: Colors.white, surfaceTintColor: Colors.white70,
          child: Column(
            children: [
              SizedBox(
                  height: 110, width: 150, child: Image.network(product.image ?? '', fit: BoxFit.scaleDown)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? "product name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "৳${product.price ?? 0}",
                          style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: Colors.amber),
                            Text(product.star.toString())
                          ],
                        ),
                        const SizedBox(width: 5),
                        favouriteIcon()
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
  }

  GetBuilder<AddToWishlistController> favouriteIcon() {
    return GetBuilder<AddToWishlistController>(
      builder: (controller) {
        // bool hasInWishlist =
        //     Get.find<WishlistController>().wishProductIdList.contains(product.id);
        // bool hasInWishlist =
        //     Get.find<WishlistController>().checkIfExistInWishlist(product.id!);
        if (controller.inProgress) {
          return const CupertinoActivityIndicator();
        }
        return InkWell(
            borderRadius: BorderRadius.circular(8),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              color: AppColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.favorite,
                  //hasInWishlist ? Icons.delete : Icons.favorite,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: onTapFavourite ?? () => addToWishlist(controller)
            //() => hasInWishlist ? removeFromWishlist() : addToWishlist(controller),
            );
      },
    );
  }

  Future<void> addToWishlist(controller) async {
    final response = await controller.addToWishlist(product.id!);
    if (response) {
      UiHelper.showSnackBar("Success", "Product added to wishlist");
      //await Get.find<WishlistController>().checkIfExistInWishlist(product.id!);
    } else {
      UiHelper.showSnackBar("Failed", "Product add to wishlist failed");
    }
  }

// Future<void> removeFromWishlist() async {
//   final response = await Get.find<RemoveWishlistController>().removeFromWishlist(product.id!);
//   if (response) {
//     Get.back();
//     UiHelper.showSnackBar("Success", "Product removed from Wishlist");
//   } else {
//     UiHelper.showSnackBar("Failed", "Something went wrong");
//   }
// }
}
