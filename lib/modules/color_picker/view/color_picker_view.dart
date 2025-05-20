import 'package:flutter_advanced/exports.dart';

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
