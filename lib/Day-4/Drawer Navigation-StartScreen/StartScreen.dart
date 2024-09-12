import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studyfluter/DrawerItems.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItems(),
      appBar: AppBar(
        title: Text('Drawer Navigation-StartScreen'),
      ),
      body: Center(
        child: Text(
          'Welcome to StartScreen',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
