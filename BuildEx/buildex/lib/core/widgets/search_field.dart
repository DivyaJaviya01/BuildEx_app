import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Search input with magnifier (attendance, lists). Only Divya edits.
class SearchField extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  const SearchField({super.key, this.hint = 'Search...', this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
