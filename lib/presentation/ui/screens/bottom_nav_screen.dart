import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List screens = const [HomeScreen(), CategoryScreen(), CartScreen(), WishlistScreen()];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        body: screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          currentIndex: controller.currentIndex,
          onTap: controller.changeScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          ],
        ),
      );
    });
  }
}
