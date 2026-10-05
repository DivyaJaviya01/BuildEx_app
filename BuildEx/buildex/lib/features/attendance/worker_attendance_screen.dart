import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Jainil. Figma: Worker Attendance.
class WorkerAttendanceScreen extends StatelessWidget {
  static const route = '/attendance';
  const WorkerAttendanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: TOTAL/PRESENT/ABSENT cards + search + roll call from MockData.workers + SAVE ATTENDANCE.
    return const Scaffold(appBar: BuildExAppBar(title: 'Worker Attendance'), body: Center(child: Text('Worker Attendance — TODO')));
  }
}
