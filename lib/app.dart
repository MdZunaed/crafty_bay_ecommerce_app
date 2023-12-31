import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
            primarySwatch: MaterialColor(

                AppColors.primaryColor.value, AppColors.colorSwatch)),
        // primarySwatch:
        //     MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
      ),
    );
  }
}
