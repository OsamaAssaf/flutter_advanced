import 'package:flutter_advanced/exports.dart';

class ResponsiveHomeBody extends StatelessWidget {
  const ResponsiveHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          CustomSliverGrid(),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          CustomSliverList(),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
        ],
      ),
    );
  }
}
