import 'package:flutter/material.dart';

class ColorPickerController with ChangeNotifier {
  Color currentColor = Colors.white;
  set setCurrentColor(Color value) {
    currentColor = value;
    notifyListeners();
  }
}
