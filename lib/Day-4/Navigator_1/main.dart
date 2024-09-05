import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SecondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}
