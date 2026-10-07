import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/app_text_field.dart';
import '../../resources/widgets/severity_chips.dart';
import '../../resources/widgets/capture_box.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/theme/app_colors.dart';

// Owner: Jainil. Figma: Report Issue / Defect.
class ReportIssueScreen extends StatefulWidget {
  static const route = '/report-issue';
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  int _selectedSeverity = 0;

  void _showCaptureOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Attach Issue Photo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Camera access coming soon!')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Gallery access coming soon!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logIssue() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Issue logged successfully!'), duration: Duration(seconds: 2)),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: 'Report Issue',
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                'New Defect Report',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Provide detailed information to alert the engineering team.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(height: 24),

              // Form Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.textSecondary.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      label: 'Issue Title',
                      hint: 'e.g. Concrete Cracking in Column B4',
                      controller: _titleController,
                      validator: (val) => val?.isEmpty ?? true ? 'Issue title is required' : null,
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Severity Level',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SeverityChips(
                      selected: _selectedSeverity,
                      onSelected: (val) {
                        setState(() {
                          _selectedSeverity = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    AppTextField(
                      label: 'Description',
                      hint: 'Describe the observed defect in detail...',
                      maxLines: 4,
                      controller: _descriptionController,
                      validator: (val) => val?.isEmpty ?? true ? 'Description is required' : null,
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Attach Issue Photo',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CaptureBox(
                      title: 'Click to Upload',
                      subtitle: 'JPG or PNG up to 10MB',
                      onTap: _showCaptureOptions,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Log Issue Button
              PrimaryButton(
                label: 'LOG ISSUE',
                icon: Icons.report,
                onPressed: _logIssue,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}