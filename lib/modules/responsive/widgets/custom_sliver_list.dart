import 'package:flutter_advanced/exports.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // width: double.infinity,
          height: 65.0,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: 16.0);
      },
    );
  }
}
