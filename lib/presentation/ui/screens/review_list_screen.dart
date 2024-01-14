import 'package:crafty_bay/presentation/ui/screens/add_review_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/filled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatelessWidget {
  const ReviewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews")),
      body: Column(
        children: [
          Expanded(
            child: Expanded(
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (c, i) {
                  return const SizedBox(height: 3);
                },
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleIconButton(icon: Icons.person_outline),
                              const SizedBox(width: 5),
                              Text(
                                "Uvuvuye vuye vuye",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
                              )
                            ],
                          ),
                          const Text(
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
          addReviewContainer(),
        ],
      ),
    );
  }

  BottomContainer addReviewContainer() {
    return BottomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reviews (100)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
          ),
          FilledIconButton(
            height: 52,
            width: 52,
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
