import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: M2. Figma: Site Photos.
class SitePhotosScreen extends StatelessWidget {
  static const route = '/site-photos';
  const SitePhotosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: thumbnails + Tap to Capture card + guidelines + SAVE PHOTOS.
    return const Scaffold(appBar: BuildExAppBar(title: 'Site Photos'), body: Center(child: Text('Site Photos — TODO')));
  }
}
