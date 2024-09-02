import 'package:flutter/material.dart';

import 'points_painter.dart';
import 'shape_painter.dart';

class PhotoWithCustomShape extends StatefulWidget {
  const PhotoWithCustomShape({super.key});

  @override
  PhotoWithCustomShapeState createState() => PhotoWithCustomShapeState();
}

class PhotoWithCustomShapeState extends State<PhotoWithCustomShape> {
  List<Offset> shapePoints = [];
  List<Offset> selectedPoints = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          shapePoints.add(details.localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) {
        setState(() {
          selectedPoints = getPointsInsideShape(shapePoints);
        });

        print('selectedPoints: $selectedPoints');
      },
      child: Stack(
        children: [
          Image.asset('assets/images/car.jpg'),
          CustomPaint(
            painter: ShapePainter(points: shapePoints),
          ),
          CustomPaint(
            painter: PointsPainter(points: selectedPoints),
          ),
        ],
      ),
    );
  }

  List<Offset> getPointsInsideShape(List<Offset> shapePoints) {
    final List<Offset> insidePoints = [];
    // Example: Generate some random points to test
    final List<Offset> testPoints = generateTestPoints();

    for (final Offset point in testPoints) {
      if (isPointInPolygon(point, shapePoints)) {
        insidePoints.add(point);
      }
    }
    return insidePoints;
  }

  bool isPointInPolygon(Offset point, List<Offset> polygon) {
    int intersectCount = 0;
    for (int i = 0; i < polygon.length; i++) {
      final Offset p1 = polygon[i];
      final Offset p2 = polygon[(i + 1) % polygon.length];

      if ((p1.dy > point.dy) != (p2.dy > point.dy) &&
          point.dx < (p2.dx - p1.dx) * (point.dy - p1.dy) / (p2.dy - p1.dy) + p1.dx) {
        intersectCount++;
      }
    }
    return intersectCount % 2 == 1;
  }

  List<Offset> generateTestPoints() {
    // Generate some random points for testing
    // Replace this with your actual points
    final List<Offset> points = [];
    for (double x = 0; x < 400; x += 10) {
      for (double y = 0; y < 400; y += 10) {
        points.add(Offset(x, y));
      }
    }
    return points;
  }
}
