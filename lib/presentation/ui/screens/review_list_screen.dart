import 'package:crafty_bay/presentation/ui/screens/add_review_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/filled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ReviewListScreen extends StatelessWidget {
  const ReviewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Expanded(
                child: ListView.separated(
                  itemCount: 6,
                  separatorBuilder: (c, i) {
                    return const SizedBox(height: 3);
                  },
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleIconButton(icon: Icons.person_outline),
                                SizedBox(width: 5),
                                Text(
                                  "Uvuvuye vuye vuye",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
                                )
                              ],
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          addReviewContainer(),
        ],
      ),
    );
  }

  Container addReviewContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reviews (100)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
          ),
          FilledIconButton(
            height: 50,
            width: 50,
            borderRadius: BorderRadius.circular(30),
            icon: Icons.add,
            onTap: () {
              Get.to(const AddReviewScreen());
            },
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}
