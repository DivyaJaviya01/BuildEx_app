import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';

// Page-private: issue tracker card (severity + status badges, chevron).
class IssueCard extends StatelessWidget {
  final String severity;
  final Color severityColor;
  final String status;
  final String title;
  final String reported;
  final String description;
  final bool resolved;
  final VoidCallback? onTap;
  const IssueCard({
    super.key,
    required this.severity,
    required this.severityColor,
    required this.status,
    required this.title,
    required this.reported,
    required this.description,
    this.resolved = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dim = resolved ? AppColors.textSecondary : AppColors.textPrimary;
    return Card(
      color: resolved ? const Color(0xFFF4F6F6) : AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Pill(label: severity, color: severityColor, filled: true),
                  const SizedBox(width: 8),
                  _Pill(label: status, color: resolved ? const Color(0xFF388E3C) : AppColors.textSecondary, filled: false),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: dim,
                            decoration: resolved ? TextDecoration.lineThrough : null)),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                ],
              ),
              Text(reported, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              const SizedBox(height: 6),
              Text(description, style: TextStyle(fontSize: 13, color: dim)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color color;
  final bool filled;
  const _Pill({required this.label, required this.color, required this.filled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: filled ? color.withValues(alpha: 0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: filled ? null : Border.all(color: color),
      ),
      child: Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color)),
    );
  }
}
