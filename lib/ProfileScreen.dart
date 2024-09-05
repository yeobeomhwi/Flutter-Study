import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studyfluter/DrawerItems.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItems(),
      appBar: AppBar(
        title: Text('Drawer Navigation-ProfileScreen'),
      ),
      body: Center(
        child: Text(
          'Welcome to ProfileScreen',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
