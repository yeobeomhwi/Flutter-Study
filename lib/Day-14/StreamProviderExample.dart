import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<int>(
          create: (_) =>
              Stream.periodic(Duration(seconds: 1), (count) => count),
          initialData: 0,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('StreamProvider Example'),
          ),
          body: const Center(
            child: StreamProviderExample(),
          ),
        ),
      ),
    );
  }
}

class StreamProviderExample extends StatelessWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final int data = Provider.of<int>(context);
    return Text('Count : $data');
  }
}
