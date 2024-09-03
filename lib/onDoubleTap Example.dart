import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? action;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('onDoubleTap Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  action = '더블탭 했습니다.';
                });
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blue,
                child: Text(
                  'DoubleTap me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text('$action')
          ],
        ),
      ),
    );
  }
}
