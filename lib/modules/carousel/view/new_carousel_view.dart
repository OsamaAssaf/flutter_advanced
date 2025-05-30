import 'package:flutter_advanced/exports.dart';

class NewCarouselView extends StatelessWidget {
  const NewCarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel View'),
      ),
      body: Center(
        child: CarouselView(
          itemExtent: double.infinity,
          children: List.generate(
            5,
            (int index) {
              return Card(
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withValues(alpha: 1.0),
                child: Center(
                  child: Text('$index'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
