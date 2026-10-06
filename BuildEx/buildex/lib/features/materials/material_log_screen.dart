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
class MaterialLogScreen extends StatelessWidget {
  static const route = '/material-log';
  const MaterialLogScreen({super.key});

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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                    items: const [
                      'Portland Cement',
                      'Coarse Sand',
                      'Gravel',
                      'Steel Rebar',
                    ],
                    onChanged: (val) {},
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: AppTextField(label: 'Quantity', hint: '0.00'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 1,
                        child: AppDropdown(
                          label: 'Unit',
                          hint: 'Bags',
                          items: const ['Bags', 'CFT', 'Tons', 'Kg'],
                          onChanged: (val) {},
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
                      onPressed: () {},
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
            const SectionHeader(
              title: 'Recent Entries',
              action: Text(
                'View All',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Recent Entries List
            _buildMaterialTile(
              title: 'Portland Cement',
              subtitle: 'Batch #A-102 • Today, 09:45 AM',
              amount: '50',
              unit: 'Bags',
              icon: Icons.inventory_2_outlined,
            ),
            const SizedBox(height: 12),
            _buildMaterialTile(
              title: 'Coarse Sand',
              subtitle: 'South Pit Supply • Yesterday',
              amount: '200',
              unit: 'CFT',
              icon: Icons.layers_outlined,
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
            PrimaryButton(label: 'SAVE MATERIAL LOG', onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialTile({
    required String title,
    required String subtitle,
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
                  subtitle,
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
