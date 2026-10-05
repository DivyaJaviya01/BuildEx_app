import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Krisha. Figma: Phase Checklist.
class PhaseChecklistScreen extends StatelessWidget {
  static const route = '/checklist';
  const PhaseChecklistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: collapsible nested checklist (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Phase Checklist'), body: Center(child: Text('Phase Checklist — TODO')));
  }
}
