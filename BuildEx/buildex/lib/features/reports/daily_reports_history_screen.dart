import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../../resources/widgets/filter_chips.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/status_badge.dart';
import 'daily_report_audit_screen.dart';
import 'widgets/report_history_card.dart';

// Owner: Divya. Figma: Daily Reports History.png (title: Daily Reports).
class DailyReportsHistoryScreen extends StatefulWidget {
  static const route = '/reports-history';
  const DailyReportsHistoryScreen({super.key});

  @override
  State<DailyReportsHistoryScreen> createState() => _DailyReportsHistoryScreenState();
}

class _DailyReportsHistoryScreenState extends State<DailyReportsHistoryScreen> {
  int _filter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Daily Reports',
        actions: [IconButton(icon: const Icon(Icons.filter_list), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const InfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text('Project',
                            style: TextStyle(fontSize: 12, color: AppColors.textSecondary))),
                    StatusBadge(label: 'ACTIVE', color: AppColors.primary),
                  ],
                ),
                Text('Metro Line Phase 2A',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FilterChips(
            options: const ['All', 'This Week', 'This Month', 'Draft'],
            selected: _filter,
            onSelected: (i) => setState(() => _filter = i),
          ),
          const SizedBox(height: 12),
          ReportHistoryCard(
            date: 'July 23, 2026',
            badge: 'SUBMITTED',
            progress: '+2.5%',
            attendance: '10/12',
            spent: '\$1,250',
            issues: '1 Critical',
            issueAlert: true,
            onTap: () => Navigator.pushNamed(context, DailyReportAuditScreen.route),
          ),
          const SizedBox(height: 10),
          ReportHistoryCard(
            date: 'July 22, 2026',
            badge: 'SUBMITTED',
            progress: '+1.8%',
            attendance: '11/12',
            spent: '\$980',
            issues: '0',
            onTap: () => Navigator.pushNamed(context, DailyReportAuditScreen.route),
          ),
          const SizedBox(height: 10),
          ReportHistoryCard(
            date: 'July 21, 2026',
            badge: 'DRAFT',
            draft: true,
            progress: '+0.5%',
            attendance: '8/12',
            spent: '\$450',
            issues: '1 High',
            issueAlert: true,
            onTap: () => Navigator.pushNamed(context, DailyReportAuditScreen.route),
          ),
        ],
      ),
      bottomNavigationBar: const BuildExBottomNav(currentIndex: 0),
    );
  }
}
