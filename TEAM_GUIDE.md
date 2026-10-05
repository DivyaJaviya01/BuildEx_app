# BuildEx — Team Guide (Read First)

For Divya (leader), Krisha, Teammate-3 (confirm: Jainil or Dipali — rename branches accordingly).
Same workflow as TransitOps. UI-only for TCIE-II. No backend wiring until TSEE.

`main` always has the latest shared files (`app.dart`, `core/theme/*`, `core/widgets/*`).
Start every task from `main`.

Build order follows the Figma hierarchy on the right, starting from `Splash Screen`.

## 1. Setup (once per PC)

```bash
git clone https://github.com/DivyaJaviya01/BuildEx_app.git
cd BuildEx_app
git checkout main
git pull origin main
git config user.name "YOUR NAME"
git config user.email "your@email.com"
```

App lives in `BuildEx/buildex/`. Open that folder in VS Code / Android Studio.
Run with `flutter run` (no database needed now — all data is static mock).

## 2. Folder ownership (edit ONLY your files)

Shared — only Divya edits:
`BuildEx/buildex/lib/app.dart`, `lib/core/**`, `lib/models/**`, `lib/data/mock_data.dart`, `pubspec.yaml`.

| Who | Screens (Figma right-tree order) | Files (edit ONLY these) |
|---|---|---|
| Divya (M1 shell) | Splash Screen, Create Account, Sign In, My Projects, Add New Project, Project Hub, Project Dashboard, BottomNav shell | `features/splash/*`, `features/auth/*`, `features/projects/*`, `features/hub/*`, `features/dashboard/*` + shared above |
| M2 daily flow | Daily Progress, Site Photos, Worker Attendance, Attendance History, Material Log, Material Stock Panel, Record Stock Delivery, Daily Report Summary, Daily Reports History, Daily Report Audit | `features/daily/*`, `features/photos/*`, `features/attendance/*`, `features/materials/*`, `features/stock/*`, `features/reports/*` |
| Krisha shared/issues | Phase Checklist, Phase Progress, Report Issue, Issues Tracker, Issue Detail, My Tasks, Task Details, Add New Task, My Team, Invite Member, My Profile | `features/checklist/*`, `features/issues/*`, `features/tasks/*`, `features/team/*`, `features/profile/*` |

Full file map is in section 7. One file = one screen. Never edit another member's file.

DB design split (TCIE-II, design only — no wiring):
- Divya: `users`, `projects` + ER consolidation. Source: `system_design/04_class_diagram_database.md:120`
- M2: `daily_logs`, `daily_attendance`, `daily_material_usages`, `material_stock`
- Krisha: `phases`, `sub_phases`, `site_issues`

Models in `lib/models/` already mirror these tables with `fromJson`/`toJson` stubs. Keep everything static via `lib/data/mock_data.dart`.

## 3. How to work (no conflicts)

```bash
# 1. start fresh from main every time
git checkout main
git pull origin main

# 2. one branch per screen
git checkout -b <yourname>-<screen>
# examples: divya-splash, krisha-tasks, m2-attendance

# 3. edit ONLY your file, add ONLY that file
git add BuildEx/buildex/lib/features/tasks/my_tasks_screen.dart
git commit -m "feat(tasks): my tasks UI"
git push -u origin <yourname>-<screen>

# 4. on GitHub: PR your branch -> main. Test with flutter run first. Ask 1 teammate to review, then Divya merges.
```

Why no conflicts: each person touches different files. Never run `git add .`. Always `pull` before a new branch.

## 4. Rules (strict)

DO:
- 1 screen = 1 branch = 1 commit = 1 push (equal history)
- `git pull` before starting work every day
- `git add <your file>` — never `git add .`
- Branch names: `divya-*`, `krisha-*`, `m2-*`
- Static mock data only. No Firebase/REST wiring yet (TSEE does that)
- Match Figma exactly (390px base, teal `#20AEB5` + yellow `#FFC800`, Inter font). Tokens: `docs/Design.md:81`, `docs/Design.md:135`

DO NOT:
- Never push directly to `main`. Only your branch, then PR
- Never force-push
- Never edit another member's file or Divya's shared files
- Never commit `build/`, `.dart_tool/`, `.idea/`, `*.apk`, secrets (already in `.gitignore`)
- Never commit with another member's name/email (check `git config user.name`)
- Never commit binaries (`.exe`, `.dll`, `.zip`, images except logo asset)

## 5. Check equal work

```bash
git shortlog -sne --all
```

Each member needs 8–11 commits + PRs (one per screen) before TCIE-II.

## 6. If conflict happens

1. Stop. Do NOT force-push.
2. On your branch: `git pull origin main`
3. Keep both parts, save, `git add <file>`, `git commit -m "Resolve merge"`, `git push`
4. Ask in the group if stuck.

## 7. File map (do not create duplicates)

```
BuildEx/buildex/lib/
  main.dart
  app.dart
  core/theme/app_colors.dart, app_text.dart
  core/widgets/app_bar.dart, primary_button.dart, status_badge.dart, info_card.dart
  models/user.dart, project.dart, phase.dart, daily_log.dart, attendance.dart, material.dart, issue.dart
  data/mock_data.dart
  features/splash/splash_screen.dart              (Divya)
  features/auth/create_account_screen.dart        (Divya)
  features/auth/sign_in_screen.dart               (Divya)
  features/projects/my_projects_screen.dart       (Divya)
  features/projects/add_project_screen.dart       (Divya)
  features/hub/project_hub_screen.dart            (Divya)
  features/dashboard/project_dashboard_screen.dart (Divya)
  features/daily/daily_progress_screen.dart       (M2)
  features/photos/site_photos_screen.dart         (M2)
  features/attendance/worker_attendance_screen.dart (M2)
  features/attendance/attendance_history_screen.dart (M2)
  features/materials/material_log_screen.dart     (M2)
  features/stock/material_stock_screen.dart       (M2)
  features/stock/record_delivery_screen.dart      (M2)
  features/reports/daily_report_summary_screen.dart (M2)
  features/reports/daily_reports_history_screen.dart (M2)
  features/reports/daily_report_audit_screen.dart (M2)
  features/checklist/phase_checklist_screen.dart  (Krisha)
  features/checklist/phase_progress_screen.dart   (Krisha)
  features/issues/report_issue_screen.dart        (Krisha)
  features/issues/issues_tracker_screen.dart      (Krisha)
  features/issues/issue_detail_screen.dart         (Krisha)
  features/tasks/my_tasks_screen.dart             (Krisha)
  features/tasks/task_detail_screen.dart          (Krisha)
  features/tasks/add_task_screen.dart             (Krisha)
  features/team/my_team_screen.dart               (Krisha)
  features/team/invite_member_screen.dart         (Krisha)
  features/profile/my_profile_screen.dart         (Krisha)
```

Routes for all of the above live in `lib/app.dart` (Divya only).
