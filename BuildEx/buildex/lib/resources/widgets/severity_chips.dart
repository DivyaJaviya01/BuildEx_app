import 'package:flutter/material.dart';

// Severity grid: Low (green) / Medium (yellow) / High (orange) / Critical (red).
// Only Divya edits.
class SeverityChips extends StatelessWidget {
  final int selected;
  final ValueChanged<int>? onSelected;
  const SeverityChips({super.key, this.selected = 0, this.onSelected});

  static const _items = [
    ('Low', Color(0xFF388E3C)),
    ('Medium', Color(0xFFFBC02D)),
    ('High', Color(0xFFF57C00)),
    ('Critical', Color(0xFFD32F2F)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 3.4,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < _items.length; i++)
          GestureDetector(
            onTap: onSelected == null ? null : () => onSelected!(i),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: i == selected ? _items[i].$2.withValues(alpha: 0.18) : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _items[i].$2, width: i == selected ? 2 : 1),
              ),
              child: Text(_items[i].$1,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: _items[i].$2)),
            ),
          ),
      ],
    );
  }
}
