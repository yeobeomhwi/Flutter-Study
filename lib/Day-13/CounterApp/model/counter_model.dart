import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  void plus() {
    counter++;
    notifyListeners();
  }

  void minus() {
    counter--;
    notifyListeners();
  }
}


