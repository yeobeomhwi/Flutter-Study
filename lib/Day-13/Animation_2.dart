import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(child: FadeInDemo()),
      ),
    );
  }
}

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/content/assets/images/docs/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {

  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(owlUrl),
        TextButton(
          child: const Text(
            'Show Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => setState(() {
            opacity = 1;
          }),
        ),
        AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: opacity,
          child: const Column(
            children: [
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        )
      ],
    );
  }
}
