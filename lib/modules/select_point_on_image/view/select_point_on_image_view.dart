import 'package:flutter/material.dart';

import '../widgets/photo_with_custom_shape.dart';

class SelectPointOnImageView extends StatelessWidget {
  const SelectPointOnImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Point On Image'),
      ),
      body: const Center(
        child: PhotoWithCustomShape(),
      ),
    );
  }
}
