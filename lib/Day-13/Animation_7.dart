import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeTransitionExample(),
    );
  }
}

class SizeTransitionExample extends StatefulWidget {
  @override
  _SizeTransitionExampleState createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample> {
  bool _isExpanded = false;

  void _toggleSize() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Transition Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선
              width: _isExpanded ? 300 : 100, // 가로 크기 변화
              height: _isExpanded ? 300 : 100, // 세로 크기 변화
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleSize,
              child: Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
