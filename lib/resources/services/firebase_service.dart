import 'package:flutter_advanced/exports.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();

  factory FirebaseService() => _instance;

  late String homeTitle;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _initRemote();
    await _initFirebaseAI();
  }

  Future<void> _initRemote() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );
    await _setRemoteDefaults();
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    await _getRemoteValues();
  }

  Future<void> _setRemoteDefaults() async {
    await FirebaseRemoteConfig.instance.setDefaults(
      const {
        'home_title': 'Home',
      },
    );
  }

  Future<void> _getRemoteValues() async {
    homeTitle = FirebaseRemoteConfig.instance.getString('home_title');
  }

  late GenerativeModel model;
  Future<void> _initFirebaseAI() async {
    // Initialize the Gemini Developer API backend service
    // Create a `GenerativeModel` instance with a model that supports your use case
    model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.0-flash');
  }

  Future<String?> sendPrompt(String userPrompt) async {
    // Provide a prompt that contains text
    final List<Content> prompt = [Content.text(userPrompt)];

    // To generate text output, call generateContent with the text input
    final GenerateContentResponse response =
        await model.generateContent(prompt);
    print(response.text);

    return response.text;
  }
}
