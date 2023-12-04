import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/battery_level_controller.dart';

class BatteryLevelView extends StatefulWidget {
  const BatteryLevelView({super.key});

  @override
  State<BatteryLevelView> createState() => _BatteryLevelViewState();
}

class _BatteryLevelViewState extends State<BatteryLevelView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final BatteryLevelController batteryLevelController =
          Provider.of<BatteryLevelController>(context, listen: false);
      batteryLevelController.getBatteryLevel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, BatteryLevelController provider, _) {
            return Text('Battery Level: ${provider.batteryLevel}');
          },
        ),
      ),
    );
  }
}
