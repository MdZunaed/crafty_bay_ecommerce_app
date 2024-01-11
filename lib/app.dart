import 'package:crafty_bay/controller_binders.dart';
import 'package:crafty_bay/presentation/ui/screens/main_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      title: "Crafty Bay",
      home: const MainNavScreen(),
      theme: AppThemeData.lightTheme,
    );
  }
}
