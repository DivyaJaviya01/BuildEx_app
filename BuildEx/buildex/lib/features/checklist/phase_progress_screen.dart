import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/progress_ring.dart';
import 'widgets/phase_progress_row.dart';

// Owner: Divya. Figma: Phase Progress.png (-1 variant is identical + tab bar).
class PhaseProgressScreen extends StatelessWidget {
  static const route = '/phase-progress';
  const PhaseProgressScreen({super.key});

  static const _phases = [
    ('Phase 1: Substructure', 1.0, 'Completed', Color(0xFF388E3C), false),
    ('Phase 2: Digging & Base', 0.75, 'Completed', Color(0xFF0C6B6D), true),
    ('Phase 3: Superstructure', 0.20, 'In Progress', Color(0xFFF57C00), false),
    ('Phase 4: Interior & Finishing', 0.0, 'Not Started', Color(0xFF9E9E9E), false),
    ('Phase 5: Handover', 0.0, 'Not Started', Color(0xFF9E9E9E), false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Phase Progress',
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const InfoCard(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Overall Progress', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      Text('48%', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.primary)),
                      SizedBox(height: 8),
                      Text('Est. Completion:', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      Chip(label: Text('Oct 25, 2026', style: TextStyle(fontSize: 12))),
                    ],
                  ),
                ),
                ProgressRing(progress: 0.48, color: AppColors.accent),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Detailed Phases', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          for (final p in _phases)
            PhaseProgressRow(
              name: p.$1,
              progress: p.$2.toDouble(),
              status: p.$3,
              color: p.$4,
              selected: p.$5,
            ),
        ],
      ),
      bottomNavigationBar: const BuildExBottomNav(currentIndex: 0),
    );
  }
}
