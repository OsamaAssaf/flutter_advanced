import 'package:flutter_advanced/exports.dart';

class AnalogClockController with ChangeNotifier {
  Timer? timer;

  DateTime currentTime = DateTime.now();

  final DateFormat timeFormat = DateFormat('hh:mm:ss a');

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime = DateTime.now();
      notifyListeners();
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }
}
