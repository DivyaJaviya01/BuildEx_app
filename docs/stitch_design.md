# BuildTrack -- Stitch Design & Screen Synchronization Matrix

This document registers the high-fidelity UI templates designed in **Stitch** for the **BuildTrack** mobile application. Developers should use these screen IDs and metadata to synchronize layouts, styling tokens, and navigation flows with the Flutter codebase.

---

## 1. Project Information
*   **Stitch Project URL:** [Stitch Canvas](https://stitch.withgoogle.com/projects/6775857487309455360)
*   **Project ID:** `6775857487309455360`
*   **Design System Asset:** `assets/aa2418954bae4b9eb3550e2283dd4401`
*   **Base Layout Resolution:** Mobile standard `390px` width (renders as `780px` screenshot at 2x).

---

## 2. Design System Tokens

### Colors (Tailwind Reference)
*   **Primary Teal:** `#00696e` (Brand header background, primary structural accents)
*   **Accent Yellow:** `#FFC800` / `#fec700` (Action color, reserved for primary CTAs and active nav states)
*   **Background Canvas:** `#F2F8F8` (Slight cool gray tint to reduce glare)
*   **Card Container:** `#FFFFFF` (Level 1 surfaces)
*   **Text colors:** 
    *   Dark Charcoal (`#0f1e1f`) for body & headlines
    *   Slate Gray (`#6d797a`) for helper text & captions
    *   Red/Crimson (`#ba1a1a`) for errors & critical status

### Spacing & Shapes
*   **Page Margin:** `16px` padding on all mobile boundaries (`px-page-padding`)
*   **Touch Targets:** Minimum `44px` height/width (`h-touch-target-min`)
*   **Card Corners:** `10px` radius (`rounded-[10px]` or `rounded-xl`)
*   **Buttons & Inputs:** `8px` radius (`rounded-lg`)

---

## 3. Screen Synchronization Matrix

| Screen Name | Stitch Screen ID | Viewport Width | User Role | Purpose / Trigger |
| :--- | :--- | :--- | :--- | :--- |
| **Sign In** | `e716a31a16584ac4aa47c273d1ea87ba` | 780px (390px) | All Users | Login page. Redirects to `My Projects` upon success. |
| **Create Account** | `3a0d042f6a414326860e3b61374a77d4` | 780px (390px) | Guest | User registration. |
| **My Projects** | `44ad4540281d4ca0898c2fe2a4508216` | 780px (390px) | All Users | Lists assigned sites. Includes the Quick Update edit shortcut next to project names. |
| **Add New Project** | `f46110e352dd4f6f8fa6e1f6e7c34b01` | 780px (390px) | Site Builder | Admin panel to register a new construction site. |
| **Project Hub** | `edcb32cd76d647929448b4f8880d8d73` | 780px (390px) | Site Manager | The daily logging checklist dashboard for managers on site. |
| **Project Dashboard** | `c041fbbbbc1d49b39921bea8fdb1e3c3` | 780px (390px) | Site Builder | Remote read-only dashboard monitoring costs and checklist logs. |
| **Daily Progress** | `fbe6099b23044bee967d4270ae7f4e01` | 780px (390px) | Site Manager | Text log to update daily physical progress notes. |
| **Site Photos** | `86113211eb28489381a6f0f9caef4e2d` | 780px (390px) | Site Manager | Gallery and camera interface to log daily site photos. |
| **Worker Attendance** | `af60e6b8087a4cd6a67a70ca2e3b60e` | 780px (390px) | Site Manager | Daily crew roster check-in (Present/Absent toggles). |
| **Attendance History** | `dda387cd60584ff68d3c3293385dafcf` | 780px (390px) | Site Builder | Calendar-based log to audit past crew presence lists. |
| **Material Log** | `39f244bc9c9745eda6b6143bafbfb70b` | 780px (390px) | Site Manager | Form to log concrete/sand material quantities. Responsive layout. |
| **Report Issue** | `76203631429c47f498b7a1989506b5bc` | 780px (390px) | Site Manager | Premium defect report form with color-coded severity buttons. |
| **Issue Detail** | `8f23f2c3376d440dbe13e7f5681d8d91` | 780px (390px) | All Users | Detailed defect tracker timeline with comments and resolution CTA. |
| **Daily Report Summary** | `1ed6f3d594b449508a67a70ca2e3b60e` | 780px (390px) | Site Manager | Review daily log details before locking and cloud submission. |
| **Daily Report Audit** | `f955a7a5c8574b45a5403ae97e77a539` | 780px (390px) | Site Builder | Read-only audit view of historical daily logs with approval controls. |
| **Daily Reports History** | `e48c5a51b48a4b0188a37a266a0f79fa` | 780px (390px) | Site Builder | Historic review matrix of all locked reports. |
| **Issues & Defects Tracker**| `37b3a92c96b7444c89b17c8f9ce2fc48` | 780px (390px) | Site Builder | Master tracker board for all active site defect flags. |
| **My Tasks** | `6fc9ba7256b740f7ab526454baf71478` | 780px (390px) | All Users | Personal task checklist. Contains the yellow `+` Add FAB. |
| **Task Details** | `4439d870eaf4484b88b1b58547b5fb25` | 780px (390px) | All Users | Details of a task, checklist sub-tasks, and discussion comments. |
| **Add New Task** | `ed5624f9ad8b4467987c58c57815906a` | 780px (390px) | All Users | Triggered by tasks FAB. Opens task assignment form. |
| **My Team** | `8b06dea2a4bf42e8bbc74416dd88f146` | 780px (390px) | All Users | Roster of active staff. Contains the yellow `+` FAB for Builders. |
| **Invite Team Member** | `7e385eb03db9470795e16f596d7f78ca` | 780px (390px) | Site Builder | Form to invite new manager or laborer by email and role. |
| **My Profile** | `b136f4d8fe4e44a9b1d1d6307717463d` | 780px (390px) | All Users | Account details, notification alerts toggles, and Log Out button. |

---

## 4. Layout Synchronization Guidelines
1.  **Unified Viewport Constraints:** All pages must use a fixed base width of `390` in CSS/Flutter viewport scaling (`max-width: 390px` on root containers) to match the high-fidelity screenshot dimensions exactly.
2.  **Bidirectional Flex Formatting:** In list cards, always specify `min-w-0 flex-1` on text containers and `shrink-0` on status indicators or quantity fields. This stops overflow clipping on narrow viewports.
3.  **Centered Headers & Navbars:** Fixed headers and bottom navbars must be centered with the viewport body (`left-0 right-0 mx-auto`) to align with the core page container on all screen widths.
