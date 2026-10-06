import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Standard white card, radius 8-12, padding 12-16. Only Divya edits.
class InfoCard extends StatelessWidget {
  final Widget child;
  const InfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(padding: const EdgeInsets.all(14), child: child),
    );
  }
}
