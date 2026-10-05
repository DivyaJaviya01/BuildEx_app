import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Krisha. Figma: Issues & Defects Tracker.
class IssuesTrackerScreen extends StatelessWidget {
  static const route = '/issues';
  const IssuesTrackerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: snag cards list (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Issues Tracker'), body: Center(child: Text('Issues Tracker — TODO')));
  }
}
