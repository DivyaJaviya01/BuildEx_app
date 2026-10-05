import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Shared teal app bar, 56px. Only Divya edits.
class BuildExAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const BuildExAppBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      title: Text(title),
      actions: actions,
    );
  }
}
