import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';

// Owner: Krisha. Figma: My Team.
class MyTeamScreen extends StatelessWidget {
  static const route = '/team';
  const MyTeamScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: member cards from MockData.team + productivity card.
    return const Scaffold(appBar: BuildExAppBar(title: 'My Team'), body: Center(child: Text('My Team — TODO')));
  }
}
