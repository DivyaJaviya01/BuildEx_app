import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Shared text input: label above, min height 48, radius 8, teal focus.
// Faculty pattern (loginscreen.dart:54): TextFormField + validator inside a
// Form with GlobalKey<FormState>; validate via _formKey.currentState!.validate().
// Only Divya edits.
class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final int maxLines;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          obscureText: obscure,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textSecondary),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
