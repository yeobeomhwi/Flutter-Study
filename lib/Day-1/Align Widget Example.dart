import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Text('하단버튼'),
        // ),
        appBar: AppBar(
          title: const Text('Align Widget Example'),
        ),
        body: Container(
          child: buildCenter(),
        ),
      ),
    );
  }

  Widget buildCenter() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'widget',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
