import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/status_badge.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/segmented_chips.dart';
import '../../resources/widgets/hero_image_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/theme/app_colors.dart';

// Owner: Jainil. Figma: Daily Progress.
class DailyProgressScreen extends StatefulWidget {
  static const route = '/daily-progress';
  const DailyProgressScreen({super.key});

  @override
  State<DailyProgressScreen> createState() => _DailyProgressScreenState();
}

class _DailyProgressScreenState extends State<DailyProgressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _notesController = TextEditingController();
  int _selectedStatus = 0;
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _notesController.addListener(() {
      setState(() {
        _charCount = _notesController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _saveNotes() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notes saved successfully!'), duration: Duration(seconds: 2)),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: 'Daily Progress',
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Progress",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  StatusBadge(label: 'BT-2024-001', color: Colors.blueGrey),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Log on-site activities and critical blockers.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),

              // Segmented Status
              const Text(
                'Progress Status',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SegmentedStatus(
                options: const ['On Track', 'Delayed', 'Blocked'],
                selected: _selectedStatus,
                onSelected: (i) => setState(() => _selectedStatus = i),
              ),
              const SizedBox(height: 20),

              // Notes Area
              InfoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Daily Notes',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '$_charCount / 500',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        TextFormField(
                          controller: _notesController,
                          maxLength: 500,
                          maxLines: 5,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Notes cannot be empty'
                              : null,
                          decoration: const InputDecoration(
                            hintText:
                                'Describe main tasks completed, materials delivered, or issues encountered...',
                            hintStyle: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            counterText: '', // Hide default counter
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                          child: Icon(
                            Icons.edit_note,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Info Banner
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    left: BorderSide(color: AppColors.primary, width: 4),
                  ),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: AppColors.primary),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Updates are visible to supervisors and stakeholders. Please ensure technical accuracy in all entries.',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Image Card
              const HeroImageCard(
                imageAsset: 'assets/images/site.jpg', // mocked
                eyebrow: 'South Wing - Phase 2',
                title: 'Concrete Pouring in Progress',
              ),
              const SizedBox(height: 24),

              // Save Button
              PrimaryButton(label: 'SAVE NOTES', onPressed: _saveNotes),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}