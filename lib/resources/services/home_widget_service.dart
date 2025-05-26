import 'package:flutter_advanced/exports.dart';

class HomeWidgetService {
  HomeWidgetService._();

  static final HomeWidgetService _instance = HomeWidgetService._();

  factory HomeWidgetService() => _instance;

  Future<void> init() async {
    HomeWidget.saveWidgetData<String>('id', 'data');
    HomeWidget.updateWidget(
      name: 'HomeWidgetExampleProvider',
    );

    final path = await HomeWidget.renderFlutterWidget(
      const HomeWidgetCard(),
      key: 'homeWidgetCard',
      logicalSize: const Size(400, 400),
    );

    print('path: $path');
  }
}
