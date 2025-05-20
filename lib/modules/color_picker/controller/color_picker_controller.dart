import 'package:flutter_advanced/exports.dart';

class ColorPickerController with ChangeNotifier {
  Color currentColor = Colors.white;
  set setCurrentColor(Color value) {
    currentColor = value;
    notifyListeners();
  }
}
