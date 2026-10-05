import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Issue Detail.
class IssueDetailScreen extends StatelessWidget {
  static const route = '/issues/detail';
  const IssueDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: photo + status + resolve/close (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Issue Detail'), body: Center(child: Text('Issue Detail — TODO')));
  }
}
