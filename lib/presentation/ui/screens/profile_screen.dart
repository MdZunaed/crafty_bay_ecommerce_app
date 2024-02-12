import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/invoice_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/verify_email_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Profile? profile = Get.find<AuthController>().profile;
    String fullAddress =
        "${profile?.cusAdd}, ${profile?.cusCity}, ${profile?.cusPostcode}, ${profile?.cusState}, ${profile?.cusCountry},";
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Card(
              child: ListTile(
                //titleAlignment: ListTileTitleAlignment.top,
                leading: CircleAvatar(child: Icon(Icons.person)),
                title:
                    Text(profile?.cusName ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile?.cusPhone ?? ''),
                    Text(fullAddress),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            optionCard("Invoice List", Icons.abc, () {
              Get.to(InvoiceListScreen());
            }),
            optionCard("Logout", Icons.logout, () {
              Get.defaultDialog(
                title: "Warning",
                middleText: "Are you sure to logout?",
                onConfirm: () async {
                  await AuthController.clearAuthData();
                  Get.offAll(() => const VerifyEmailScreen());
                },
                onCancel: () {
                  //Get.back(closeOverlays: true);
                  Get.to(() => ProfileScreen());
                },
              );
            }, Colors.red),
          ],
        ),
      ),
    );
  }

  Card optionCard(title, icon, onTap, [iconBgColor]) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: iconBgColor, child: Icon(icon)),
        title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        onTap: onTap,
      ),
    );
  }
}
