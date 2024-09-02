import 'package:flutter/material.dart';

import 'circle_painter.dart';

class PhotoWithCircle extends StatefulWidget {
  const PhotoWithCircle({super.key});

  @override
  PhotoWithCircleState createState() => PhotoWithCircleState();
}

class PhotoWithCircleState extends State<PhotoWithCircle> {
  Offset _position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _position = details.localPosition;
        });
        print('details.localPosition: ${details.localPosition}');
      },
      child: Stack(
        children: [
          Image.asset('assets/images/car.jpg'),
          CustomPaint(
            painter: CirclePainter(position: _position),
          ),
        ],
      ),
    );
  }
}
