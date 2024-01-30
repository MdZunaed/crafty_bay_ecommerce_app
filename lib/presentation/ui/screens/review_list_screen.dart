import 'package:crafty_bay/data/models/review_list_model.dart';
import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/add_review_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/filled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  final int productId;

  const ReviewListScreen({super.key, required this.productId});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Get.find<ReviewListController>().getReviewList(widget.productId);
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews")),
      body: GetBuilder<ReviewListController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenterProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: Expanded(
                child: GetBuilder<ReviewListController>(builder: (controller) {
                  return ListView.separated(
                    itemCount: controller.reviewListModel.reviewList!.length,
                    separatorBuilder: (c, i) {
                      return const SizedBox(height: 3);
                    },
                    itemBuilder: (context, index) {
                      return reviewCard(index, controller.reviewListModel.reviewList);
                    },
                  );
                }),
              ),
            ),
            addReviewContainer(controller.reviewListModel.reviewList ?? []),
          ],
        );
      }),
    );
  }

  Card reviewCard(index, reviewList) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleIconButton(icon: Icons.person_outline),
                const SizedBox(width: 5),
                Text("${reviewList?[index].profile?.firstName} ${reviewList?[index].profile?.lastName}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800))
              ],
            ),
            Text(reviewList?[index].description ?? '', style: const TextStyle(color: Colors.black54))
          ],
        ),
      ),
    );
  }

  BottomContainer addReviewContainer(List<Review> reviewList) {
    return BottomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reviews (${reviewList.length})",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
          ),
          FilledIconButton(
            height: 52,
            width: 52,
            borderRadius: BorderRadius.circular(30),
            icon: Icons.add,
            onTap: () {
              Get.to(AddReviewScreen(productId: widget.productId));
            },
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}
