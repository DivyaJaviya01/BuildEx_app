import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../../data/mock_data.dart';
import '../hub/project_hub_screen.dart';
import '../dashboard/project_dashboard_screen.dart';
import '../tasks/my_tasks_screen.dart';
import '../team/my_team_screen.dart';
import '../profile/my_profile_screen.dart';
import 'add_project_screen.dart';
import 'widgets/project_card.dart';
import 'widgets/quick_action_card.dart';

// Owner: Divya. Figma: My Project.png.
// Prototype redirect (system_design/08_page_redirection_flow.md:19): tapping a
// project opens Hub (contractor) or Dashboard (builder) by role. Role check is
// implicit at login in Figma; this demo toggle stands in until TSEE backend.
class MyProjectsScreen extends StatefulWidget {
  static const route = '/projects';
  const MyProjectsScreen({super.key});

  @override
  State<MyProjectsScreen> createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  bool _isBuilder = false; // DEV demo switch; TSEE: real role from login

  void _goTab(int i) {
    const routes = [MyProjectsScreen.route, MyTasksScreen.route, MyTeamScreen.route, MyProfileScreen.route];
    if (i == 0) return;
    Navigator.pushReplacementNamed(context, routes[i]);
  }

  void _openProject() {
    Navigator.pushNamed(
        context, _isBuilder ? ProjectDashboardScreen.route : ProjectHubScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        leading: const Icon(Icons.build_outlined),
        title: 'My Projects',
        actions: [
          IconButton(
            tooltip: _isBuilder ? 'Builder view' : 'Contractor view',
            icon: Icon(_isBuilder ? Icons.business_outlined : Icons.engineering_outlined),
            onPressed: () => setState(() => _isBuilder = !_isBuilder),
          ),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3 Active Projects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text('Q3 Performance Cycle', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  children: [
                    Icon(Icons.filter_list, size: 16),
                    SizedBox(width: 4),
                    Text('Filter', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              QuickActionCard(
                label: 'New Project',
                icon: Icons.add_circle,
                highlighted: true,
                onTap: () => Navigator.pushNamed(context, AddProjectScreen.route),
              ),
              const SizedBox(width: 12),
              const QuickActionCard(label: 'Analytics', icon: Icons.bar_chart),
            ],
          ),
          const SizedBox(height: 12),
          for (final p in MockData.projectProgress)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProjectCard(
                name: p['name']! as String,
                location: p['location']! as String,
                badge: p['badge']! as String,
                report: p['report']! as String,
                progress: (p['progress']! as num).toDouble(),
                warning: p['warning']! as bool,
                onTap: _openProject,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.textPrimary,
        onPressed: () => Navigator.pushNamed(context, AddProjectScreen.route),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BuildExBottomNav(currentIndex: 0, onTap: _goTab),
    );
  }
}
