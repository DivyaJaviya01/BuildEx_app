import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Shared section header: title + optional trailing action (e.g. "View all").
// Only Divya edits.
class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? action;
  const SectionHeader({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        if (action case final a?) a,
      ],
    );
  }
}
