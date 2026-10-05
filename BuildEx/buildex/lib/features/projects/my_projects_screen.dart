import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: My Projects.
class MyProjectsScreen extends StatelessWidget {
  static const route = '/projects';
  const MyProjectsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: project cards from MockData.projects + New Project + Analytics.
    return const Scaffold(
      appBar: BuildExAppBar(title: 'My Projects'),
      body: Center(child: Text('My Projects — TODO')),
    );
  }
}
