import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: const Text('Analog Clock'),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, AnalogClockController provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(provider.timeFormat.format(provider.currentTime)),
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
                  }),
                  // padding: const EdgeInsets.all(4.0),
                  // child: LayoutBuilder(
                  //   builder: (BuildContext context, BoxConstraints constraints) {
                  //     return Stack(
                  //       children: [
                  //         for (int i = 1; i <= 12; i++)
                  //           Builder(
                  //             builder: (context) {
                  //               double angle = (i * pi / 6) - pi / 2;
                  //               double x = 240 * cos(angle);
                  //               double y = 240 * sin(angle);
                  //               return Positioned(
                  //                 top: x,
                  //                 left: y,
                  //                 // alignment: Alignment(x, y),
                  //                 child: Text(
                  //                   i.toString(),
                  //                   style: const TextStyle(
                  //                     fontSize: 20.0,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               );
                  //               return Positioned(
                  //                 top: constraints.maxWidth / 2.0 -
                  //                     15.0 +
                  //                     80.0 * cos(-pi / 2 + 2 * pi / 12 * (i - 1)),
                  //                 left: constraints.maxWidth / 2.0 -
                  //                     15.0 +
                  //                     80.0 * sin(-pi / 2 + 2 * pi / 12 * (i - 1)),
                  //                 child: Text(
                  //                   i.toString(),
                  //                   style: const TextStyle(
                  //                     fontSize: 20.0,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //
                  //         // Align(
                  //         //   alignment: Alignment(0.7, -0.70),
                  //         //   child: Text('1'),
                  //         // ),
                  //         // Align(
                  //         //   alignment: Alignment(0.9, -0.30),
                  //         //   child: Text('2'),
                  //         // ),
                  //         // Align(
                  //         //   alignment: Alignment.centerRight,
                  //         //   child: Text('3'),
                  //         // ),
                  //         // Align(
                  //         //   alignment: Alignment.bottomCenter,
                  //         //   child: Text('6'),
                  //         // ),
                  //         // Align(
                  //         //   alignment: Alignment.centerLeft,
                  //         //   child: Text('9'),
                  //         // ),
                  //         // Align(
                  //         //   alignment: Alignment.topCenter,
                  //         //   child: Text('12'),
                  //         // ),
                  //       ],
                  //     );
                  //   },
                  // ),
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
