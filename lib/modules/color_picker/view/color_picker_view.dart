import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../../resources/widgets/scale_text.dart';
import '../controller/color_picker_controller.dart';

class ColorPickerView extends StatelessWidget {
  const ColorPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ColorPickerController provider, _) {
        return Scaffold(
          backgroundColor: provider.currentColor,
          appBar: AppBar(
            title: const ScaleText('Color Picker'),
          ),
          body: Center(
            child: ColorPicker(
              pickerColor: provider.currentColor,
              onColorChanged: (Color value) {
                provider.setCurrentColor = value;
              },
            ),
          ),
        );
      },
    );
  }
}
