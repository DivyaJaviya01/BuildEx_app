import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';

// Page-private: daily summary check row (dashboard only).
class SummaryRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool done;
  final bool alert;
  const SummaryRow({super.key, required this.title, required this.subtitle, this.done = false, this.alert = false});

  @override
  Widget build(BuildContext context) {
    final box = alert ? AppColors.danger : AppColors.primary;
    final fg = alert ? AppColors.danger : AppColors.textPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: done ? box : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: box, width: 2),
            ),
            child: done ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: fg)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
