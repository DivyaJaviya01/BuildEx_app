import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Single-select filter chips (All / Open / Resolved / This Week ...).
// Only Divya edits.
class FilterChips extends StatelessWidget {
  final List<String> options;
  final int selected;
  final ValueChanged<int>? onSelected;
  const FilterChips({super.key, required this.options, this.selected = 0, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < options.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(options[i]),
                selected: i == selected,
                onSelected: onSelected == null ? null : (_) => onSelected!(i),
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: i == selected ? Colors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
