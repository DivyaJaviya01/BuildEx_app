import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Jainil. Figma: Daily Report Summary.
class DailyReportSummaryScreen extends StatelessWidget {
  static const route = '/report-summary';
  const DailyReportSummaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: compiled review card + submit (static, back to hub).
    return const Scaffold(appBar: BuildExAppBar(title: 'Daily Report Summary'), body: Center(child: Text('Daily Report Summary — TODO')));
  }
}
