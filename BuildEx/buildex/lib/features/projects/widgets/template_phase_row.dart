import 'package:flutter/material.dart';
import '../../../resources/theme/app_colors.dart';

// Page-private: lifecycle template phase row (checkbox + 2-line text + red trash).
class TemplatePhaseRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool checked;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onDelete;
  const TemplatePhaseRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.checked = false,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final fg = checked ? AppColors.textPrimary : AppColors.textSecondary;
    return Card(
      color: checked ? AppColors.card : const Color(0xFFF4F6F6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: CheckboxListTile(
        value: checked,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: fg)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        secondary: IconButton(
          icon: const Icon(Icons.delete_outline, color: AppColors.danger),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
