import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/review_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/banner_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/category_item.dart';
import '../widgets/home/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            const BannerSlider(),
            //const SizedBox(height: 10),
            SectionTitle(
                title: "All Categories",
                onTapSeeAll: () {
                  // Get.to(const CategoryScreen());
                  Get.find<BottomNavController>().changeScreen(1);
                }),
            categoryList(),
            const SizedBox(height: 8),
            SectionTitle(
                title: "Popular",
                onTapSeeAll: () {
                  Get.to(const ProductListScreen(category: "Popular Product"));
                }),
            productList(), const SizedBox(height: 8),
            SectionTitle(
                title: "Special",
                onTapSeeAll: () {
                  Get.to(const ProductListScreen(category: "Special Product"));
                }),
            productList(), const SizedBox(height: 8),
            SectionTitle(
                title: "New",
                onTapSeeAll: () {
                  Get.to(const ProductListScreen(category: "New Arrived"));
                }),
            productList(),
          ],
        ),
      ),
    );
  }

  SizedBox categoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, i) {
          return const SizedBox(width: 20);
        },
        itemBuilder: (context, index) {
          return CategoryItem(
            onTap: () {
              Get.to(const ProductListScreen());
            },
          );
        },
      ),
    );
  }

  SizedBox productList() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, i) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (c, i) {
          return const ProductItemCard();
        },
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.navLogo),
      actions: [
        CircleIconButton(icon: Icons.notifications_active_outlined, onTap: () {}),
        CircleIconButton(icon: Icons.call_outlined, onTap: () {}),
        CircleIconButton(
            icon: Icons.logout,
            onTap: () async {
              await Get.find<AuthController>().clearAuthData();
              Get.offAll(() => const VerifyEmailScreen());
            }),
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
