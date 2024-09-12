import 'package:flutter/material.dart';
import 'package:studyfluter/Day-4/Drawer%20Navigation-StartScreen/DrawerItems.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItems(),
      appBar: AppBar(
        title: Text('Drawer Navigation-HomeScreen'),
      ),
      body: Center(
        child: Text(
          'Welcome to Home Screen',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
