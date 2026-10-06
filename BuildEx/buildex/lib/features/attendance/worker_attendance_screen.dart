import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/stat_card.dart';
import '../../resources/widgets/search_field.dart';
import '../../resources/widgets/section_header.dart';
import '../../resources/widgets/worker_tile.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/theme/app_colors.dart';
import '../../data/mock_data.dart';

// Owner: Jainil. Figma: Worker Attendance.
class WorkerAttendanceScreen extends StatefulWidget {
  static const route = '/attendance';
  const WorkerAttendanceScreen({super.key});

  @override
  State<WorkerAttendanceScreen> createState() => _WorkerAttendanceScreenState();
}

class _WorkerAttendanceScreenState extends State<WorkerAttendanceScreen> {
  late List<Map<String, dynamic>> _workers;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Deep copy mock data so we can toggle state
    _workers = MockData.workers
        .map((w) => Map<String, dynamic>.from(w))
        .toList();
  }

  int get _total => _workers.length;
  int get _present => _workers.where((w) => w['present'] == true).length;
  int get _absent => _total - _present;

  @override
  Widget build(BuildContext context) {
    final filteredWorkers = _workers.where((w) {
      final name = (w['name'] as String).toLowerCase();
      final role = (w['role'] as String).toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || role.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: 'Worker Attendance',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'CURRENT SITE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  'Harbor View Residential Plaza',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Shift: 08:00 AM - 05:00 PM (General Shift)',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),

            // Stat Cards
            StatTriple(
              stats: [
                (
                  label: 'TOTAL',
                  value: _total.toString(),
                  color: AppColors.textPrimary,
                ),
                (
                  label: 'PRESENT',
                  value: _present.toString(),
                  color: AppColors.primary,
                ),
                (
                  label: 'ABSENT',
                  value: _absent.toString(),
                  color: AppColors.danger,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search Field
            SearchField(
              hint: 'Search workers or roles...',
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
            ),
            const SizedBox(height: 24),

            // Roll Call Header
            const SectionHeader(
              title: 'Worker Roll Call',
              action: Row(
                children: [
                  Icon(Icons.filter_list, size: 16, color: AppColors.primary),
                  SizedBox(width: 4),
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Worker List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredWorkers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final w = filteredWorkers[index];
                final origIndex = _workers.indexWhere(
                  (orig) => orig['name'] == w['name'],
                );

                return WorkerTile(
                  name: w['name'] as String,
                  subtitle: w['role'] as String,
                  badge: '',
                  present: w['present'] as bool,
                  onToggle: (val) {
                    setState(() {
                      _workers[origIndex]['present'] = val;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 32),

            // Save Button
            PrimaryButton(label: 'SAVE ATTENDANCE', onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
