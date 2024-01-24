import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController emailTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

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
              Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge),
              Text("Please enter your email address", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 20),
              TextFormField(
                validator: validateEmail,
                //     (value) {
                //   if (value?.trim().isEmpty ?? true) {
                //     return 'enter email address';
                //   }
                //   return null;
                // },
                controller: emailTEController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 20),
              GetBuilder<SendEmailOtpController>(builder: (controller) {
                return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenterProgressIndicator(),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final result = await controller.sendOtpToEmail(emailTEController.text.trim());
                          if (result) {
                            Get.to(() => VerifyOtpScreen(
                                  email: emailTEController.text.trim(),
                                ));
                          } else {
                            Get.snackbar("Send Otp Failed", controller.errorMessage);
                          }
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isEmpty || !regex.hasMatch(value) ? 'Enter a valid email address' : null;
}
