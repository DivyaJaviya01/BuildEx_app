import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../../resources/widgets/hero_image_card.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/widgets/progress_ring.dart';
import '../../resources/widgets/status_badge.dart';
import '../reports/daily_report_audit_screen.dart';
import 'widgets/mini_stat_card.dart';
import 'widgets/summary_row.dart';

// Owner: Divya. Figma: Project Dashboard.png.
class ProjectDashboardScreen extends StatelessWidget {
  static const route = '/dashboard';
  const ProjectDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Metro Line Phase 2A',
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const HeroImageCard(
            imageAsset: 'assets/images/site_hero.jpg',
            eyebrow: 'LOCATION',
            title: 'North Corridor Sector 7',
          ),
          const SizedBox(height: 12),
          const InfoCard(
            child: Row(
              children: [
                ProgressRing(progress: 0.65, size: 80),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusBadge(label: 'STATUS: ACTIVE', color: AppColors.primary),
                      SizedBox(height: 8),
                      Row(children: [
                        Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textSecondary),
                        SizedBox(width: 6),
                        Text('Est. Completion: Oct 2026', style: TextStyle(fontSize: 12)),
                      ]),
                      SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.account_balance_wallet_outlined,
                            size: 14, color: AppColors.textSecondary),
                        SizedBox(width: 6),
                        Text('Allocated Budget: \$500K', style: TextStyle(fontSize: 12)),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              MiniStatCard(
                label: 'SPENT TODAY',
                value: '\$1,250',
                note: '83% of daily cap',
                accent: AppColors.primary,
              ),
              SizedBox(width: 12),
              MiniStatCard(
                label: 'TOTAL COST',
                value: '\$325,400',
                note: '65% of total budget',
                accent: AppColors.accent,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const InfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DAILY SUMMARY', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                SummaryRow(title: 'Daily Progress', subtitle: 'Completed', done: true),
                SummaryRow(title: 'Worker Attendance', subtitle: '10 / 12 Present', done: true),
                SummaryRow(title: 'Material Log', subtitle: '50 Bags Cement used', done: true),
                SummaryRow(title: 'Open Issues', subtitle: '1 Critical Defect', alert: true),
              ],
            ),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'VIEW DAILY REPORT DETAILS',
            onPressed: () => Navigator.pushNamed(context, DailyReportAuditScreen.route),
          ),
        ],
      ),
      bottomNavigationBar: const BuildExBottomNav(currentIndex: 0),
    );
  }
}
