import 'package:flutter_advanced/exports.dart';

class GetWidgetView extends StatelessWidget {
  const GetWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: const Text('Get Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GFSearchBar(
              searchList: const [
                'One',
                'Two',
                'Three',
                'Four',
              ],
              overlaySearchListItemBuilder: (String? value) {
                return Text(value!);
              },
              searchQueryBuilder: (String? value, List<String> values) {
                return values;
              },
            ),
            const GFAccordion(
              title: 'Title',
              content: 'Content',
            ),
            const GFAlert(),
            const GFAppBarTitleBar(
              child: Text('GFAppBarTitleBar'),
            ),
            GFButton(
              child: const Text('Button'),
              onPressed: () {},
            ),
            GFButtonBadge(
              onPressed: () {},
              text: 'GFButtonBadge',
            ),
            const GFLoader(
              type: GFLoaderType.ios,
            ),
            GFMultiSelect(
              items: const [
                'One',
                'Two',
                'Three',
                'Four',
              ],
              onSelect: (values) {},
            ),
          ],
        ),
      ),
    );
  }
}
