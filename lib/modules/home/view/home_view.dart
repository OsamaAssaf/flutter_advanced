import 'dart:developer';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/modules/home/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../resources/widgets/scale_text.dart';
import '../../analog_clock/controller/analog_clock_controller.dart';
import '../../analog_clock/view/analog_clock_view.dart';
import '../../battery_level/controller/battery_level_controller.dart';
import '../../battery_level/view/battery_level_view.dart';
import '../../camera/controller/camera_controller.dart';
import '../../camera/view/camera_view.dart';
import '../../color_picker/controller/color_picker_controller.dart';
import '../../color_picker/view/color_picker_view.dart';

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
    return ShowCaseWidget(
      autoPlay: true,
      builder: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Showcase(
                key: homeController.one,
                description: 'App Bar',
                child: const ScaleText(
                  'Home',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Showcase(
                      key: homeController.tow,
                      description: 'Analog Clock',
                      child: FilledButton(
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
                    ),
                    const SizedBox(height: 16.0),
                    Showcase(
                      key: homeController.three,
                      description: 'Battery Level',
                      child: FilledButton(
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
                      child: const ScaleText('Camera'),
                    ),
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 16.0),
                    FilledButton(
                      onPressed: () {
                        BetterFeedback.of(context).show((UserFeedback feedback) {
                          log(feedback.text);
                          log(feedback.extra.toString());
                          log(feedback.screenshot.toString());
                        });
                      },
                      child: const ScaleText('Feedback'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
