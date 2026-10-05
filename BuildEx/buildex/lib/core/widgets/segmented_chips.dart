import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Segmented status selector: On Track (teal) / Delayed / Blocked.
// Only Divya edits.
class SegmentedStatus extends StatelessWidget {
  final List<String> options;
  final int selected;
  final ValueChanged<int>? onSelected;
  const SegmentedStatus({super.key, this.options = const ['On Track', 'Delayed', 'Blocked'], this.selected = 0, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < options.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: onSelected == null ? null : () => onSelected!(i),
              child: Container(
                margin: EdgeInsets.only(right: i == options.length - 1 ? 0 : 8),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: i == selected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: i == selected ? AppColors.primary : AppColors.textSecondary),
                ),
                child: Text(options[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: i == selected ? Colors.white : AppColors.textPrimary,
                    )),
              ),
            ),
          ),
      ],
    );
  }
}
