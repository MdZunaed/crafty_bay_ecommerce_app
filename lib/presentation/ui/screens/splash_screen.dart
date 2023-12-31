import 'package:crafty_bay/presentation/ui/screens/verify_email.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2));
        Get.offAll(const VerifyEmail());
  }

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Spacer(),
          Image.asset(AssetsPath.logo),
          const Spacer(),
          CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text("version 1.0"),
          const SizedBox(height: 16),
        ],
      )),
    );
  }
}
