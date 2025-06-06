import 'package:flutter_advanced/exports.dart';

class ScaleText extends StatelessWidget {
  const ScaleText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
    );
  }
}

mixin ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final double width = MediaQuery.of(context).size.width;
    final double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
