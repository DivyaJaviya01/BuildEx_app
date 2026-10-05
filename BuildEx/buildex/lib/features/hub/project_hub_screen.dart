import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Project Hub (contractor action grid + SUBMIT DAILY REPORT).
class ProjectHubScreen extends StatelessWidget {
  static const route = '/hub';
  const ProjectHubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: progress header + 2-col grid (Progress, Photos, Attendance, Material) + issue card.
    return const Scaffold(
      appBar: BuildExAppBar(title: 'Project Hub'),
      body: Center(child: Text('Project Hub — TODO')),
    );
  }
}
