import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryLevelController extends ChangeNotifier {
  String batteryLevel = 'Unknown battery level.';

  Future<void> getBatteryLevel() async {
    final Battery battery = Battery();
    batteryLevel = (await battery.batteryLevel).toString();
    notifyListeners();
  }
}
