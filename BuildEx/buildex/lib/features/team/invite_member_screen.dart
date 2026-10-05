import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Krisha. Figma: Invite Team Member.
class InviteMemberScreen extends StatelessWidget {
  static const route = '/team/invite';
  const InviteMemberScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: email invite form (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Invite Member'), body: Center(child: Text('Invite Member — TODO')));
  }
}
