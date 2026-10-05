import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Krisha. Figma: Task Details.
class TaskDetailScreen extends StatelessWidget {
  static const route = '/tasks/detail';
  const TaskDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: static detail + progress.
    return const Scaffold(appBar: BuildExAppBar(title: 'Task Details'), body: Center(child: Text('Task Details — TODO')));
  }
}
