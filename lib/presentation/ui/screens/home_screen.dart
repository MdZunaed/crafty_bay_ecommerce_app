import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_producr_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_item.dart';
import '../widgets/home/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            searchTextField(),
            const SizedBox(height: 10),
            GetBuilder<HomeBannerController>(builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: const CenterProgressIndicator(),
                child: BannerSlider(
                  bannerList: controller.bannerList.bannerList ?? [],
                ),
              );
            }),
            SectionTitle(
              title: "All Categories",
              onTapSeeAll: () {
                // Get.to(const CategoryScreen());
                Get.find<BottomNavController>().changeScreen(1);
              },
            ),
            categoryList(),
            const SizedBox(height: 8),
            SectionTitle(
              title: "Popular",
              onTapSeeAll: () {
                Get.to(const ProductListScreen(category: "Popular Product", categoryId: 3));
              },
            ),
            GetBuilder<PopularProductController>(builder: (controller) {
              return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenterProgressIndicator(),
                  child: productList(controller.productListModel.productList ?? []));
            }),
            const SizedBox(height: 8),
            SectionTitle(
              title: "Special",
              onTapSeeAll: () {
                Get.to(const ProductListScreen(category: "Special Product", categoryId: 3));
              },
            ),
            GetBuilder<SpecialProductController>(builder: (controller) {
              return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenterProgressIndicator(),
                  child: productList(controller.productListModel.productList ?? []));
            }),
            const SizedBox(height: 8),
            SectionTitle(
              title: "New",
              onTapSeeAll: () {
                Get.to(const ProductListScreen(category: "New Arrived", categoryId: 3));
              },
            ),
            GetBuilder<NewProductController>(builder: (controller) {
              return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenterProgressIndicator(),
                  child: productList(controller.productListModel.productList ?? []));
            }),
          ],
        ),
      ),
    );
  }

  SizedBox categoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterProgressIndicator(),
          child: ListView.separated(
            itemCount: controller.categoryListModel.categoryList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (c, i) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              return CategoryItem(category: controller.categoryListModel.categoryList![index]);
            },
          ),
        );
      }),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, i) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          return ProductItemCard(key: ValueKey(index), product: productList[index]);
        },
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.navLogo),
      actions: [
        CircleIconButton(icon: Icons.notifications_active_outlined, onTap: () {}),
        //CircleIconButton(icon: Icons.call_outlined, onTap: () {}),
        CircleIconButton(
          icon: Icons.person_outline,
          // onTap: () async {
          //   await AuthController.clearAuthData();
          //   Get.offAll(() => const VerifyEmailScreen());
          // },
          onTap: () {
            if (AuthController.token != null) {
              Get.to(() => const ProfileScreen());
            } else {
              Get.to(() => const VerifyEmailScreen());
            }
          },
        ),
      ],
    );
  }

  SizedBox searchTextField() {
    return SizedBox(
      height: 45,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
