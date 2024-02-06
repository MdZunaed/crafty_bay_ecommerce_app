import 'package:crafty_bay/data/models/create_profile_params.dart';
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
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController cityTEController = TextEditingController();
  final TextEditingController postCodeTEController = TextEditingController();
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
                  controller: nameTEController,
                  validator: validator,
                  decoration: const InputDecoration(hintText: "Full Name")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: mobileTEController,
                  validator: validator,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Mobile no")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: cityTEController,
                  validator: validator,
                  decoration: const InputDecoration(hintText: "City")),
              const SizedBox(height: 14),
              TextFormField(
                  controller: postCodeTEController,
                  validator: validator,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Post code")),
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
                              CreateProfileParams params = CreateProfileParams(
                                cusName: nameTEController.text.trim(),
                                cusPhone: mobileTEController.text.trim(),
                                cusCity: cityTEController.text.trim(),
                                cusPostcode: postCodeTEController.text.trim(),
                                cusAdd: addressTEController.text.trim(),
                                cusFax: mobileTEController.text.trim(),
                                cusState: "Dhaka",
                                cusCountry: "Bangladesh",
                                shipName: nameTEController.text.trim(),
                                shipPhone: mobileTEController.text.trim(),
                                shipCity: cityTEController.text.trim(),
                                shipPostcode: postCodeTEController.text.trim(),
                                shipAdd: addressTEController.text.trim(),
                                shipState: "Dhaka",
                                shipCountry: "Bangladesh",
                              );
                              final response = await controller.createProfileData(params);
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
    nameTEController.dispose();
    postCodeTEController.dispose();
    mobileTEController.dispose();
    cityTEController.dispose();
    addressTEController.dispose();
  }
}
