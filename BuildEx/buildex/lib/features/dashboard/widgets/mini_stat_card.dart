import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';

// Page-private: mini stat card with colored left border (dashboard only).
class MiniStatCard extends StatelessWidget {
  final String label;
  final String value;
  final String note;
  final Color accent;
  const MiniStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.note,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border(left: BorderSide(color: accent, width: 4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            Text(note, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: accent)),
          ],
        ),
      ),
    );
  }
}
