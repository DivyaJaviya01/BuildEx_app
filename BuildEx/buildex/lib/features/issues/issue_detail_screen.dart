import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/alert_banner.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/hero_image_card.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/widgets/secondary_button.dart';

// Owner: Divya. Figma: Issue Detail.png.
class IssueDetailScreen extends StatelessWidget {
  static const route = '/issues/detail';
  const IssueDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildExAppBar(title: 'Issue Detail'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const AlertBanner(
            title: 'CRITICAL BLOCKER',
            body: '',
            color: AppColors.danger,
            icon: Icons.warning_amber_outlined,
          ),
          const SizedBox(height: 12),
          const HeroImageCard(
            imageAsset: 'assets/images/issue_site.jpg',
            eyebrow: '',
            title: '',
          ),
          const SizedBox(height: 12),
          const InfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Icon(Icons.person_outline, size: 16, color: AppColors.textSecondary),
                  SizedBox(width: 6),
                  Text('Reported By: Jainil', style: TextStyle(fontSize: 13)),
                ]),
                SizedBox(height: 4),
                Row(children: [
                  Icon(Icons.access_time, size: 16, color: AppColors.textSecondary),
                  SizedBox(width: 6),
                  Text('July 21 11:15 AM', style: TextStyle(fontSize: 13)),
                ]),
                Divider(height: 20),
                Text('Description', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                Text('Concrete Crack identified in Sector B, Column 4. Structural review required.',
                    style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(children: [
            Icon(Icons.forum_outlined, size: 20),
            SizedBox(width: 6),
            Text('Timeline & Comments', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          ]),
          const SizedBox(height: 8),
          const _Comment(
            name: 'Jainil Trivedi',
            time: 'July 21, 11:30 AM',
            text: 'hollow sound detected.',
            tinted: false,
          ),
          const SizedBox(height: 8),
          const _Comment(
            name: 'Site Builder',
            time: 'July 21, 2:15 PM',
            text: 'Engineer dispatched for tomorrow.',
            tinted: true,
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'RESOLVE ISSUE',
            icon: Icons.check_circle,
            background: const Color(0xFF388E3C),
            foreground: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 10),
          const SecondaryButton(label: 'REASSIGN / UPDATE SEVERITY', icon: Icons.sync),
        ],
      ),
    );
  }
}

class _Comment extends StatelessWidget {
  final String name;
  final String time;
  final String text;
  final bool tinted;
  const _Comment({required this.name, required this.time, required this.text, this.tinted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: tinted ? AppColors.primary.withValues(alpha: 0.08) : AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary))),
              Text(time, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 4),
          Text(text, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
