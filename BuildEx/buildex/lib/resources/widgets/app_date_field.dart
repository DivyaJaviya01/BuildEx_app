import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Shared date field: read-only input + calendar icon + showDatePicker.
// Faculty pattern (registration.dart:27): check mounted after await.
// Only Divya edits.
class AppDateField extends StatefulWidget {
  final String label;
  final DateTime? initial;
  final ValueChanged<DateTime>? onPicked;
  const AppDateField({super.key, required this.label, this.initial, this.onPicked});

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  late final TextEditingController _controller;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    _date = widget.initial;
    _controller = TextEditingController(text: _fmt(_date));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static String _fmt(DateTime? d) =>
      d == null ? '' : '${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}/${d.year}';

  Future<void> _pick() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (!mounted || picked == null) return;
    setState(() {
      _date = picked;
      _controller.text = _fmt(picked);
    });
    widget.onPicked?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        const SizedBox(height: 6),
        TextFormField(
          controller: _controller,
          readOnly: true,
          onTap: _pick,
          decoration: InputDecoration(
            hintText: 'mm/dd/yyyy',
            hintStyle: const TextStyle(color: AppColors.textSecondary),
            suffixIcon: const Icon(Icons.calendar_today_outlined, color: AppColors.primary),
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
