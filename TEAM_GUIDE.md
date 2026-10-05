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

Shared widgets (`lib/core/widgets/`, from Figma PNG analysis in `docs/figma_screens/`):
`app_bar`, `bottom_nav_bar` (cream bg + teal pill, see `BottomNavBar.png`),
`primary_button`, `status_badge`, `info_card`, `app_text_field`, `section_header`,
`progress_ring`, `stat_card`, `filter_chips`, `segmented_chips`, `severity_chips`,
`worker_tile`, `checklist_row`, `capture_box`, `alert_banner`, `hero_image_card`, `search_field`.

Figma file → screen mapping (export names differ from screen titles):
- `Progress Notes.png` = Daily Progress form (Jainil)
- `Daily progress.png` = Today's Tasks & Checklist → `phase_checklist_screen.dart` (Jainil)
- `Phase Progress.png` + `Phase Progress-1.png` = same screen, `-1` variant shows BottomNav (single route)
- `My Project.png` = My Projects, `My task.png` = My Tasks (owner files keep plural names)

| Who | Screens (Figma right-tree order) | Files (edit ONLY these) |
|---|---|---|
| Divya (leader + shell) | My Projects, Add New Project, Project Dashboard, Phase Progress, Material Stock Panel, Record Stock Delivery, Issues Tracker, Issue Detail, Daily Reports History, Daily Report Audit (10) | `features/projects/*`, `features/dashboard/*`, `features/checklist/phase_progress_screen.dart`, `features/stock/*`, `features/issues/issues_tracker_screen.dart`, `features/issues/issue_detail_screen.dart`, `features/reports/daily_reports_history_screen.dart`, `features/reports/daily_report_audit_screen.dart` + shared (`app.dart`, `core/**`, `models/**`, `data/mock_data.dart`) |
| Jainil (hub flow) | Project Hub + 8 children: Phase Checklist, Daily Progress, Site Photos, Worker Attendance, Attendance History, Material Log, Report Issue, Daily Report Summary (9) | `features/hub/*`, `features/checklist/phase_checklist_screen.dart`, `features/daily/*`, `features/photos/*`, `features/attendance/*`, `features/materials/*`, `features/issues/report_issue_screen.dart`, `features/reports/daily_report_summary_screen.dart` |
| Krisha (entry + shared) | Splash Screen, Create Account, Sign In, My Tasks, Task Details, Add New Task, My Team, Invite Member, My Profile (9) | `features/splash/*`, `features/auth/*`, `features/tasks/*`, `features/team/*`, `features/profile/*` |

Full file map is in section 7. One file = one screen. Never edit another member's file.

DB design split (TCIE-II, design only — no wiring):
- Divya: `projects`, `material_stock`, `site_issues` + ER consolidation. Source: `system_design/04_class_diagram_database.md:120`
- Jainil: `daily_logs`, `daily_attendance`, `daily_material_usages`, `phases`, `sub_phases`
- Krisha: `users` (auth flow)

Models in `lib/models/` already mirror these tables with `fromJson`/`toJson` stubs. Keep everything static via `lib/data/mock_data.dart`.

## 3. How to work (no conflicts)

```bash
# 1. start fresh from main every time
git checkout main
git pull origin main

# 2. one branch per screen
git checkout -b <yourname>-<screen>
# examples: divya-projects, jainil-hub, krisha-splash

# 3. edit ONLY your file, add ONLY that file
git add BuildEx/buildex/lib/features/tasks/my_tasks_screen.dart
git commit -m "feat(tasks): my tasks UI"
git push -u origin <yourname>-<screen>

# 4. on GitHub: PR your branch -> main. Test with flutter run first. Ask 1 teammate to review, then Divya merges.
```

Why no conflicts: each person touches different files. Never run `git add .`. Always `pull` before a new branch.

## 4. Rules (strict)

