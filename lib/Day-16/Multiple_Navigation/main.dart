import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';
import 'SettingsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Multi-Page Navigation App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}



