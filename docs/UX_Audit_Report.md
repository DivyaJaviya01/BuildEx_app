# BuildEx -- UX Audit & Gaps Analysis Report

This report analyzes the high-fidelity Stitch screens in terms of MVP requirements, user journeys, and UX best practices, identifying missing screens, potential usability issues, and architectural recommendations.

---

## 1. Missing Screens Identification

While the core MVP screens specified in the PRD are present, the following supporting screens are missing from the Stitch workspace to make the application fully functional:

### Gap A: Issue Detail & Status Manager Screen
*   **Context:** In the `Issues & Defects Tracker`, the Builder views a list of reported defects. Clicking an issue card currently has no destination.
*   **Requirement:** An **`Issue Detail`** screen is needed. It should display:
    *   The full-size attached photo of the defect.
    *   Metadata: Reporter, reporting time, assigned project, and severity level badge.
    *   A scrollable **Comment/Timeline thread** (allowing the Builder and Contractor to discuss resolution).
    *   A primary action dropdown or toggle: **"Mark as Resolved"** or **"Update Severity"** (Builder only).

### Gap B: Read-Only Daily Report Review Screen
*   **Context:** Tapping a historic daily report in `Daily Reports History` should open that report for audit.
*   **Requirement:** Currently, we only have the `Daily Report Summary` screen (which has editable inputs and a large **"SUBMIT DAILY REPORT"** button). A separate **`Daily Report Audit`** screen is required for the Builder. This screen should display identical information but lock all inputs and replace the "Submit" CTA with a **"Download PDF"** or **"Approve Report"** action button.

### Gap C: Task Details & Collaboration Sheet
*   **Context:** Tapping a task card on the `My Tasks` screen should show the task details.
*   **Requirement:** A **`Task Detail`** screen or bottom-sheet containing the checklist details, a description block, attached documents, and a quick text comment thread between the Builder and the assigned Contractor.

---

## 2. UX & Usability Issues

### Issue 1: Role-Gating for Floating Action Buttons (FAB)
*   **Problem:** The yellow `+` Floating Action Button (FAB) on both **`My Tasks`** and **`My Team`** is currently visible to all users. 
*   **UX Recommendation:**
    *   On the **`My Team`** screen: The `+` FAB (which opens `Invite Team Member`) must be **hidden** for Contractors. Contractors should not have permissions to invite other personnel.
    *   On the **`My Tasks`** screen: The `+` FAB (which opens `Add New Task`) should only be visible to the **Builder** (who allocates work). Contractors should only see their assigned tasks and the "Update" action button.

### Issue 2: Empty & First-Run States
*   **Problem:** All screens are designed pre-populated with data. If a Builder registers a new account and opens the app, the empty lists will look barren and lack direction.
*   **UX Recommendation:** Design empty state placeholders for `My Projects`, `My Tasks`, and `Issues & Defects Tracker` showing:
    *   A clean, low-contrast vector illustration.
    *   A supportive title (e.g., *"No Active Projects"* or *"No Open Defects"*).
    *   A direct CTA link (e.g., *"Tap here to add your first site"*).

### Issue 3: Success Confirmation Screen
*   **Problem:** Submitting reports, logging issues, or inviting team members currently redirects the user back to parent screens instantly, which can feel abrupt and cause confusion about whether the action succeeded.
*   **UX Recommendation:** Create a unified **`Success Confirmation`** screen. It should feature:
    *   A large, animated checkmark icon.
    *   A success message (e.g., *"Daily Report locked and submitted successfully!"*).
    *   A primary button to return to the dashboard.

---

## 3. Recommended Design System & Layout Refinements

### Spacing & Grid System
*   **Consistent Touch Margins:** Ensure that all clickable rows, check circles, and dropdown selectors enforce a padding layout of `12px` to `16px` vertically. On site, operators will be tapping these fields quickly.
*   **Form Input Boundaries:** Group all form input fields in cards with a clear white background and a subtle `1px` border of `#bcc9ca` (Outline Variant) at 20% opacity. This defines the click boundaries on sunlight-glared mobile viewports.
