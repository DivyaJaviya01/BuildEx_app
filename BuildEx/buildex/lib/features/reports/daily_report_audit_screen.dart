import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: M2. Figma: Daily Report Audit.
class DailyReportAuditScreen extends StatelessWidget {
  static const route = '/report-audit';
  const DailyReportAuditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: audit detail + approve (static, back to dashboard).
    return const Scaffold(appBar: BuildExAppBar(title: 'Daily Report Audit'), body: Center(child: Text('Daily Report Audit — TODO')));
  }
}
