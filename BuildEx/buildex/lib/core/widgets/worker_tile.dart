import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'status_badge.dart';

// Worker / crew / team row: avatar + name + role + presence badge / toggle.
// Only Divya edits.
class WorkerTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String badge;
  final Color badgeColor;
  final bool? present;
  final ValueChanged<bool>? onToggle;
  const WorkerTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.badge,
    this.badgeColor = AppColors.primary,
    this.present,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.15),
          child: Text(name.isEmpty ? '?' : name[0],
              style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        trailing: present == null
            ? StatusBadge(label: badge, color: badgeColor)
            : Switch(
                value: present!,
                activeThumbColor: AppColors.primary,
                onChanged: onToggle,
              ),
      ),
    );
  }
}
