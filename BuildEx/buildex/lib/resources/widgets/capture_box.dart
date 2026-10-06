import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Dashed capture/upload box: Site Photos "Tap to Capture", Report Issue upload.
// Only Divya edits.
class CaptureBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const CaptureBox({super.key, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
        ),
        child: Column(
          children: [
            const Icon(Icons.photo_camera_outlined, size: 36, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
