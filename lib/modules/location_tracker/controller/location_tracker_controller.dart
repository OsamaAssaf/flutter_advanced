import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationTrackerController extends ChangeNotifier {
  late StreamSubscription<Position> tracker;

  @override
  void dispose() {
    tracker.cancel();
    super.dispose();
  }

  Future<void> init() async {
    await requestLocationPermission();
    locationTracking();
  }

  List<Position> points = [];
  double totalDistance = 0.0;
  double totalBearingDistance = 0.0;

  Future<void> requestLocationPermission() async {
    await Geolocator.requestPermission();
  }

  void stop() {
    calculateTotalDistance();
    tracker.cancel();
  }

  void locationTracking() {
    late LocationSettings locationSettings;

    if (Platform.isAndroid) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 25,
        forceLocationManager: true,
        // intervalDuration: const Duration(seconds: 10),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: 'Running in Background',
          enableWakeLock: true,
        ),
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.automotiveNavigation,
        distanceFilter: 25,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: true,
        allowBackgroundLocationUpdates: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 25,
      );
    }
    tracker = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((event) {
      points.add(event);
      print('points.length: ${points.length}');
      notifyListeners();
    });
  }

  void calculateTotalDistance() {
    for (var i = 0; i < points.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
          points[i].latitude, points[i].longitude, points[i + 1].latitude, points[i + 1].longitude);
      totalBearingDistance += Geolocator.bearingBetween(
          points[i].latitude, points[i].longitude, points[i + 1].latitude, points[i + 1].longitude);
    }
    notifyListeners();
  }
}
