import 'dart:async';
import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;

  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController otpTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  int time = 120;

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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 160),
              const AppLogo(width: 100),
              const SizedBox(height: 10),
              Text("Enter OTP Code", style: Theme.of(context).textTheme.titleLarge),
              Text("A 6 digit OTP code has been sent to", style: Theme.of(context).textTheme.bodySmall),
              Text("${widget.email}", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 20),
              PinCodeTextField(
                controller: otpTEController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "enter otp";
                  }
                  return null;
                },
                appContext: context,
                length: 6,
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
              GetBuilder<VerifyOtpController>(builder: (controller) {
                return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenterProgressIndicator(),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final response = await controller.verifyOtp(widget.email, otpTEController.text);
                          if (response) {
                            if (controller.shouldNavigateCompleteProfile) {
                              Get.to(() => const CompleteProfileScreen());
                            } else {
                              Get.offAll(() => const BottomNavScreen());
                            }
                          } else {
                            UiHelper.showSnackBar("Otp verification failed", controller.errorMessage);
                          }
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      text: "This code will expire in ",
                      style: const TextStyle(color: Colors.grey),
                      children: [
                    TextSpan(
                        text: "${time}s",
                        style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold))
                  ])),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  if (time == 0) {
                    time = 120;
                    countTime();
                    await Get.find<SendEmailOtpController>().sendOtpToEmail(widget.email);
                  } else {}
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(color: time != 0 ? Colors.grey : AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void countTime() {
    if (time > 0) {
      time -= 1;
      if (mounted) {
        setState(() {});
      }
    }
  }
}
