import 'package:flutter_advanced/exports.dart';

// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     print(
//         'Native called background task: $task'); //simpleTask will be emitted here.
//     return Future.value(true);
//   });
// }

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    int? totalExecutions;
    final sharedPreference =
        await SharedPreferences.getInstance(); //Initialize dependency

    try {
      //add code execution
      totalExecutions = sharedPreference.getInt('totalExecutions');
      sharedPreference.setInt(
          'totalExecutions', totalExecutions == null ? 1 : totalExecutions + 1);
      print('totalExecutions: $totalExecutions');
    } catch (err) {
      Logger().e(err
          .toString()); // Logger flutter package, prints error on the debug console
      print('errerr: $err');
      throw Exception(err);
    }

    return Future.value(true);
  });
}

class WorkmanagerService {
  WorkmanagerService._();

  static final WorkmanagerService _instance = WorkmanagerService._();

  factory WorkmanagerService() => _instance;

  void init() {
    Workmanager().initialize(
        callbackDispatcher, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
    // Workmanager().registerPeriodicTask(
    //   'task-identifier',
    //   'simpleTask',
    //   frequency: const Duration(seconds: 5),
    //   initialDelay: const Duration(seconds: 10),
    // );
    Workmanager().registerOneOffTask(
      'task-identifier',
      'simpleTask',
      initialDelay: const Duration(seconds: 20),
    );
  }
}
