import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/filter_chips.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../issues/report_issue_screen.dart';
import 'issue_detail_screen.dart';
import 'widgets/issue_card.dart';

// Owner: Divya. Figma: Issues & Defects Tracker.png.
class IssuesTrackerScreen extends StatefulWidget {
  static const route = '/issues';
  const IssuesTrackerScreen({super.key});

  @override
  State<IssuesTrackerScreen> createState() => _IssuesTrackerScreenState();
}

class _IssuesTrackerScreenState extends State<IssuesTrackerScreen> {
  int _filter = 2; // Open

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Issues & Defects',
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const InfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PROJECT', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                Row(
                  children: [
                    Expanded(
                      child: Text('Metro Line Phase 2A',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    ),
                    Icon(Icons.warning_amber_outlined, size: 16, color: AppColors.danger),
                    SizedBox(width: 4),
                    Text('3 Open (1 Critical)',
                        style: TextStyle(fontSize: 12, color: AppColors.danger, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FilterChips(
            options: const ['All', 'Critical', 'Open', 'Resolved'],
            selected: _filter,
            onSelected: (i) => setState(() => _filter = i),
          ),
          const SizedBox(height: 12),
          IssueCard(
            severity: 'CRITICAL',
            severityColor: AppColors.danger,
            status: 'OPEN',
            title: 'Slab Cracking at Pier 45',
            reported: 'Reported: July 23 by Rajesh Kumar',
            description: 'Hairline cracks observed on the concrete surface after curing.',
            onTap: () => Navigator.pushNamed(context, IssueDetailScreen.route),
          ),
          const SizedBox(height: 10),
          IssueCard(
            severity: 'HIGH',
            severityColor: const Color(0xFFF57C00),
            status: 'OPEN',
            title: 'Water Leakage in Foundation',
            reported: 'Reported: July 22 by Vikram Singh',
            description: 'Slow seepage detected in the southern foundation trench.',
            onTap: () => Navigator.pushNamed(context, IssueDetailScreen.route),
          ),
          const SizedBox(height: 10),
          const IssueCard(
            severity: 'MEDIUM',
            severityColor: Color(0xFFB78A00),
            status: 'RESOLVED',
            title: 'Delayed Rebar Delivery',
            reported: 'Reported: July 20 by Anil Sharma',
            description: 'Delivery arrived 4 hours late; resolved and unloaded.',
            resolved: true,
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'REPORT NEW ISSUE',
            icon: Icons.add_circle,
            onPressed: () => Navigator.pushNamed(context, ReportIssueScreen.route),
          ),
        ],
      ),
    );
  }
}
