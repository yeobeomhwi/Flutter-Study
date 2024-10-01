import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/counter_model.dart';
import '../model/mymodel.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Provider Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pushed the button this many times: '),
              Consumer<MyModel>(
                builder: (context, model, child){
                  return Text('${model.count}', style: Theme.of(context).textTheme.headlineMedium);
                }
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<MyModel>().increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
