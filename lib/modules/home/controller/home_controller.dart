import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  GlobalKey<State<StatefulWidget>> one = GlobalKey();
  GlobalKey<State<StatefulWidget>> tow = GlobalKey();
  GlobalKey<State<StatefulWidget>> three = GlobalKey();

  bool isLoading = false;

  set setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
