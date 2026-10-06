import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';

// Page-private: phase progress row (label + % + colored bar, selected border).
class PhaseProgressRow extends StatelessWidget {
  final String name;
  final double progress;
  final String status;
  final Color color;
  final bool selected;
  const PhaseProgressRow({
    super.key,
    required this.name,
    required this.progress,
    required this.status,
    required this.color,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        border: selected ? const Border(left: BorderSide(color: AppColors.primary, width: 4)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
              Text('${(progress * 100).round()}%',
                  style: TextStyle(fontWeight: FontWeight.w700, color: progress == 0 ? AppColors.textSecondary : color)),
            ],
          ),
          const SizedBox(height: 4),
          Text(status, style: TextStyle(fontSize: 12, color: progress == 0 ? AppColors.textSecondary : color)),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ],
      ),
    );
  }
}
