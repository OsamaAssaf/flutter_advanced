import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/widgets/scale_text.dart';
import '../controller/analog_clock_controller.dart';

class AnalogClockView extends StatefulWidget {
  const AnalogClockView({super.key});

  @override
  State<AnalogClockView> createState() => _AnalogClockViewState();
}

class _AnalogClockViewState extends State<AnalogClockView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final AnalogClockController homeController =
          Provider.of<AnalogClockController>(context, listen: false);
      homeController.startTimer();
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final AnalogClockController homeController =
          Provider.of<AnalogClockController>(context, listen: false);
      homeController.stopTimer();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ScaleText('Analog Clock'),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, AnalogClockController provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScaleText(provider.timeFormat.format(provider.currentTime)),
                const SizedBox(height: 32.0),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 240.0,
                    maxHeight: 240.0,
                    minHeight: 240.0,
                    minWidth: 240.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 4.0,
                    ),
                  ),
                  child: Consumer<AnalogClockController>(
                    builder: (BuildContext context, AnalogClockController provider, _) {
                      return CustomPaint(
                        painter: ClockPainter(currentDate: provider.currentTime),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  ClockPainter({super.repaint, required this.currentDate});
  final DateTime currentDate;
  @override
  void paint(Canvas canvas, Size size) {
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    const TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16.0,
    );
    for (int hour = 12; hour >= 1; hour--) {
      final double angle = -(hour - 3) * 30 * (pi / 180);
      final double radius = size.width / 2 - 16.0;
      Offset position =
          size.center(Offset.zero) + Offset(cos(angle) * radius, sin(angle) * -1 * radius);
      textPainter
        ..text = TextSpan(text: hour.toString(), style: textStyle)
        ..layout(minWidth: 0, maxWidth: double.infinity);

      textPainter.paint(canvas, position - Offset(textPainter.width / 2, textPainter.height / 2));
    }

    _drawHand(canvas, size, currentDate.hour % 12, 12, 0.5, 4.0, Colors.black);
    _drawHand(canvas, size, currentDate.minute, 60, 0.7, 2.0, Colors.black);
    _drawHand(canvas, size, currentDate.second, 60, 0.9, 1.0, Colors.red, true);

    for (int second = 0; second < 60; second++) {
      final double angle = -(second - 15) * 6 * (pi / 180);
      final double radius = size.width / 2 - 0.0;
      final Paint linePaint = Paint()
        ..color = Colors.black
        ..strokeWidth = 2.0;

      final Offset start =
          size.center(Offset.zero) + Offset(cos(angle) * radius, sin(angle) * -1 * radius);
      final Offset end = size.center(Offset.zero) +
          Offset(cos(angle) * (radius - 5.0), sin(angle) * -1 * (radius - 5.0));

      canvas.drawLine(start, end, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawHand(Canvas canvas, Size size, int currentValue, int max, double lengthScale,
      double width, Color color,
      [bool isSeconds = false]) {
    double angle = -(currentValue - 3) * 30 * (pi / 180);
    if (isSeconds) {
      angle = -(currentValue - 3) * 6 * (pi / 180);
    }
    final double radius = size.width / 2 - 16.0;
    final Paint handPaint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    final Offset center = size.center(Offset.zero);
    final Offset start = center + const Offset(0.0, -10.0);

    final Offset end =
        center + Offset(cos(angle) * radius * lengthScale, sin(angle) * -1 * radius * lengthScale);

    canvas.drawLine(start, end, handPaint);
  }
}
