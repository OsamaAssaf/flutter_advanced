import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../firebase_options.dart';

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
}
