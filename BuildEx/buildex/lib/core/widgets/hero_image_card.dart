import 'package:flutter/material.dart';

// Hero image card with bottom-left overlay label (dashboard, hub banners).
// Only Divya edits.
class HeroImageCard extends StatelessWidget {
  final String imageAsset;
  final String eyebrow;
  final String title;
  const HeroImageCard({super.key, required this.imageAsset, required this.eyebrow, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.asset(imageAsset, height: 150, width: double.infinity, fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(height: 150, color: Colors.grey[300])),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(eyebrow,
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white70)),
                Text(title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
