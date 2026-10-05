import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_text.dart';
import 'features/splash/splash_screen.dart';
import 'features/auth/sign_in_screen.dart';
import 'features/auth/create_account_screen.dart';
import 'features/projects/my_projects_screen.dart';
import 'features/projects/add_project_screen.dart';
import 'features/hub/project_hub_screen.dart';
import 'features/dashboard/project_dashboard_screen.dart';
import 'features/daily/daily_progress_screen.dart';
import 'features/photos/site_photos_screen.dart';
import 'features/attendance/worker_attendance_screen.dart';
import 'features/attendance/attendance_history_screen.dart';
import 'features/materials/material_log_screen.dart';
import 'features/stock/material_stock_screen.dart';
import 'features/stock/record_delivery_screen.dart';
import 'features/reports/daily_report_summary_screen.dart';
import 'features/reports/daily_reports_history_screen.dart';
import 'features/reports/daily_report_audit_screen.dart';
import 'features/checklist/phase_checklist_screen.dart';
import 'features/checklist/phase_progress_screen.dart';
import 'features/issues/report_issue_screen.dart';
import 'features/issues/issues_tracker_screen.dart';
import 'features/issues/issue_detail_screen.dart';
import 'features/tasks/my_tasks_screen.dart';
import 'features/tasks/task_detail_screen.dart';
import 'features/tasks/add_task_screen.dart';
import 'features/team/my_team_screen.dart';
import 'features/team/invite_member_screen.dart';
import 'features/profile/my_profile_screen.dart';

// Only Divya edits this file. Members: add your screen widget import +
// one route entry below, via PR. UI-only: no guards, no backend.
class BuildExApp extends StatelessWidget {
  const BuildExApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuildEx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
        ),
        textTheme: AppText.theme,
      ),
      // DEV: entry at Divya's D1 while pages are built. Krisha's splash stays '/'.
      initialRoute: MyProjectsScreen.route,
      routes: {
        SplashScreen.route: (_) => const SplashScreen(),
        CreateAccountScreen.route: (_) => const CreateAccountScreen(),
        SignInScreen.route: (_) => const SignInScreen(),
        MyProjectsScreen.route: (_) => const MyProjectsScreen(),
        AddProjectScreen.route: (_) => const AddProjectScreen(),
        ProjectHubScreen.route: (_) => const ProjectHubScreen(),
        ProjectDashboardScreen.route: (_) => const ProjectDashboardScreen(),
        DailyProgressScreen.route: (_) => const DailyProgressScreen(),
        SitePhotosScreen.route: (_) => const SitePhotosScreen(),
        WorkerAttendanceScreen.route: (_) => const WorkerAttendanceScreen(),
        AttendanceHistoryScreen.route: (_) => const AttendanceHistoryScreen(),
        MaterialLogScreen.route: (_) => const MaterialLogScreen(),
        MaterialStockScreen.route: (_) => const MaterialStockScreen(),
        RecordDeliveryScreen.route: (_) => const RecordDeliveryScreen(),
        DailyReportSummaryScreen.route: (_) => const DailyReportSummaryScreen(),
        DailyReportsHistoryScreen.route: (_) => const DailyReportsHistoryScreen(),
        DailyReportAuditScreen.route: (_) => const DailyReportAuditScreen(),
        PhaseChecklistScreen.route: (_) => const PhaseChecklistScreen(),
        PhaseProgressScreen.route: (_) => const PhaseProgressScreen(),
        ReportIssueScreen.route: (_) => const ReportIssueScreen(),
        IssuesTrackerScreen.route: (_) => const IssuesTrackerScreen(),
        IssueDetailScreen.route: (_) => const IssueDetailScreen(),
        MyTasksScreen.route: (_) => const MyTasksScreen(),
        TaskDetailScreen.route: (_) => const TaskDetailScreen(),
        AddTaskScreen.route: (_) => const AddTaskScreen(),
        MyTeamScreen.route: (_) => const MyTeamScreen(),
        InviteMemberScreen.route: (_) => const InviteMemberScreen(),
        MyProfileScreen.route: (_) => const MyProfileScreen(),
      },
    );
  }
}
