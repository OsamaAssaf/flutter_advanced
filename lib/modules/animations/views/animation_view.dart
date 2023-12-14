import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationView extends StatelessWidget {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Animate(
          effects: const [
            FadeEffect(),
            ScaleEffect(),
          ],
          autoPlay: true,
          delay: const Duration(seconds: 1),
          onPlay: (AnimationController controller) {
            controller.repeat();
          },
          child: const Text("Hello World!"),
        ),
      ),
    );
  }
}
