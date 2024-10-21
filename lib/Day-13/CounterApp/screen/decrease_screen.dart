import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/counter_model.dart';



class DecreaseScreen extends StatefulWidget {
  const DecreaseScreen({super.key});

  @override
  State<DecreaseScreen> createState() => _DecreaseScreenState();
}

class _DecreaseScreenState extends State<DecreaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('숫자 차감'),
        backgroundColor: Colors.red,
      ),
      body:Consumer<CounterModel>(builder: (context,counterModel,child){
        return Center(child: Text('${counterModel.counter}',style: TextStyle(fontSize: 30),));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<CounterModel>(context,listen: false).minus();
        },
        child: Icon(Icons.remove),
        backgroundColor: Colors.red,
      ),
    );
  }
}
