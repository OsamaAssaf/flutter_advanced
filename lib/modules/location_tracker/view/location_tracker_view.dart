import 'package:flutter_advanced/exports.dart';

class LocationTrackerView extends StatefulWidget {
  const LocationTrackerView({super.key});

  @override
  State<LocationTrackerView> createState() => _LocationTrackerViewState();
}

class _LocationTrackerViewState extends State<LocationTrackerView> {
  late LocationTrackerController locationTrackerController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locationTrackerController =
          Provider.of<LocationTrackerController>(context, listen: false);
      locationTrackerController.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<LocationTrackerController>(context, listen: false)
                  .stop();
            },
            icon: const Icon(Icons.stop_circle_outlined),
          ),
        ],
      ),
      body: Consumer<LocationTrackerController>(
        builder: (BuildContext context, LocationTrackerController provider, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Distance: ${provider.totalDistance}'),
                  Text(
                      'Total Bearing Distance: ${provider.totalBearingDistance}'),
                  Expanded(
                    child: ListView.separated(
                      itemCount: provider.points.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Position position =
                            provider.points.elementAt(index);
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('latitude: ${position.latitude}'),
                              const SizedBox(width: 16.0),
                              Text('longitude: ${position.longitude}'),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const Divider();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
