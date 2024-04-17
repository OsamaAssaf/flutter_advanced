import 'package:flutter/material.dart';
import 'package:flutter_advanced/modules/time_ago/controller/time_ago_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgoView extends StatefulWidget {
  const TimeAgoView({super.key});

  @override
  State<TimeAgoView> createState() => _TimeAgoViewState();
}

class _TimeAgoViewState extends State<TimeAgoView> {
  final TimeAgoController _timeAgoController = TimeAgoController();

  @override
  void initState() {
    _timeAgoController.setTimeLocale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Ago'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  timeago.format(
                    DateTime.now().subtract(
                      const Duration(days: 15),
                    ),
                    locale: 'ar',
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  timeago.format(
                    DateTime.now().add(
                      const Duration(days: 15),
                    ),
                    allowFromNow: true,
                    locale: 'ar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
