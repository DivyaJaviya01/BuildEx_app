import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';

// Owner: Krisha. Figma: Splash Screen (first frame, right tree top).
class SplashScreen extends StatelessWidget {
  static const route = '/';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: match Figma Splash Screen exactly (logo, 390px base).
    return const Scaffold(
      appBar: BuildExAppBar(title: 'Splash Screen'),
      body: Center(child: Text('Splash Screen — TODO')),
    );
  }
}
