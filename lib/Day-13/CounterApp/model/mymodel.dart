import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:studyfluter/Day-13/CounterApp/main.dart';
class MyModel with ChangeNotifier{
  int _count = 0;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MyApp(),
    ),
  );
}