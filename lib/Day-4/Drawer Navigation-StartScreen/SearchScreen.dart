import 'package:flutter/material.dart';
import 'package:studyfluter/Day-4/Drawer%20Navigation-StartScreen/DrawerItems.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItems(),
      appBar: AppBar(
        title: Text('Drawer Navigation-SearchScreen'),
      ),
      body: Center(
        child: Text(
          'Welcome to SearchScreen',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
