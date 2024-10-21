import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<int>(
          create: (_) async {
            await Future.delayed(Duration(seconds: 2));
            return 42;
          },
          initialData: 0,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('FutureProvider Example'),),
          body: const Center(child: FutureProviderExample(),),
        ),
      ),
    );
  }
}


class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({super.key});
  @override
  Widget build(BuildContext context) {
    final int data = Provider.of<int>(context);
    return data == null ? const CircularProgressIndicator() : Text('Data: $data');
  }
}


