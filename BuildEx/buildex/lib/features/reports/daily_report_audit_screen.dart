import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/alert_banner.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/widgets/secondary_button.dart';

// Owner: Divya. Figma: Daily Report Audit.png.
class DailyReportAuditScreen extends StatelessWidget {
  static const route = '/report-audit';
  const DailyReportAuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildExAppBar(title: 'Daily Report Audit'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const InfoCard(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Metro Line Phase 2A',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                          SizedBox(height: 4),
                          Row(children: [
                            Icon(Icons.calendar_today_outlined,
                                size: 14, color: AppColors.textSecondary),
                            SizedBox(width: 4),
                            Text('July 21, 2026', style: TextStyle(fontSize: 12)),
                          ]),
                        ],
                      ),
                    ),
                    _LockedBadge(),
                  ],
                ),
                Divider(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      child: Text('JD', style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('REPORT MANAGER',
                            style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                        Text('Krisha Akbari',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const _Section(
            icon: Icons.trending_up,
            title: 'Daily Progress',
            child: _ProgressSubCard(),
          ),
          const SizedBox(height: 12),
          const _Section(
            icon: Icons.people_outline,
            title: 'Workforce Attendance',
            child: Row(
              children: [
                _CountBox(count: '10', label: 'PRESENT', color: Color(0xFF388E3C)),
                SizedBox(width: 10),
                _CountBox(count: '2', label: 'ABSENT', color: AppColors.danger),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const _Section(
            icon: Icons.receipt_long_outlined,
            title: 'Material Usage & Expenses',
            child: Column(
              children: [
                _ExpenseRow(name: 'Cement', detail: '50 Bags', amount: '\$400'),
                _ExpenseRow(name: 'Coarse Sand', detail: '200 CFT', amount: '\$850'),
                Divider(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: Text('TOTAL EXPENSE',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13))),
                    Text('\$1,250', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const AlertBanner(
            title: '1 CRITICAL DEFECT FOUND',
            body: 'Concrete Crack in Sector B, Column 4. Requires immediate structural review before continuing upper level pour.',
            color: AppColors.danger,
            icon: Icons.warning_amber_outlined,
          ),
          const SizedBox(height: 12),
          const Row(children: [
            Icon(Icons.photo_camera_outlined, size: 18),
            SizedBox(width: 6),
            Text('Site Photos (3)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ]),
          const SizedBox(height: 8),
          Row(
            children: [
              for (int i = 0; i < 3; i++)
                Expanded(
                  child: Container(
                    height: 90,
                    margin: EdgeInsets.only(right: i == 2 ? 0 : 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/photo_audit${i + 1}.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) =>
                                Container(color: Colors.grey[300]),
                          ),
                          if (i == 0)
                            Positioned(
                              bottom: 6,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Defect',
                                    style: TextStyle(color: Colors.white, fontSize: 11)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'APPROVE REPORT',
            icon: Icons.check_circle,
            foreground: AppColors.primaryDark,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 10),
          const SecondaryButton(label: 'DOWNLOAD PDF', icon: Icons.download_outlined),
        ],
      ),
      bottomNavigationBar: const BuildExBottomNav(currentIndex: 0),
    );
  }
}

class _LockedBadge extends StatelessWidget {
  const _LockedBadge();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF388E3C).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text('SUBMITTED &\nLOCKED',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF388E3C))),
    );
  }
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  const _Section({required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ]),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _ProgressSubCard extends StatelessWidget {
  const _ProgressSubCard();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text('Ceiling - Cement layer completed',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
              Text('33%', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.33,
            minHeight: 7,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            backgroundColor: Color(0xFFE3E8E8),
            valueColor: AlwaysStoppedAnimation(AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _CountBox extends StatelessWidget {
  final String count;
  final String label;
  final Color color;
  const _CountBox({required this.count, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color)),
            Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
          ],
        ),
      ),
    );
  }
}

class _ExpenseRow extends StatelessWidget {
  final String name;
  final String detail;
  final String amount;
  const _ExpenseRow({required this.name, required this.detail, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text(detail, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}
