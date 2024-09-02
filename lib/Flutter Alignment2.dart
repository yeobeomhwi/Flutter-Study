import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Alignment2'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[300], // 부모 컨테이너의 배경색 설정
          child: Align(
            alignment: Alignment.center,
            heightFactor: 3.0, // Align 위젯의 너비를 자식 위젯 너비의 2배로 설정
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue, // 자식 컨테이너의 배경색 설정
              child: Center(
                child: Text(
                  'Aligned Text',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
