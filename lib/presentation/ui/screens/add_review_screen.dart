import 'package:crafty_bay/presentation/state_holders/add_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/get_snackbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewScreen extends StatefulWidget {
  final int productId;
  const AddReviewScreen({super.key, required this.productId});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController reviewTEController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Review")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //TextFormField(decoration: const InputDecoration(hintText: "First Name")),
              //const SizedBox(height: 14),
              //TextFormField(decoration: const InputDecoration(hintText: "Last Name")),
              //const SizedBox(height: 14),
              TextFormField(
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Review can't be empty";
                    }
                    return null;
                  },
                  controller: reviewTEController,
                  maxLines: 7,
                  decoration: const InputDecoration(hintText: "Write review")),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: GetBuilder<AddReviewController>(builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterProgressIndicator(),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (AuthController.token != null) {
                                final result = await controller.addNewReview(
                                    widget.productId, reviewTEController.text.trim());
                                if (result) {
                                  Get.find<ReviewListController>().getReviewList(widget.productId);
                                  UiHelper.showSnackBar("Success", "Review added successfully");
                                } else {
                                  UiHelper.showSnackBar("Failed", controller.errorMessage);
                                }
                              } else {
                                Get.to(const VerifyEmailScreen());
                              }
                            }
                          },
                          child: const Text("Submit")),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
