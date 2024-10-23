import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetXExample(),
    );
  }
}

class CounterController extends GetxController {
  var counter = 0.obs;
  var otherCounter = 0.obs;

  void increment() {
    counter++;
  }

  void incrementOther() {
    otherCounter++;
  }
}

class GetXExample extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Example'),
      ),
      body: Center(
        child: GetX<CounterController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: ${controller.counter}'),
                Text('Other Counter: ${controller.otherCounter}')
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: controller.incrementOther,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
