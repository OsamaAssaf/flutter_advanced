import 'package:flutter_advanced/exports.dart';

class ShapePainter extends CustomPainter {
  final List<Offset> points;

  ShapePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    if (points.isNotEmpty) {
      final Path path = Path()..moveTo(points.first.dx, points.first.dy);
      for (final Offset point in points) {
        path.lineTo(point.dx, point.dy);
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
