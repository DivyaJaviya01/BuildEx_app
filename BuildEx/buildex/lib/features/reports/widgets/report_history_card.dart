import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';
import '../../../resources/widgets/status_badge.dart';

// Page-private: daily report history card (date + badge + 4-stat grid).
class ReportHistoryCard extends StatelessWidget {
  final String date;
  final String badge;
  final bool draft;
  final String progress;
  final String attendance;
  final String spent;
  final String issues;
  final bool issueAlert;
  final VoidCallback? onTap;
  const ReportHistoryCard({
    super.key,
    required this.date,
    required this.badge,
    this.draft = false,
    required this.progress,
    required this.attendance,
    required this.spent,
    required this.issues,
    this.issueAlert = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget stat(IconData icon, String text, {Color? color}) => Row(
          children: [
            Icon(icon, size: 14, color: color ?? AppColors.textSecondary),
            const SizedBox(width: 4),
            Expanded(
              child: Text(text,
                  style: TextStyle(fontSize: 12, color: color ?? AppColors.textPrimary)),
            ),
          ],
        );
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(date, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
                  StatusBadge(
                      label: badge,
                      color: draft ? const Color(0xFFB78A00) : AppColors.primary),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: stat(Icons.trending_up, 'Progress: $progress')),
                  Expanded(child: stat(Icons.people_outline, 'Attendance: $attendance')),
                  const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(child: stat(Icons.attach_money, 'Spent: $spent')),
                  Expanded(
                      child: stat(
                          issueAlert ? Icons.warning_amber_outlined : Icons.check_circle_outline,
                          'Issues: $issues',
                          color: issueAlert ? AppColors.danger : null)),
                  const SizedBox(width: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
