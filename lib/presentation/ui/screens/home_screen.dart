import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/banner_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            searchTextField(),
            const SizedBox(height: 10),
            const BannerSlider(),
            //const SizedBox(height: 10),
            SectionTitle(title: "All Categories", onTapSeeAll: () {}),
          ],
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.navLogo),
      actions: [
        CircleIconButton(icon: Icons.notifications_active_outlined, onTap: () {}),
        CircleIconButton(icon: Icons.call_outlined, onTap: () {}),
        CircleIconButton(icon: Icons.person_outline, onTap: () {}),
      ],
    );
  }

  SizedBox searchTextField() {
    return SizedBox(
        height: 45,
        child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)))));
  }
}
