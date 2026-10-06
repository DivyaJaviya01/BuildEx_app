import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Primary yellow CTA, full-width 48-52px. Only Divya edits.
class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? background;
  final Color? foreground;
  final VoidCallback? onPressed;
  const PrimaryButton({super.key, required this.label, this.icon, this.background, this.foreground, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background ?? AppColors.accent,
          foregroundColor: foreground ?? AppColors.textPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
