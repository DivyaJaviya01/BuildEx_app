import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: M2. Figma: Daily Progress.
class DailyProgressScreen extends StatelessWidget {
  static const route = '/daily-progress';
  const DailyProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: notes area + char counter + On Track/Delayed/Blocked + SAVE NOTES.
    return const Scaffold(appBar: BuildExAppBar(title: 'Daily Progress'), body: Center(child: Text('Daily Progress — TODO')));
  }
}
