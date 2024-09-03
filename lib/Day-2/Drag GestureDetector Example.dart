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
  Offset _position = Offset.zero;

  void _handlePanUpdate(DragUpdateDetails details) {
    setState(() {
      _position = details.localPosition; // Update the position state
      print(
          '${_position.dx.toStringAsFixed(1)}, ${_position.dy.toStringAsFixed(1)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag GestureDetector Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onPanUpdate: _handlePanUpdate,
              child: Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Drag me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