FORM RULES (faculty pattern — viva will probe these):
- Forms use `GlobalKey<FormState>` + `AppTextField(validator: ...)` + `_formKey.currentState!.validate()` (see `demo_app_NV/lib/loginscreen.dart:46`)
- Every `TextEditingController` is created in `State` and released in `dispose()` (`demo_app_NV/lib/loginscreen.dart:97`)
- Date fields use `AppDateField` (has the `mounted` check after `showDatePicker` built in)
- Dropdowns use `AppDropdown` (faculty `DropdownButton` pattern, `demo_app_NV/lib/registration.dart:118`)

DO:
- 1 screen = 1 branch = 1 commit = 1 push (equal history)
- `git pull` before starting work every day
- `git add <your file>` — never `git add .`
- Branch names: `divya-*`, `jainil-*`, `krisha-*`
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

## 7. Push / pull rules (avoid conflicts later)

Golden sequence before every push:

```bash
git checkout <your-branch>
git add <your file>                  # never git add .
git commit -m "feat(<area>): <what> UI"
git fetch origin                     # check what moved on remote
git log --oneline main..origin/main  # read-only: commits you don't have yet
git pull --rebase origin main        # replay your work on top, no merge commits
git push -u origin <your-branch>     # first time; afterwards plain git push
```

Rules:
- `main` moves only via PR on GitHub (1 review, Divya merges). Direct `git push origin main` is for Divya's setup commits only.
- NEVER `git push --force` / `--force-with-lease`. If push is rejected (non-fast-forward), someone else landed first: `git fetch` + `git pull --rebase origin main`, resolve, push again.
- Uncommitted work blocks rebase: `git stash push -m "wip" -- <path>`, pull, `git stash pop`.
- Pull `main` into your branch at least once before opening a PR.
- If a PR shows conflicts: resolve in YOUR branch (`git pull origin main`, fix files, `git add`, `git commit -m "Resolve merge"`, `git push`), never on `main`.
- `.idea/`, `.dart_tool/`, `build/`, platform folders are git-ignored: if Android Studio offers "Add Files to Git" for them, always Cancel/untick.

## 8. File map (do not create duplicates)

```
BuildEx/buildex/lib/
  main.dart
  app.dart
  core/theme/app_colors.dart, app_text.dart
  core/widgets/app_bar.dart, primary_button.dart, status_badge.dart, info_card.dart
  models/user.dart, project.dart, phase.dart, daily_log.dart, attendance.dart, material.dart, issue.dart
  data/mock_data.dart
  features/splash/splash_screen.dart              (Krisha)
  features/auth/create_account_screen.dart        (Krisha)
  features/auth/sign_in_screen.dart               (Krisha)
  features/projects/my_projects_screen.dart       (Divya)
  features/projects/add_project_screen.dart       (Divya)
  features/hub/project_hub_screen.dart            (Jainil)
  features/dashboard/project_dashboard_screen.dart (Divya)
  features/daily/daily_progress_screen.dart       (Jainil)
  features/photos/site_photos_screen.dart         (Jainil)
  features/attendance/worker_attendance_screen.dart (Jainil)
  features/attendance/attendance_history_screen.dart (Jainil)
  features/materials/material_log_screen.dart     (Jainil)
  features/stock/material_stock_screen.dart       (Divya)
  features/stock/record_delivery_screen.dart      (Divya)
  features/reports/daily_report_summary_screen.dart (Jainil)
  features/reports/daily_reports_history_screen.dart (Divya)
  features/reports/daily_report_audit_screen.dart (Divya)
  features/checklist/phase_checklist_screen.dart  (Jainil)
  features/checklist/phase_progress_screen.dart   (Divya)
  features/issues/report_issue_screen.dart        (Jainil)
  features/issues/issues_tracker_screen.dart      (Divya)
  features/issues/issue_detail_screen.dart         (Divya)
  features/tasks/my_tasks_screen.dart             (Krisha)
  features/tasks/task_detail_screen.dart          (Krisha)
  features/tasks/add_task_screen.dart             (Krisha)
  features/team/my_team_screen.dart               (Krisha)
  features/team/invite_member_screen.dart         (Krisha)
  features/profile/my_profile_screen.dart         (Krisha)
```

Routes for all of the above live in `lib/app.dart` (Divya only).
