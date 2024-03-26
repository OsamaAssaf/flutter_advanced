import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

class GetWidgetView extends StatelessWidget {
  const GetWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Widget'),
      ),
      body: Column(
        children: [
          GFAvatar(),
        ],
      ),
    );
  }
}
