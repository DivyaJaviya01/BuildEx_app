import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/stat_card.dart';
import '../../resources/widgets/section_header.dart';
import '../../resources/widgets/worker_tile.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/theme/app_colors.dart';
import '../../data/mock_data.dart';

// Owner: Jainil. Figma: Attendance History.
class AttendanceHistoryScreen extends StatelessWidget {
  static const route = '/attendance/history';
  const AttendanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: 'Attendance History',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project & Date Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Project',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Metro Line Phase 2A',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Thursday, July 23, 2026',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Date Picker Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateBox('Mon', '20', false),
                _buildDateBox('Tue', '21', false),
                _buildDateBox('Wed', '22', false),
                _buildDateBox('Thu', '23', true), // Active
                _buildDateBox('Fri', '24', false),
                _buildDateBox('Sat', '25', false),
              ],
            ),
            const SizedBox(height: 24),

            // Stats
            const StatTriple(
              stats: [
                (
                  label: 'Total Crew',
                  value: '12',
                  color: AppColors.textPrimary,
                ),
                (label: 'Present', value: '10', color: AppColors.success),
                (label: 'Absent', value: '2', color: AppColors.danger),
              ],
            ),
            const SizedBox(height: 24),

            // Section Header
            const SectionHeader(
              title: 'Crew Attendance',
              action: Text(
                '4 Records',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 12),

            // Worker List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: MockData.workers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final w = MockData.workers[index];
                final present = w['present'] as bool;
                return WorkerTile(
                  name: w['name'] as String,
                  subtitle: w['role'] as String,
                  badge: present ? 'PRESENT' : 'ABSENT',
                  badgeColor: present ? AppColors.success : AppColors.danger,
                );
              },
            ),
            const SizedBox(height: 32),

            // Edit Button
            PrimaryButton(
              label: "EDIT TODAY'S ATTENDANCE",
              onPressed: () {},
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(String day, String date, bool isActive) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? AppColors.primary : AppColors.textSecondary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
