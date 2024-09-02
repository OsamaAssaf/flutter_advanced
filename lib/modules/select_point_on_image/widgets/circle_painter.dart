import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Offset position;
  final double radius;

  CirclePainter({required this.position, this.radius = 20});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    if (position != Offset.zero) {
      canvas.drawCircle(position, radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
