import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/alert_banner.dart';
import '../../resources/widgets/app_dropdown.dart';
import '../../resources/widgets/app_text_field.dart';
import '../../resources/widgets/primary_button.dart';
import '../../resources/widgets/section_header.dart';
import '../../resources/widgets/hero_image_card.dart';
import '../../resources/theme/app_colors.dart';

// Owner: Jainil. Figma: Material Log.
class MaterialLogScreen extends StatefulWidget {
  static const route = '/material-log';
  const MaterialLogScreen({super.key});

  @override
  State<MaterialLogScreen> createState() => _MaterialLogScreenState();
}

class _MaterialLogScreenState extends State<MaterialLogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  String? _selectedMaterial;
  String _selectedUnit = 'Bags';
  final List<Map<String, dynamic>> _entries = [
    {'material': 'Portland Cement', 'batch': 'Batch #A-102', 'time': 'Today, 09:45 AM', 'amount': '50', 'unit': 'Bags', 'icon': Icons.inventory_2_outlined},
    {'material': 'Coarse Sand', 'batch': 'South Pit Supply', 'time': 'Yesterday', 'amount': '200', 'unit': 'CFT', 'icon': Icons.layers_outlined},
  ];

  final List<String> _materials = ['Portland Cement', 'Coarse Sand', 'Gravel', 'Steel Rebar'];
  final List<String> _units = ['Bags', 'CFT', 'Tons', 'Kg'];

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _addToRecord() {
    if (_selectedMaterial == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a material type')),
      );
      return;
    }
    if (_quantityController.text.isEmpty || double.tryParse(_quantityController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid quantity')),
      );
      return;
    }

    setState(() {
      _entries.insert(0, {
        'material': _selectedMaterial!,
        'batch': 'Batch #${DateTime.now().millisecondsSinceEpoch}',
        'time': 'Just now',
        'amount': _quantityController.text,
        'unit': _selectedUnit,
        'icon': _getMaterialIcon(_selectedMaterial!),
      });
      _quantityController.clear();
      _selectedMaterial = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to record!'), duration: Duration(seconds: 2)),
    );
  }

  IconData _getMaterialIcon(String material) {
    switch (material) {
      case 'Portland Cement':
        return Icons.inventory_2_outlined;
      case 'Coarse Sand':
        return Icons.layers_outlined;
      case 'Gravel':
        return Icons.terrain_outlined;
      case 'Steel Rebar':
        return Icons.construction_outlined;
      default:
        return Icons.inventory_2_outlined;
    }
  }

  void _saveMaterialLog() {
    if (_entries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No entries to save')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Material log saved successfully!'), duration: Duration(seconds: 2)),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: 'Material Log',
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
            children: [
              // Alert Banner
              const AlertBanner(
                title: 'Construction Phase: Foundation',
                body:
                    'Ensure all aggregate materials are moisture-tested before mixing. Log every batch to maintain structural integrity records.',
                color: AppColors.warning,
                icon: Icons.info,
              ),
              const SizedBox(height: 16),

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
                  children: [
                    AppDropdown(
                      label: 'Material Type',
                      hint: 'Select material...',
                      items: _materials,
                      value: _selectedMaterial,
                      onChanged: (val) => setState(() => _selectedMaterial = val),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppTextField(
                            label: 'Quantity',
                            hint: '0.00',
                            controller: _quantityController,
                            validator: (val) => val?.isEmpty ?? true ? 'Enter quantity' : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: AppDropdown(
                            label: 'Unit',
                            hint: 'Bags',
                            items: _units,
                            value: _selectedUnit,
                            onChanged: (val) => setState(() => _selectedUnit = val!),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _addToRecord,
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'ADD TO RECORD',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Recent Entries Header
              SectionHeader(
                title: 'Recent Entries',
                action: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('View all entries coming soon!')),
                    );
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Recent Entries List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _entries.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return _buildMaterialTile(
                    title: entry['material'] as String,
                    subtitle: entry['batch'] as String,
                    time: entry['time'] as String,
                    amount: entry['amount'] as String,
                    unit: entry['unit'] as String,
                    icon: entry['icon'] as IconData,
                  );
                },
              ),
              const SizedBox(height: 24),

              // Hero Image
              const HeroImageCard(
                eyebrow: '',
                title: 'Site Inspection Ready',
                imageAsset: 'assets/images/photo1.jpg',
              ),
              const SizedBox(height: 24),

              // Save Button
              PrimaryButton(label: 'SAVE MATERIAL LOG', onPressed: _saveMaterialLog),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialTile({
    required String title,
    required String subtitle,
    required String time,
    required String amount,
    required String unit,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$subtitle • $time',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primaryDark,
                ),
              ),
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}