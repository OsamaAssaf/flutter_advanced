import 'dart:developer';

import 'package:alarm/alarm.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/modules/home/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../resources/widgets/scale_text.dart';
import '../../analog_clock/controller/analog_clock_controller.dart';
import '../../analog_clock/view/analog_clock_view.dart';
import '../../animations/views/animation_view.dart';
import '../../battery_level/controller/battery_level_controller.dart';
import '../../battery_level/view/battery_level_view.dart';
import '../../camera/controller/camera_controller.dart';
import '../../camera/view/camera_view.dart';
import '../../color_picker/controller/color_picker_controller.dart';
import '../../color_picker/view/color_picker_view.dart';
import '../../ocr_scanner/controller/ocr_scanner_controller.dart';
import '../../ocr_scanner/views/ocr_scanner_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = HomeController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase(
        [
          homeController.one,
          homeController.tow,
          homeController.three,
        ],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ScaleText(
          'Home',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  child: const ScaleText(
                    'Analog Clock',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
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
                  child: const ScaleText('Battery Level'),
                ),
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
                  child: const ScaleText('Camera'),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => ColorPickerController(),
                          child: const ColorPickerView(),
                        ),
                      ),
                    );
                  },
                  child: const ScaleText('Color Picker'),
                ),
                FilledButton(
                  onPressed: () {
                    BetterFeedback.of(context).show(
                      (UserFeedback feedback) {
                        log(feedback.text);
                        log(feedback.extra.toString());
                        log(feedback.screenshot.toString());
                      },
                    );
                  },
                  child: const ScaleText('Feedback'),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AnimationView(),
                      ),
                    );
                  },
                  child: const ScaleText('Animation'),
                ),
                FilledButton(
                  onPressed: () async {
                    final AlarmSettings alarmSettings = AlarmSettings(
                      id: 42,
                      dateTime: DateTime.now().add(const Duration(seconds: 10)),
                      assetAudioPath: 'assets/sounds/alarm.mp3',
                      loopAudio: true,
                      vibrate: true,
                      volumeMax: true,
                      fadeDuration: 3.0,
                      notificationTitle: 'This is the title',
                      notificationBody: 'This is the body',
                      enableNotificationOnKill: true,
                      stopOnNotificationOpen: true,
                    );
                    await Alarm.set(alarmSettings: alarmSettings);
                  },
                  child: const ScaleText('Alarm'),
                ),
                FilledButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => OcrScannerController(),
                          child: OcrScannerView(),
                        ),
                      ),
                    );
                  },
                  child: const ScaleText('OCR Scanner'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
