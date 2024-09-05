import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Second Screen',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => context.push('/third'),
              child: Text('Go to Third Screen'),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text('Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
