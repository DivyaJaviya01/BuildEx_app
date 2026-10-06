import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';

// Owner: Krisha. Figma: My Tasks.
class MyTasksScreen extends StatelessWidget {
  static const route = '/tasks';
  const MyTasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: task cards from MockData.tasks + status badges.
    return const Scaffold(appBar: BuildExAppBar(title: 'My Tasks'), body: Center(child: Text('My Tasks — TODO')));
  }
}
