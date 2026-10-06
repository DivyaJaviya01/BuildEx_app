import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';

// Owner: Krisha. Figma: My Profile.
class MyProfileScreen extends StatelessWidget {
  static const route = '/profile';
  const MyProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: header + account settings rows (Notifications, Language, Help, Logout).
    return const Scaffold(appBar: BuildExAppBar(title: 'My Profile'), body: Center(child: Text('My Profile — TODO')));
  }
}
