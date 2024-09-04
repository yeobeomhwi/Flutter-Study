import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Example'),
      ),
      body: MyInheritedWidget(
        data: 42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetA(),
            WidgetB(),
          ],
        ),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final int data;

  const MyInheritedWidget(
      {super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedData = MyInheritedWidget.of(context)?.data ?? 0;
    return Text('Widget A: $inheritedData');
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedData = MyInheritedWidget.of(context)?.data ?? 0;
    return Text('Widget B: $inheritedData');
  }
}
