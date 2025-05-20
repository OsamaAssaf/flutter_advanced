import 'package:flutter_advanced/exports.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final CameraViewController cameraViewController =
            Provider.of<CameraViewController>(context, listen: false);
        await cameraViewController.getCameras();
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final CameraViewController cameraViewController =
          Provider.of<CameraViewController>(context, listen: false);
      cameraViewController.cameraController.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, CameraViewController provider, _) {
        if (!provider.cameraController.value.isInitialized) {
          return Container();
        }
        return CameraPreview(provider.cameraController);
      },
    );
  }
}
