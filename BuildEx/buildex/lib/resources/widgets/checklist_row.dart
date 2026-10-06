import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Checklist row: checkbox + title + subtitle + edit icon (phases, tasks).
// Only Divya edits.
class ChecklistRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool checked;
  final ValueChanged<bool?>? onChanged;
  const ChecklistRow({super.key, required this.title, this.subtitle, this.checked = false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: CheckboxListTile(
        value: checked,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              decoration: checked ? TextDecoration.lineThrough : null,
            )),
        subtitle: subtitle == null
            ? null
            : Text(subtitle!, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        secondary: const Icon(Icons.edit_outlined, color: AppColors.textSecondary),
      ),
    );
  }
}
