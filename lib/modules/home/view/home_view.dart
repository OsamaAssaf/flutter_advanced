import 'dart:developer' as dev;

import 'package:flutter_advanced/exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = HomeController();
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setAsset(
        'assets/sounds/alarm.mp3',
      );
      // Timer(const Duration(seconds: 2), () {
      //   Provider.of<HomeController>(context, listen: false).setIsLoading = false;
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<FilledButton> buttons = [
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const GetWidgetView(),
            ),
          );
        },
        child: const ScaleText(
          'Get Widget',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ResponsiveHome(),
            ),
          );
        },
        child: const ScaleText(
          'Responsive',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => AnalogClockController(),
                child: const AnalogClockView(),
              ),
            ),
          );
        },
        child: const ScaleText(
          'Analog Clock',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => BatteryLevelController(),
                child: const BatteryLevelView(),
              ),
            ),
          );
        },
        child: const ScaleText('Battery Level'),
      ),
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => CameraViewController(),
                child: const CameraView(),
              ),
            ),
          );
        },
        child: const ScaleText('Camera'),
      ),
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ColorPickerController(),
                child: const ColorPickerView(),
              ),
            ),
          );
        },
        child: const ScaleText('Color Picker'),
      ),
      FilledButton(
        onPressed: () {
          BetterFeedback.of(context).show(
            (UserFeedback feedback) {
              dev.log(feedback.text);
              dev.log(feedback.extra.toString());
              dev.log(feedback.screenshot.toString());
            },
          );
        },
        child: const ScaleText('Feedback'),
      ),
      FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AnimationView(),
            ),
          );
        },
        child: const ScaleText('Animation'),
      ),
      FilledButton(
        onPressed: () async {
          // final AlarmSettings alarmSettings = AlarmSettings(
          //   id: 42,
          //   dateTime: DateTime.now().add(const Duration(seconds: 10)),
          //   assetAudioPath: 'assets/sounds/alarm.mp3',
          //   notificationSettings: const NotificationSettings(
          //     title: 'This is the title',
          //     body: 'This is the body',
          //   ),
          //   volumeSettings: VolumeSettings.fade(
          //     fadeDuration: const Duration(seconds: 3),
          //   ),
          // );
          // await Alarm.set(alarmSettings: alarmSettings);
        },
        child: const ScaleText('Alarm'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => OcrScannerController(),
                child: const OcrScannerView(),
              ),
            ),
          );
        },
        child: const ScaleText('OCR Scanner'),
      ),
      FilledButton(
        onPressed: () async {
          if (player.playing) {
            player.stop();
          } else {
            player.play();
          }
        },
        child: const ScaleText('Just Audio'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ModelViewerController(),
                child: const ModelViewerView(),
              ),
            ),
          );
        },
        child: const ScaleText('Model Viewer'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const LinkPreviewView(),
            ),
          );
        },
        child: const ScaleText('Link Preview'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const WebView(),
            ),
          );
        },
        child: const ScaleText('WEB View'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const FieldFormatView(),
            ),
          );
        },
        child: const ScaleText('Field Format'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TimeAgoView(),
            ),
          );
        },
        child: const ScaleText('Time Ago'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const FlutterHtmlView(),
            ),
          );
        },
        child: const ScaleText('Flutter HTML'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AuthUiView(),
            ),
          );
        },
        child: const ScaleText('Firebase Auth UI'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => LocationTrackerController(),
                child: const LocationTrackerView(),
              ),
            ),
          );
        },
        child: const ScaleText('Location Tracker'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => NewCarouselController(),
                child: const NewCarouselView(),
              ),
            ),
          );
        },
        child: const ScaleText('Carousel View'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => SelectPointOnImageController(),
                child: const SelectPointOnImageView(),
              ),
            ),
          );
        },
        child: const ScaleText('Select point on image'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SelectPointOnImageView(),
            ),
          );
        },
        child: const ScaleText('Flutter Bloc'),
      ),
      FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SelectPointOnImageView(),
            ),
          );
        },
        child: const ScaleText('Home Widget'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: ScaleText(
          FirebaseService().homeTitle,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // double distance =
              //     Geolocator.distanceBetween(32.029165, 35.872028, 32.030193, 35.874525);
            },
            icon: const Icon(Icons.location_searching),
          ),
        ],
      ),
      body: Center(
        child: IntrinsicWidth(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.spaceEvenly,
              children: buttons.map((e) {
                return FractionallySizedBox(
                  widthFactor: 0.4,
                  child: e,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
