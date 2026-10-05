import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Jainil. Figma: Attendance History.
class AttendanceHistoryScreen extends StatelessWidget {
  static const route = '/attendance/history';
  const AttendanceHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: static history list (from MockData).
    return const Scaffold(appBar: BuildExAppBar(title: 'Attendance History'), body: Center(child: Text('Attendance History — TODO')));
  }
}
