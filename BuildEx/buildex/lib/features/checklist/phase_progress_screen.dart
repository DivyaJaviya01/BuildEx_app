import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Krisha. Figma: Phase Progress.
class PhaseProgressScreen extends StatelessWidget {
  static const route = '/phase-progress';
  const PhaseProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: per-phase % breakdown (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Phase Progress'), body: Center(child: Text('Phase Progress — TODO')));
  }
}
