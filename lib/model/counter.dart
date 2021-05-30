import 'package:flutter/foundation.dart';
class Counter with ChangeNotifier {//1
  int _count=1;
 

  void add() {
    _count++;
    notifyListeners();//2
  }
  get count => _count;//3
}