import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RotationTransition(),
    );
  }
}

class RotationTransition extends StatefulWidget {
  @override
  State<RotationTransition> createState() => _RotationTransitionState();
}

class _RotationTransitionState extends State<RotationTransition> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Transition Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
                turns: turns,
                duration: const Duration(seconds: 1),
                child: const Text('Hello World!')),
            ElevatedButton(
              onPressed: _changeRotation,
              child: const Text('Animate'),
            )
          ],
        ),
      ),
    );
  }
}
