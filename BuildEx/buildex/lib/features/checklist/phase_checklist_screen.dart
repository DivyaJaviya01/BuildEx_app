import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/checklist_row.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/widgets/section_header.dart';
import '../../resources/theme/app_colors.dart';
import '../tasks/add_task_screen.dart';
import 'phase_progress_screen.dart';

// Owner: Jainil. Figma: "Daily progress.png" = Today's Tasks & Checklist
class PhaseChecklistScreen extends StatefulWidget {
  static const route = '/checklist';
  const PhaseChecklistScreen({super.key});

  @override
  State<PhaseChecklistScreen> createState() => _PhaseChecklistScreenState();
}

class _PhaseChecklistScreenState extends State<PhaseChecklistScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Rebar Installation', 'subtitle': 'Structural Core', 'checked': false},
    {'title': 'Foundation Leveling', 'subtitle': 'Ground Work', 'checked': true},
    {'title': 'Cement Pouring', 'subtitle': 'Zone A & B', 'checked': false},
    {'title': 'Moisture Test', 'subtitle': 'Safety Compliance', 'checked': false},
  ];

  void _showSaveConfirmation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Checklist saved successfully!'), duration: Duration(seconds: 2)),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: "Today's Tasks & Checklist",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Daily Report Progress Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.textSecondary.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Daily Report Progress', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.65,
                      backgroundColor: Color(0xFFE0F2F1),
                      color: AppColors.primary,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('65% Complete', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, PhaseProgressScreen.route),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('View Overall Progress', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.primary)),
                        Icon(Icons.chevron_right, color: AppColors.primary),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Section Header
            SectionHeader(
              title: 'Phase 2: Base Creation',
              action: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Active', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              ),
            ),
            const SizedBox(height: 12),

            // Checklist
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _tasks.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ChecklistRow(
                  title: task['title'] as String,
                  subtitle: task['subtitle'] as String,
                  checked: task['checked'] as bool,
                  onChanged: (val) {
                    setState(() {
                      _tasks[index]['checked'] = val ?? false;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.textPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: () => Navigator.pushNamed(context, AddTaskScreen.route),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: PrimaryButton(
            label: 'Save Checklist',
            onPressed: _showSaveConfirmation,
          ),
        ),
      ),
    );
  }
}