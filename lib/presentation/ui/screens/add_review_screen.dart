import 'package:flutter/material.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Review")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(decoration: const InputDecoration(hintText: "First Name")),
            const SizedBox(height: 14),
            TextFormField(decoration: const InputDecoration(hintText: "Last Name")),
            const SizedBox(height: 14),
            TextFormField(maxLines: 7, decoration: const InputDecoration(hintText: "Write review")),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text("Submit"))),
          ],
        ),
      ),
    );
  }
}
