import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Teal progress ring with centered % label (dashboard, phase progress).
// Only Divya edits.
class ProgressRing extends StatelessWidget {
  final double progress; // 0.0 - 1.0
  final double size;
  const ProgressRing({super.key, required this.progress, this.size = 84});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 9,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15),
            valueColor: const AlwaysStoppedAnimation(AppColors.primary),
          ),
          Text('${(progress * 100).round()}%',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}
