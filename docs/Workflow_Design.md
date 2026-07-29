# BuildEx -- End-to-End Workflow & Architecture Design

This document outlines the logical workflow, user journeys, navigation structures, and data flows for the **BuildEx** Mobile Application. It is designed to act as a technical blueprint for the Flutter frontend and database synchronization implementation.

---

## 1. User Journeys by Role

The application has two distinct user journeys tailored to role-specific requirements.

### Contractor (On-Site Operator)
*   **Core Goal:** Quick, effortless daily data entry in rugged site environments with minimal typing.
*   **Journey Map:**
    1.  **Authentication:** Login $\rightarrow$ Directed automatically to **My Projects** list.
    2.  **Selection:** Selects active project (e.g. Metro Line Phase 2A) $\rightarrow$ Lands on **Project Hub**.
    3.  **Operations:** Navigates through modules to record:
        *   *Attendance:* Toggle Present/Absent for crew with daily wage.
        *   *Progress:* Check off sub-phases in active construction stages.
        *   *Materials:* Log daily material consumption and track remaining stock.
        *   *Photos:* Snap site progress photos, tag to a stage, and add notes.
        *   *Issues:* Log new defects, attach a photo, and set priority.
    4.  **Submission:** Reviews generated summary in **Daily Report** $\rightarrow$ Submits to cloud.

### Builder (Remote Monitor)
*   **Core Goal:** Real-time visibility into cost, timeline delay alerts, and progress reports across all sites.
*   **Journey Map:**
    1.  **Authentication:** Login $\rightarrow$ Directed automatically to **My Projects** list.
    2.  **Creation (Admin only):** Taps "New Project" to spin up a site, inputs metadata, and sets active templates.
    3.  **Monitoring (Read-Only Dashboard):** Selects active project $\rightarrow$ Monitors real-time stats:
        *   Total today's expense vs. total budget.
        *   Overall completion progress percentage.
        *   Timeline feed of contractor's logged events.
        *   Review photos by date/stage and track open critical issues.

---

## 2. Mermaid Workflow & Navigation Map

The flowchart below visualizes user navigation paths, decision gates, and data pathways for both roles:

```mermaid
flowchart TD
    Start([User Opens App]) --> Login{Login Screen}
    
    %% Role Gate
    Login -- Authenticates --> RoleGate{Identify Role}
    
    %% Site Owner Flow
    RoleGate -- Builder --o BuilderProjects[My Projects List]
    BuilderProjects --> ProjectSelectBuilder[Select Project]
    BuilderProjects --> CreateProjButton{New Project Button} --> ProjectCreator[Create Project Screen]
    ProjectCreator --> SelectTemplate[Lifecycle Template Builder] --> SaveNewProj[(Database: Save Project)]
    SaveNewProj --> BuilderProjects
    
    ProjectSelectBuilder --> BuilderDash[Project Dashboard - Read Only]
    BuilderDash --> ViewDetails{Select View Details}
    ViewDetails --> ViewProgress[Monitor Phases & Sub-phases]
    ViewDetails --> ViewAttendance[Monitor Attendance & Wage Stats]
    ViewDetails --> ViewMaterials[Monitor Stock & Consumption]
    ViewDetails --> ViewPhotos[Browse Photos by Stage]
    ViewDetails --> ViewIssues[Track Open/Resolved Defects]
    ViewDetails --> ViewReports[Browse Daily Submitted Summaries]
    
    %% Contractor Flow
    RoleGate -- Contractor --o ContractorProjects[My Projects List]
    ContractorProjects --> ProjectSelectContractor[Select Project]
    ProjectSelectContractor --> ContractorHub[Project Hub - Editable]
    
    ContractorHub --> EditProgress[Mark sub-phases complete] --> CalcProgress[System Auto-Calculations]
    ContractorHub --> EditAttendance[Attendance: Add workers with daily wage]
    ContractorHub --> EditMaterials[Material Log: Enter consumption] --> CalcStock[System Stock Deduction]
    ContractorHub --> EditPhotos[Photo Log: Snap & tag to stage]
    ContractorHub --> EditIssues[Issue Log: Report defects]
    
    %% Local Data Updates
    CalcProgress --> LocalDB[(Local State & Drafts)]
    EditAttendance --> LocalDB
    CalcStock --> LocalDB
    EditPhotos --> LocalDB
    EditIssues --> LocalDB
    
    %% Report Submission Loop
    LocalDB --> DailyReportView[Compile Daily Report Summary]
    DailyReportView --> SubmitReportButton[Submit Report to Cloud]
    SubmitReportButton --> SaveCloud[(Cloud Database: Synced & Locked)]
    SaveCloud -- Push Notification / Sync --> BuilderDash
```

---

## 3. Data Flow & Dashboard Synchronization

The application relies on a **Single Source of Truth** architecture to ensure that Contractor updates propagate to the Builder's read-only dashboard.

```
+----------------------------+
|  Contractor Local Log      |  --[Local Updates (State Management)]--> (Today's Draft)
+----------------------------+                                                    |
                                                                                 |
                                                                    [Submit Daily Report]
                                                                                 |
                                                                                 v
+--------------------------+                                        +-----------------------+
|  Builder Dashboard       |  <--[Real-time Stream/Subscription]--  |    Cloud Database     |
+--------------------------+                                        +-----------------------+
```

