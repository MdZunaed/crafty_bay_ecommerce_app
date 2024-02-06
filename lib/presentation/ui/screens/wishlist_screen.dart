import 'package:crafty_bay/presentation/state_holders/remove_wishlist_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wishlist_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/auth_controller.dart';
import '../../state_holders/bottom_nav_controller.dart';
import '../widgets/circular_indicator.dart';
import 'product_details_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishlistController>().getWishlist();
      print(AuthController.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text(
            "Wishlist",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: GetBuilder<WishlistController>(builder: (controller) {
          if (controller.inProgress == true) {
            return const CenterProgressIndicator();
          }
          if (controller.wishlistModel.wishlistData?.isEmpty ?? true) {
            return const Center(child: Text("No item found"));
          }
          return RefreshIndicator(
            onRefresh: () => controller.getWishlist(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 4, childAspectRatio: 0.80),
                itemCount: controller.wishlistModel.wishlistData?.length ?? 0,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductItemCard(
                      product: controller.wishlistModel.wishlistData![index].product!,
                      onTap: () {
                        Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Select your option",
                          cancel: FilledButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Get.back();
                              }),
                          content: Column(
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: ListTile(
                                  title: Text("View Product"),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    Get.back();
                                    Get.to(ProductDetailsScreen(
                                        productId:
                                            controller.wishlistModel.wishlistData?[index].product?.id ?? 0));
                                  },
                                ),
                              ),
                              GetBuilder<RemoveWishlistController>(
                                builder: (removeWishlistController) {
                                  if (removeWishlistController.inProgress) {
                                    return const CupertinoActivityIndicator(color: AppColors.primaryColor);
                                  }
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      title: Text("Remove from wishlist"),
                                      trailing: Icon(Icons.delete, color: Colors.red),
                                      onTap: () async {
                                        final response = await removeWishlistController.removeFromWishlist(
                                            controller.wishlistModel.wishlistData![index].productId ?? 0);
                                        if (response) {
                                          Get.back();
                                          UiHelper.showSnackBar("Success", "Product removed from Wishlist");
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
