import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';

// Owner: Krisha. Figma: Add New Task.
class AddTaskScreen extends StatelessWidget {
  static const route = '/tasks/add';
  const AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: form only, submit returns to tasks (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Add New Task'), body: Center(child: Text('Add New Task — TODO')));
  }
}
