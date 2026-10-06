import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/app_date_field.dart';
import '../../resources/widgets/app_dropdown.dart';
import '../../resources/widgets/app_text_field.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/widgets/secondary_button.dart';
import 'widgets/template_phase_row.dart';

// Owner: Divya. Figma: Add New Project.png.
class AddProjectScreen extends StatefulWidget {
  static const route = '/projects/add';
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _client = TextEditingController();
  final _location = TextEditingController();
  String? _manager;
  final _phases = [true, true, true, false];

  static const _phaseData = [
    ('Phase 1: Substructure', 'Site Prep, Excavation, Foundation'),
    ('Phase 2: Superstructure', 'Columns, Beams, Slabs'),
    ('Phase 3: MEP & Finishes', 'Plumbing, Plastering, Painting'),
    ('Phase 4: Commissioning', 'Safety Inspection, Handover'),
  ];

  @override
  void dispose() {
    _name.dispose();
    _client.dispose();
    _location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Add New Project',
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            InfoCard(
              child: Column(
                children: [
                  AppTextField(
                    label: 'PROJECT NAME',
                    hint: 'e.g. Metro Line Phase 2B',
                    controller: _name,
                    validator: (t) => (t == null || t.isEmpty) ? 'Project name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    label: 'CLIENT NAME',
                    hint: 'e.g. Delhi Metro Rail Corp',
                    controller: _client,
                    validator: (t) => (t == null || t.isEmpty) ? 'Client name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  AppTextField(label: 'LOCATION', hint: 'e.g. Sector 62, Noida', controller: _location),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(child: AppDateField(label: 'START DATE')),
                      SizedBox(width: 12),
                      Expanded(child: AppDateField(label: 'EST. COMPLETION')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppDropdown(
                    label: 'ASSIGN SITE MANAGER',
                    items: const ['Jainil Trivedi - Contractor', 'Rajesh Kumar - Mason Lead'],
                    value: _manager,
                    onChanged: (v) => setState(() => _manager = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('CONSTRUCTION LIFECYCLE TEMPLATE',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            const Text('Select, reorder, or customize stages for this project:',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            for (int i = 0; i < _phaseData.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TemplatePhaseRow(
                  title: _phaseData[i].$1,
                  subtitle: _phaseData[i].$2,
                  checked: _phases[i],
                  onChanged: (v) => setState(() => _phases[i] = v ?? false),
                  onDelete: () {},
                ),
              ),
            const SizedBox(height: 8),
            const SecondaryButton(label: 'Add new site', icon: Icons.add),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'CREATE PROJECT',
              onPressed: () {
                if (_formKey.currentState!.validate()) Navigator.pop(context);
              },
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
