import 'package:flutter/material.dart';
import 'package:flutter_advanced/modules/select_point_on_image/wdigets/shape_painter.dart';

class PhotoWithCustomShape extends StatefulWidget {
  const PhotoWithCustomShape({super.key});

  @override
  PhotoWithCustomShapeState createState() => PhotoWithCustomShapeState();
}

class PhotoWithCustomShapeState extends State<PhotoWithCustomShape> {
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        print('details.localPosition: ${details.localPosition}');
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        // Trigger action on shape completion, if needed
        setState(() {
          points.clear();
        });
      },
      child: Stack(
        children: [
          Image.asset('assets/images/car.jpg'),
          CustomPaint(
            painter: ShapePainter(points: points),
          ),
        ],
      ),
    );
  }
}
