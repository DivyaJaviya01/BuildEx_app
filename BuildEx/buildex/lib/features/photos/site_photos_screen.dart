import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';
import '../../core/widgets/capture_box.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/theme/app_colors.dart';

// Owner: Jainil. Figma: Site Photos.
class SitePhotosScreen extends StatelessWidget {
  static const route = '/site-photos';
  const SitePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildExAppBar(
        title: 'Site Photos',
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
            const Text(
              'PROJECT NAME',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Terminal 4 Expansion',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Capture Box
            CaptureBox(
              title: 'Tap to Capture',
              subtitle: 'Add Site Photo',
              onTap: () {},
            ),
            const SizedBox(height: 24),

            // Recent Uploads
            const SectionHeader(
              title: 'Recent Uploads',
              action: Text(
                '4 Photos',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Photos Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildPhotoThumbnail('assets/images/photo1.jpg', '10:24 AM'),
                _buildPhotoThumbnail('assets/images/photo2.jpg', '11:15 AM'),
                _buildPhotoThumbnail('assets/images/photo3.jpg', '01:45 PM'),
                _buildPhotoThumbnail('assets/images/photo4.jpg', '03:30 PM'),
              ],
            ),
            const SizedBox(height: 24),

            // Photo Guidelines
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.primaryDark),
                      SizedBox(width: 8),
                      Text(
                        'Photo Guidelines',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildGuideline(
                    'Ensure adequate lighting for clear visibility.',
                  ),
                  _buildGuideline(
                    'Capture specific equipment labels if applicable.',
                  ),
                  _buildGuideline(
                    'Maintain a wide angle to show surrounding context.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Save Button
            PrimaryButton(label: 'SAVE PHOTOS', onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoThumbnail(String imageAsset, String time) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(color: Colors.grey[300]),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideline(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 5, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
