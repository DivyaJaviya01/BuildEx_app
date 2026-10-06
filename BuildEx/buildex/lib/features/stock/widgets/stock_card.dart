import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';
import '../../../resources/widgets/status_badge.dart';

// Page-private: material stock card (name + badge + qty + colored bar).
class StockCard extends StatelessWidget {
  final String name;
  final String qty;
  final String? threshold;
  final String badge;
  final Color badgeColor;
  final double level;
  final Color barColor;
  const StockCard({
    super.key,
    required this.name,
    required this.qty,
    this.threshold,
    required this.badge,
    required this.badgeColor,
    required this.level,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
                StatusBadge(label: badge, color: badgeColor),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(qty, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                if (threshold != null)
                  Text('  ($threshold)', style: const TextStyle(fontSize: 12, color: AppColors.danger)),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: level,
              minHeight: 7,
              borderRadius: BorderRadius.circular(4),
              backgroundColor: const Color(0xFFE3E8E8),
              valueColor: AlwaysStoppedAnimation(barColor),
            ),
          ],
        ),
      ),
    );
  }
}
