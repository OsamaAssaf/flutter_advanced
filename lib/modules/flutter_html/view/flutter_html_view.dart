import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FlutterHtmlView extends StatelessWidget {
  const FlutterHtmlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter HTML'),
      ),
      body: const HtmlWidget(
        '''
            <h3>Heading</h3>
            <p>
              A paragraph with <strong>strong</strong>, <em>emphasized</em>
              and <span style="color: red">colored</span> text.
            </p>
              ''',
      ),
    );
  }
}
