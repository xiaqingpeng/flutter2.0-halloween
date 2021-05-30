import 'package:flutter/material.dart';

class ColorThemeProvider extends ChangeNotifier {
  MaterialColor _color = Colors.blue;
  MaterialColor get color => _color;
  ColorThemeProvider() {
    _color = Colors.blue;
  }
  void changeColor({MaterialColor color = Colors.blue}) {
    _color = color;
    notifyListeners();
  }
}
