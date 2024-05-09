import 'dart:async';

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

  Future<void> requestLocationPermission() async {
    await Geolocator.requestPermission();
  }

  void stop() {
    calculateTotalDistance();
    tracker.cancel();
  }

  void locationTracking() {
    tracker = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 25,
      ),
    ).listen((event) {
      points.add(event);
      notifyListeners();
    });
  }

  double calculateTotalDistance() {
    for (var i = 0; i < points.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
          points[i].latitude, points[i].longitude, points[i + 1].latitude, points[i + 1].longitude);
    }
    notifyListeners();
    return totalDistance;
  }
}
