import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';
import '../../../resources/widgets/status_badge.dart';

// Page-private: project card (My Projects only).
// Promote to resources/widgets only if a second screen reuses it.
class ProjectCard extends StatelessWidget {
  final String name;
  final String location;
  final String badge;
  final String report;
  final double progress;
  final bool warning;
  final VoidCallback? onTap;
  const ProjectCard({
    super.key,
    required this.name,
    required this.location,
    required this.badge,
    required this.report,
    required this.progress,
    this.warning = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final badgeColor = badge == 'ACTIVE' ? const Color(0xFF0C6B6D) : const Color(0xFFB78A00);
    final boxColor = warning ? AppColors.danger : (progress >= 0.8 ? AppColors.primary : AppColors.textSecondary);
    return Card(
      color: AppColors.card,
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
                  StatusBadge(label: badge, color: badgeColor),
                  const Spacer(),
                  const Icon(Icons.bar_chart_outlined, size: 20, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  const Icon(Icons.more_vert, size: 20, color: AppColors.textSecondary),
                ],
              ),
              const SizedBox(height: 8),
              Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(location, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
              const Divider(height: 24, thickness: 1, color: Color(0xFFE3E8E8)),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("TODAY'S REPORT",
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                      if (report.isNotEmpty) Text(report, style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: boxColor.withValues(alpha: 0.5), width: 1.5),
                    ),
                    child: warning
                        ? const Icon(Icons.warning_amber_outlined, color: AppColors.danger)
                        : Text('${(progress * 100).round()}%',
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
