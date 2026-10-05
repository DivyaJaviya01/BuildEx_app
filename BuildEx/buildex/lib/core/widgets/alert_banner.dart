import 'package:flutter/material.dart';

// Alert/info banner: teal info, yellow phase note, red critical defect.
// Only Divya edits.
class AlertBanner extends StatelessWidget {
  final String title;
  final String body;
  final Color color;
  final IconData icon;
  const AlertBanner({super.key, required this.title, required this.body, required this.color, this.icon = Icons.info_outline});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: color)),
                Text(body, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
