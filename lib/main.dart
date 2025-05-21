import 'package:flutter_advanced/exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WorkmanagerService().init();
  await FirebaseService().init();

  HomeWidgetService().init();

  await Future.wait(
    [
      // Alarm.init(),
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
      child: ChangeNotifierProvider(
        create: (_) => HomeController(),
        child: const HomeView(),
      ),
    );
  }
}
