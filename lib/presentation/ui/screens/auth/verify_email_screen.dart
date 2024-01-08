
import 'package:crafty_bay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 160),
            const AppLogo(width: 100),
            const SizedBox(height: 10),
            Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge),
            Text("Please enter your email address",
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const VerifyOtpScreen());
                    }, child: const Text("Next"))),
          ],
        ),
      ),
    );
  }
}
