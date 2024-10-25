
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: authController.setEmail,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: authController.setPassword,
            ),
            const SizedBox(height: 20),
            if (authController.isLoading.value)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: authController.register,
                child: const Text('Register'),
              ),
            TextButton(
              onPressed: () {
                // TODO: Implement the toNamed method
                Get.toNamed('/login');
              },
              child: const Text('Back to Login'),
            ),
          ],
        )),
      ),
    );
  }
}
