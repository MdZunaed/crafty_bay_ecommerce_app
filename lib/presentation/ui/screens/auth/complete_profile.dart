
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const AppLogo(width: 100),
            const SizedBox(height: 10),
            Text("Complete Profile", style: Theme.of(context).textTheme.titleLarge),
            Text("Get started with us with your details",
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(hintText: "First Name")),
            const SizedBox(height: 14),
            TextFormField(
                decoration: const InputDecoration(hintText: "Last Name")),
            const SizedBox(height: 14),
            TextFormField(
                decoration: const InputDecoration(hintText: "Mobile")),
            const SizedBox(height: 14),
            TextFormField(
                decoration: const InputDecoration(hintText: "City")),
            const SizedBox(height: 14),
            TextFormField(maxLines: 3,
                decoration: const InputDecoration(hintText: "Shipping Address")),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                    }, child: const Text("Complete"))),
          ],
        ),
      ),
    );
  }
}
