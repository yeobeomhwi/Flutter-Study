import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Tween Example')),
        body: Center(child: ColorTransitionExample()),
      ),
    );
  }
}

class ColorTransitionExample extends StatefulWidget {
  @override
  State<ColorTransitionExample> createState() => _ColorTransitionExampleState();
}

class _ColorTransitionExampleState extends State<ColorTransitionExample> {
  Color _color = Colors.blue;

  void _changeColor(){
    setState(() {
      _color= Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Transition Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              color: _color,
              width: 200,
              height: 200,
              child: Center(
                child: Text('Hello World'),
              ),
            ),
            ElevatedButton(
              onPressed: _changeColor,
              child: Text('Change Color'),
            ),
          ],
        ),
      ),
    );
  }
}
