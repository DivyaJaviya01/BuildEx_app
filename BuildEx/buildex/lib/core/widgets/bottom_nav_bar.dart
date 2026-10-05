import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Shared cream bottom tab bar: Projects | Tasks | Team | Profile.
// Figma BottomNavBar.png — cream bg, active item gets dark-teal pill.
// Only Divya edits. Screens pass their index + onTap (navigation wired later).
class BuildExBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  const BuildExBottomNav({super.key, this.currentIndex = 0, this.onTap});

  static const _items = [
    (Icons.folder_outlined, 'Projects'),
    (Icons.checklist_outlined, 'Tasks'),
    (Icons.groups_outlined, 'Team'),
    (Icons.person_outline, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navBg,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < _items.length; i++)
            GestureDetector(
              onTap: onTap == null ? null : () => onTap!(i),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: i == currentIndex ? AppColors.primaryDark : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _items[i].$1,
                      color: i == currentIndex ? Colors.white : AppColors.navInactive,
                      size: 22,
                    ),
                    Text(
                      _items[i].$2,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: i == currentIndex ? Colors.white : AppColors.navInactive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
