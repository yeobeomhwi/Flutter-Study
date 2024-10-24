
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:studyfluter/Day-16/Login&Register/main.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (_) {
                // TODO: Set the email
                authController.setEmail(_);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (_) {
                // TODO: Set the password
                authController.setPassword(_);
              },
            ),
            const SizedBox(height: 20),
            if (authController.isLoading.value)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: authController.login,
                child: const Text('Login'),
              ),
            TextButton(
              onPressed: () {
                // TODO: Implement the toNamed method
                Get.toNamed('/register');
              },
              child: const Text('Register'),
            ),
          ],
        )),
      ),
    );
  }
}
