import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'info_card.dart';

// Triple stat card (TOTAL / PRESENT / ABSENT, costs, attendance mini-stats).
// Only Divya edits.
class StatTriple extends StatelessWidget {
  final List<({String label, String value, Color color})> stats;
  const StatTriple({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final s in stats)
          Expanded(
            child: InfoCard(
              child: Column(
                children: [
                  Text(s.label,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(s.value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: s.color)),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
