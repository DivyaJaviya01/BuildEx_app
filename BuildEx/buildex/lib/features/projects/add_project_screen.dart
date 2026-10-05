import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Add New Project.
class AddProjectScreen extends StatelessWidget {
  static const route = '/projects/add';
  const AddProjectScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: form only, submit returns to My Projects (static).
    return const Scaffold(
      appBar: BuildExAppBar(title: 'Add New Project'),
      body: Center(child: Text('Add New Project — TODO')),
    );
  }
}
