import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraViewController with ChangeNotifier {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  Future<void> getCameras() async {
    cameras = await availableCameras();
    cameraController =
        CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      notifyListeners();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    },);
  }
}
