import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadeInExample(),
    );
  }
}

class FadeInExample extends StatefulWidget {
  @override
  _FadeInExampleState createState() => _FadeInExampleState();
}

class _FadeInExampleState extends State<FadeInExample> {
  double _opacity = 0.0; // Initial opacity set to 0 (fully transparent)

  @override
  void initState() {
    super.initState();
    // Trigger the fade-in animation after a short delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Fully opaque
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade In Example'),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2), // Duration of the fade-in animation
          opacity: _opacity, // Control the opacity
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 24), // Style for the text
          ),
        ),
      ),
    );
  }
}
