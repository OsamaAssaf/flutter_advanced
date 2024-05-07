import 'package:alarm/alarm.dart';
import 'package:feedback/feedback.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/home/view/home_view.dart';

import 'resources/services/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService().init();

  await Future.wait(
    [
      Alarm.init(),
    ],
  );
  runApp(
    const BetterFeedback(
      localeOverride: Locale('ar'),
      themeMode: ThemeMode.dark,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          title: 'Flutter Advanced',
          debugShowCheckedModeBanner: false,
          theme: FlexThemeData.light(scheme: FlexScheme.orangeM3),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.orangeM3),
          themeMode: ThemeMode.light,
          home: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          ),
        );
      },
      child: const HomeView(),
    );
  }
}
