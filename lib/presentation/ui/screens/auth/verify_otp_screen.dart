import 'dart:async';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  int time = 120;

  void countTime() {
    if (time > 0) {
      time -= 1;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countTime();
    });
  }

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
            Text("Enter OTP Code",
                style: Theme.of(context).textTheme.titleLarge),
            Text("A 4 digit OTP code has been sent",
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                inactiveFillColor: Colors.white,
                inactiveColor: AppColors.primaryColor,
                activeFillColor: AppColors.primaryColor,
                activeColor: AppColors.primaryColor,
                selectedColor: AppColors.primaryColor,
                selectedFillColor: AppColors.primaryColor,
              ),
              animationDuration: const Duration(milliseconds: 200),
              enableActiveFill: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const CompleteProfileScreen());
                    },
                    child: const Text("Next"))),
            const SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: "This code will expire in ",
                    style: const TextStyle(color: Colors.grey),
                    children: [
                  TextSpan(
                      text: "${time}s",
                      style:const  TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold))
                ])),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (time == 0) {
                  time = 120;
                  countTime();
                } else {}
              },
              child: Text(
                "Resend Code",
                style: TextStyle(
                    color: time != 0
                        ? Colors.grey
                        : AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
