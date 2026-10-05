import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Daily Reports History.
class DailyReportsHistoryScreen extends StatelessWidget {
  static const route = '/reports-history';
  const DailyReportsHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: static history list.
    return const Scaffold(appBar: BuildExAppBar(title: 'Daily Reports History'), body: Center(child: Text('Daily Reports History — TODO')));
  }
}
