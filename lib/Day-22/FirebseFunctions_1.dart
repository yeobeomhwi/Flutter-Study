import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Firebsefunctions1 extends StatelessWidget {
  const Firebsefunctions1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FirebseFunctions",
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  Future<void> callAddMessageFunction() async {
    final url = Uri.parse(
        'http://10.0.2.2:5001/flutter-study-96fd6/us-central1/addmessage?text=uppercaseme');
    final response = await http.post(
      url
    );

    if (response.statusCode == 200) {
      print('Function call succeeded: ${response.body}');
    } else {
      print('Function call failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebse Functions Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                callAddMessageFunction();
              },
              child: const Text('호출하기'),
            )
          ],
        ),
      ),
    );
  }
}
