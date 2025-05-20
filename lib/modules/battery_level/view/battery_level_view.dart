import 'package:flutter_advanced/exports.dart';

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
        title: const ScaleText('Battery Level'),
      ),
      body: Center(
        child: Consumer(
          builder: (_, BatteryLevelController provider, __) {
            return ScaleText(
              'Battery Level: ${provider.batteryLevel}',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
