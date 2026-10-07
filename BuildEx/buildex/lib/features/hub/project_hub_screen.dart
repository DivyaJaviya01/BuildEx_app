import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/status_badge.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/hero_image_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/theme/app_colors.dart';
import '../daily/daily_progress_screen.dart';
import '../photos/site_photos_screen.dart';
import '../attendance/worker_attendance_screen.dart';
import '../materials/material_log_screen.dart';
import '../issues/report_issue_screen.dart';
import '../reports/daily_report_summary_screen.dart';
import '../checklist/phase_checklist_screen.dart';

// Owner: Jainil. Figma: Project Hub (contractor action grid + SUBMIT DAILY REPORT).
class ProjectHubScreen extends StatelessWidget {
  static const route = '/hub';
  const ProjectHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const BuildExAppBar(title: 'Project Hub'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Metro Line Phase 2A',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                StatusBadge(label: 'ACTIVE', color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Site ID: ML-2A-9902',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),

            // Progress Card → opens the day's task checklist
            InfoCard(
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, PhaseChecklistScreen.route),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Report Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '65%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.65,
                      minHeight: 8,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                      valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '2 steps remaining for completion today.',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                _buildActionCard(
                  Icons.edit_document,
                  'Progress Notes',
                  () => Navigator.pushNamed(context, DailyProgressScreen.route),
                ),
                _buildActionCard(
                  Icons.camera_alt_outlined,
                  'Site Photos',
                  () => Navigator.pushNamed(context, SitePhotosScreen.route),
                ),
                _buildActionCard(
                  Icons.person_outline,
                  'Labor Attendance',
                  () => Navigator.pushNamed(context, WorkerAttendanceScreen.route),
                ),
                _buildActionCard(
                  Icons.inventory_2_outlined,
                  'Material Log',
                  () => Navigator.pushNamed(context, MaterialLogScreen.route),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Issue Card
            InfoCard(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, ReportIssueScreen.route),
                child: const Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: AppColors.danger,
                      size: 30,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Report Issue / Defect',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Flag safety or structural concerns',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Image Card
            const HeroImageCard(
              imageAsset: 'assets/images/site.jpg', // mocked
              eyebrow: '',
              title: 'Site Overview - Sector 4',
            ),
            const SizedBox(height: 24),

            // Primary Button
            PrimaryButton(
              label: 'SUBMIT DAILY REPORT',
              onPressed: () => Navigator.pushNamed(context, DailyReportSummaryScreen.route),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: InfoCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.primaryDark),
            ),
            const Spacer(),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}