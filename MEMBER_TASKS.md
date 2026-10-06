# BuildEx — Member Tasks & Start Order

Figma truth: `docs/figma_screens/` (29 PNGs). UI-only, static mock data.
Full rules: `TEAM_GUIDE.md`. Figma→file map quirks:
`Progress Notes.png` = Daily Progress form · `Daily progress.png` = checklist screen ·
`Phase Progress-1.png` = duplicate variant (ignore, one route) ·
`My Project.png` = My Projects · `My task.png` = My Tasks.

## Krisha — entry + shared tabs (9 screens)

Build in this order (each row = 1 branch = 1 commit = 1 PR):

| # | Figma PNG | Route | File | Done |
|---|---|---|---|---|
| K1 | `Splash  Screen.png` | `/` | `BuildEx/buildex/lib/features/splash/splash_screen.dart` | ☐ |
| K2 | `Create Account.png` | `/create-account` | `BuildEx/buildex/lib/features/auth/create_account_screen.dart` | ☐ |
| K3 | `Sign In.png` | `/sign-in` | `BuildEx/buildex/lib/features/auth/sign_in_screen.dart` | ☐ |
| K4 | `My task.png` | `/tasks` | `BuildEx/buildex/lib/features/tasks/my_tasks_screen.dart` | ☐ |
| K5 | `Task Details.png` | `/tasks/detail` | `BuildEx/buildex/lib/features/tasks/task_detail_screen.dart` | ☐ |
| K6 | `Add New Task.png` | `/tasks/add` | `BuildEx/buildex/lib/features/tasks/add_task_screen.dart` | ☐ |
| K7 | `My Team.png` | `/team` | `BuildEx/buildex/lib/features/team/my_team_screen.dart` | ☐ |
| K8 | `Invite Team Member.png` | `/team/invite` | `BuildEx/buildex/lib/features/team/invite_member_screen.dart` | ☐ |
| K9 | `My Profile.png` | `/profile` | `BuildEx/buildex/lib/features/profile/my_profile_screen.dart` | ☐ |

DB design: `users` table. Widgets to use: `AppTextField`+validator, `AppDropdown`, `PrimaryButton`, `StatusBadge`, `WorkerTile`, `ChecklistRow`.

## Jainil — hub + 8 children (9 screens)

| # | Figma PNG | Route | File | Done |
|---|---|---|---|---|
| J1 | `Project Hub.png` | `/hub` | `BuildEx/buildex/lib/features/hub/project_hub_screen.dart` | ☐ |
| J2 | `Daily progress.png` | `/checklist` | `BuildEx/buildex/lib/features/checklist/phase_checklist_screen.dart` | ☐ |
| J3 | `Progress Notes.png` | `/daily-progress` | `BuildEx/buildex/lib/features/daily/daily_progress_screen.dart` | ☐ |
| J4 | `Site Photos.png` | `/site-photos` | `BuildEx/buildex/lib/features/photos/site_photos_screen.dart` | ☐ |
| J5 | `Worker Attendance - 390px Base.png` | `/attendance` | `BuildEx/buildex/lib/features/attendance/worker_attendance_screen.dart` | ☐ |
| J6 | `Attendance History.png` | `/attendance/history` | `BuildEx/buildex/lib/features/attendance/attendance_history_screen.dart` | ☐ |
| J7 | `Material Log - 390px Base.png` | `/material-log` | `BuildEx/buildex/lib/features/materials/material_log_screen.dart` | ☐ |
| J8 | `Report Issue - Premium Redesign.png` | `/report-issue` | `BuildEx/buildex/lib/features/issues/report_issue_screen.dart` | ☐ |
| J9 | `Daily Report Summary.png` | `/report-summary` | `BuildEx/buildex/lib/features/reports/daily_report_summary_screen.dart` | ☐ |

DB design: `daily_logs`, `daily_attendance`, `daily_material_usages`, `phases`, `sub_phases`.
Widgets to use: `SegmentedStatus`, `SeverityChips`, `CaptureBox`, `WorkerTile`, `ChecklistRow`, `StatTriple`, `SearchField`, `AlertBanner`, `HeroImageCard`, `PrimaryButton`.

## Divya (leader) — projects + review + shell (10 screens)

| # | Figma PNG | Route | File | Done |
|---|---|---|---|---|
| D1 | `My Project.png` | `/projects` | `BuildEx/buildex/lib/features/projects/my_projects_screen.dart` | ☐ |
| D2 | `Add New Project.png` | `/projects/add` | `BuildEx/buildex/lib/features/projects/add_project_screen.dart` | ☐ |
| D3 | `Project Dashboard.png` | `/dashboard` | `BuildEx/buildex/lib/features/dashboard/project_dashboard_screen.dart` | ☐ |
| D4 | `Phase Progress.png` | `/phase-progress` | `BuildEx/buildex/lib/features/checklist/phase_progress_screen.dart` | ☐ |
| D5 | `Material Stock Panel.png` | `/stock` | `BuildEx/buildex/lib/features/stock/material_stock_screen.dart` | ☐ |
| D6 | `Record Stock Delivery.png` | `/stock/record` | `BuildEx/buildex/lib/features/stock/record_delivery_screen.dart` | ☐ |
| D7 | `Issues & Defects Tracker.png` | `/issues` | `BuildEx/buildex/lib/features/issues/issues_tracker_screen.dart` | ☐ |
| D8 | `Issue Detail.png` | `/issues/detail` | `BuildEx/buildex/lib/features/issues/issue_detail_screen.dart` | ☐ |
| D9 | `Daily Reports History.png` | `/reports-history` | `BuildEx/buildex/lib/features/reports/daily_reports_history_screen.dart` | ☐ |
| D10 | `Daily Report Audit.png` | `/report-audit` | `BuildEx/buildex/lib/features/reports/daily_report_audit_screen.dart` | ☐ |

Plus shared (only Divya): `lib/app.dart`, `lib/resources/**`, `lib/models/**`, `lib/data/mock_data.dart`.
DB design: `projects`, `material_stock`, `site_issues` + ER consolidation.
Widgets to use: `ProgressRing`, `FilterChips`, `AppDropdown`, `AppDateField`, `AlertBanner`, `HeroImageCard`.

## How to start (every member, every screen)

```bash
git checkout main
git pull origin main
git checkout -b <name>-<screen>     # e.g. krisha-splash, jainil-hub, divya-projects
# edit ONLY your file from the table above
flutter run                          # test your screen before committing
git add <your file>                  # never git add .
git commit -m "feat(<area>): <what> UI"   # e.g. feat(auth): sign-in UI
git push -u origin <name>-<screen>
# GitHub: open PR to main, 1 teammate reviews, Divya merges
```

Screen recipe: open your PNG in `docs/figma_screens/` → copy section order + texts →
compose with shared widgets from `lib/resources/widgets/` → static data from
`lib/data/mock_data.dart` → match 390px, teal + yellow, Inter.
Forms: `GlobalKey<FormState>` + `AppTextField(validator:)` + `dispose()` controllers.
