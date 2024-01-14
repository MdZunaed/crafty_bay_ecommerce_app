import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class BottomContainer extends StatelessWidget {
  final Widget child;
  const BottomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.12),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
        child: child);
  }
}
