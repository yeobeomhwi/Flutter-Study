import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Profile Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the back method
                Get.back();
              },
              child: const Text('Back to Settings'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the toNamed method
                Get.toNamed('settings');
              },
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
