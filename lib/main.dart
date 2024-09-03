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
  String _message = "Tap or Gesture Here!";

  void _updateMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _updateMessage('Tap detected!');
          },
          onDoubleTap: () {
            _updateMessage('Double Tap detected!');
          },
          onLongPress: () {
            _updateMessage('Long Press detected!');
          },
          onPanUpdate: (details) {
            _updateMessage('Drag detected at \n ${details.localPosition}');
          },
          child: Container(
            color: Colors.blue,
            width: 300,
            height: 300,
            alignment: Alignment.center,
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
