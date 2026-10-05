import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Project Dashboard (builder hub).
class ProjectDashboardScreen extends StatelessWidget {
  static const route = '/dashboard';
  const ProjectDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: completion %, low-stock flags, snag cards, VIEW DAILY REPORT DETAILS.
    return const Scaffold(
      appBar: BuildExAppBar(title: 'Project Dashboard'),
      body: Center(child: Text('Project Dashboard — TODO')),
    );
  }
}
