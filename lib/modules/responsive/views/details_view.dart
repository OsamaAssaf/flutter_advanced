import 'package:flutter_advanced/exports.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ScaleText('Details'),
      ),
      body: Center(
        child: Text(
          '$number',
          style: const TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
