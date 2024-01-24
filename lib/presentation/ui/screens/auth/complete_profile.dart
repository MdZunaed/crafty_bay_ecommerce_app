import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../state_holders/verify_otp_controller.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController cityTEController = TextEditingController();
  final TextEditingController addressTEController = TextEditingController();
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
              const SizedBox(height: 50),
              const AppLogo(width: 100),
              const SizedBox(height: 10),
              Text("Complete Profile", style: Theme.of(context).textTheme.titleLarge),
              Text("Get started with us with your details", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 20),
              TextFormField(
                  controller: firstNameTEController,
                  validator: validator,
                  decoration: const InputDecoration(hintText: "First Name")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: lastNameTEController,
                  validator: validator,
                  decoration: const InputDecoration(hintText: "Last Name")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: mobileTEController,
                  validator: validator,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Mobile")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: cityTEController,
                  validator: validator,
                  decoration: const InputDecoration(hintText: "City")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: addressTEController,
                  validator: validator,
                  maxLines: 3,
                  decoration: const InputDecoration(hintText: "Shipping Address")),
              const SizedBox(height: 20),
              GetBuilder<CompleteProfileController>(builder: (controller) {
                return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenterProgressIndicator(),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              String token = Get.find<VerifyOtpController>().token;
                              Profile profile = Profile(
                                  firstName: firstNameTEController.text.trim(),
                                  lastName: lastNameTEController.text.trim(),
                                  mobile: mobileTEController.text.trim(),
                                  city: cityTEController.text.trim(),
                                  shippingAddress: addressTEController.text.trim());
                              final response = await controller.createProfileData(token, profile);
                              if (response) {
                                Get.offAll(() => const BottomNavScreen());
                              } else {
                                UiHelper.showSnackBar("Complete profile failed", controller.errorMessage);
                              }
                            }
                          },
                          child: const Text("Complete"))),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  String? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter valid value';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    mobileTEController.dispose();
    cityTEController.dispose();
    addressTEController.dispose();
  }
}
