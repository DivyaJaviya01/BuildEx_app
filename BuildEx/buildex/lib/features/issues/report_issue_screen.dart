import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Jainil. Figma: Report Issue / Defect.
class ReportIssueScreen extends StatelessWidget {
  static const route = '/report-issue';
  const ReportIssueScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: title + severity (Low/Med/High/Critical) + description + photo + LOG ISSUE.
    return const Scaffold(appBar: BuildExAppBar(title: 'Report Issue'), body: Center(child: Text('Report Issue — TODO')));
  }
}