### State Management & Lifecycle
*   **Contractor:** Updates are held in local state (e.g. Flutter Bloc/Provider). The contractor can continuously edit throughout the day. Values are saved as a "Today's Draft". Once the "Submit Daily Report" button is pressed, the record is pushed to the cloud and locked.
*   **Builder:** Subscribes to the cloud database collection via a real-time Stream (e.g., Firestore Streams). The dashboard updates dynamically in real-time as sub-phases are completed or issues are logged.

---

## 4. Overall Progress Calculation Logic

Progress metrics are completely automated to prevent errors and manual data manipulation by engineers on-site.

### 1. Stage Progress Percentage
Each construction template is composed of **N** stages, and each stage contains **M** discrete subtasks. Subtask progress is binary (Completed or Not Completed).
$$\text{Stage Progress (\%)} = \left( \frac{\text{Completed Subtasks in Stage}}{\text{Total Subtasks in Stage}} \right) \times 100$$

*   *Example:* Under **Foundation Construction**:
    *   [x] Excavation (1)
    *   [x] PCC (1)
    *   [ ] Reinforcement (0)
    *   [ ] Concrete Pouring (0)
    *   [ ] Curing (0)
    *   **Calculation:** $2 \div 5 = 40\%$ completed.

### 2. Overall Project Progress Percentage
To reflect realistic timelines, each construction stage is assigned a **weight percentage** ($\text{W}_i$) representing its complexity or duration. The sum of all weights must equal 100%.
$$\text{Overall Project Progress (\%)} = \sum_{i=1}^{N} \left( \text{Stage Progress}_i \times \text{Weight}_i \right)$$

If weights are distributed equally across the 10 stages of the default template, each stage accounts for 10% of the overall progress:
$$\text{Overall Project Progress (\%)} = \sum_{i=1}^{10} \left( \text{Stage Progress}_i \times 10\% \right)$$

---

## 5. Module-by-Module Workflows

### 1. Project Initialization & Customization
1.  **Trigger:** Builder clicks "New Project".
2.  **Data Entered:** Project Name, Location, Budget, expected completion date, and Contractor assignment.
3.  **Template Customization:**
    *   App displays the default 10-stage lifecycle template.
    *   Builder can reorder stages, delete stages, or add custom stages.
    *   Builder edits sub-phases within each stage.
4.  **Lock Gate:** Upon saving, the template structure is serialized to the database as `project_lifecycle` and locked.

### 2. Material Consumption & Stock Tracking
1.  **Trigger:** Contractor logs material consumption.
2.  **Inputs:** `Material Name` (from predefined list), `Quantity Used` (Double), `Unit` (Pill selector: Bags, CFT, Tons, Liters).
3.  **Stock Calculation:** Each project has initial material stock recorded by the Builder. System auto-calculates remaining:
    $$\text{Remaining} = \text{Initial Stock} - \sum \text{Daily Consumption}$$
4.  **Low Stock Alert:** When remaining stock falls below a configurable threshold, the Builder sees an alert on the dashboard.
5.  **Dashboard Update:** The **Stock Remaining** metric is displayed on the Project Dashboard for each material.

### 3. Worker Attendance & Wage Tracker
1.  **Trigger:** Contractor opens attendance screen.
2.  **Input:** Contractor adds workers for the day with: `Worker Name`, `Daily Wage (INR)`, and toggles `Present` / `Absent`.
3.  **Total Calculation:** System auto-calculates total wages earned per worker and amount payable.
4.  **State Save:** Saves to `daily_attendance_log` with per-worker entries.
5.  **Dashboard Update:** Builder sees total headcount, present count, and aggregate wage liability.

### 4. Site Issue Logs
1.  **Trigger:** Contractor reports a defect on-site.
2.  **Inputs:** Title, description, priority (Low/Medium/High/Critical), stage tag (dropdown of project stages), and optional camera capture.
3.  **System Action:** Generates a new issue object with status `OPEN`.
4.  **Dashboard Update:** Increments the **Open Issues** counter on the Project Dashboard. Trigger a warning highlight if priority is set to **Critical**.

### 5. Photo Storage Hierarchy
1.  **Trigger:** Contractor snaps a picture.
2.  **Inputs:** Stage selection, short text note.
3.  **Storage Logic:** The image file is uploaded to cloud storage and structured in folders organized by project, date, and construction stage:
    `projects/{project_id}/photos/{yyyy-mm-dd}/{stage_id}/{image_id}.jpg`
4.  **Dashboard Update:** Increments the **Photos Uploaded Today** metric.

### 6. Daily Report compilation
1.  **Compilation Trigger:** Contractor taps "Submit Daily Report" in the footer.
2.  **System Compilation:** The system fetches all logs created today:
    *   Calculated progress changes ($\Delta$ progress)
    *   Attendance list summary (Total Present)
    *   Total material expenditure receipts
    *   Photos captured today
    *   Active blockers or issues logged
3.  **Review Screen:** Manager reviews the compiled summary document.
4.  **Publish Gate:** Manager signs off and submits. The database updates `last_report_submitted_date` and marks today's log status as `SUBMITTED`.
