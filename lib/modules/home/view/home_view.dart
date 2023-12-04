import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../analog_clock/controller/analog_clock_controller.dart';
import '../../analog_clock/view/analog_clock_view.dart';
import '../../battery_level/controller/battery_level_controller.dart';
import '../../battery_level/view/battery_level_view.dart';
import '../../camera/controller/camera_controller.dart';
import '../../camera/view/camera_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider(
                        create: (_) => AnalogClockController(),
                        child: const AnalogClockView(),
                      ),
                    ),
                  );
                },
                child: const Text('Analog Clock'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider(
                        create: (_) => BatteryLevelController(),
                        child: const BatteryLevelView(),
                      ),
                    ),
                  );
                },
                child: const Text('Battery Level'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider(
                        create: (_) => CameraViewController(),
                        child: const CameraView(),
                      ),
                    ),
                  );
                },
                child: const Text('Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
