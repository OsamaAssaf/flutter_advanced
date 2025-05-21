import 'package:flutter_advanced/exports.dart';

class FirebaseAiController with ChangeNotifier {
  String? result;
  bool isLoading = false;

  void sendPrompt(String promptText) async {
    if (promptText.isEmpty) return;

    isLoading = true;
    result = null;
    notifyListeners();

    try {
      final response = await FirebaseService().sendPrompt(promptText);
      result = response ?? 'No response';
    } catch (e) {
      print('Error: $e');
      result = 'Error: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
