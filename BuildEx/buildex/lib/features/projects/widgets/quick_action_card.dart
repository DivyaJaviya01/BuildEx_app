import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';

// Page-private: yellow/white quick-action card (New Project / Analytics).
class QuickActionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool highlighted;
  final VoidCallback? onTap;
  const QuickActionCard({
    super.key,
    required this.label,
    required this.icon,
    this.highlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = highlighted ? AppColors.accent : AppColors.card;
    final fg = highlighted ? AppColors.textPrimary : AppColors.primary;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: highlighted ? AppColors.textPrimary.withValues(alpha: 0.15) : AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: fg),
              ),
              const SizedBox(height: 10),
              Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: fg)),
            ],
          ),
        ),
      ),
    );
  }
}
