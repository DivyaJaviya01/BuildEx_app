# BuildEx - System Design: UI & Mobile Architecture

This document describes the Flutter mobile application's UI hierarchy, state management, navigation structure, and visual design system.

---

## 1. App Navigation & Screen Hierarchy

BuildEx is split into two primary screen experiences based on the logged-in user's role (Builder vs. Contractor).

```mermaid
flowchart TD
    %% Base Onboarding
    Start([Launch App]) --> AuthScreen[1. Auth Screen: Login / Register]
    AuthScreen --> RoleCheck{Role Check?}

    %% Contractor Screens
    RoleCheck -- Contractor --> C_Projects[2. Contractor Project List]
    C_Projects --> C_Home[3. Contractor Project Home]
    C_Home --> C_DPR[a. Log DPR Form]
    C_Home --> C_Phases[b. Phase & Sub-points Checklist]
    C_Home --> C_Material[c. Log Material Consumption]
    C_Home --> C_Issue[d. Report site defect Screen]

    %% Builder Screens
    RoleCheck -- Builder --> B_Projects[2. Builder Project List]
    B_Projects --> B_Dash[3. Builder Dashboard]
    B_Dash --> B_Progress[a. Phase Percentage Tracker]
    B_Dash --> B_StockPanel[b. Material Stock & Alerts Panel]
    B_Dash --> B_IssueTracker[c. Active Issues & Snag Tracker]

    %% Custom formatting
    classDef onboarding fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,color:#0f1e1f;
    classDef contractor fill:#eceff1,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef builder fill:#fff9c4,stroke:#fbc02d,stroke-width:2px,color:#f57f17;
    
    class Start,AuthScreen,RoleCheck onboarding;
    class C_Projects,C_Home,C_DPR,C_Phases,C_Material,C_Issue contractor;
    class B_Projects,B_Dash,B_Progress,B_StockPanel,B_IssueTracker builder;
```

### Detailed Screen Profiles

#### A. Shared Screens
* **Login / Register Screen:** Email and password auth. Implicit role assignment (User registers via email; Builder by default, Contractor if previously assigned to a site via email).
* **Project Selection Screen:** Grid/list of active projects assigned to the user.

#### B. Contractor App Screens
* **Contractor Project Home:** Quick actions panel to log work, mark attendance, log material consumption, or check stock.
* **Phase Checklist Screen:** Collapsible list showing all Phases (e.g. Substructure) and Sub-points (e.g. Area Inspection) with simple checkmark boxes.
* **Daily Log Form (DPR):** Single-page scrollable form to input:
  * Worker attendance with name and daily wage (Present/Absent).
  * Machine operating hours.
  * Material quantities consumed today (deducted from stock).
  * Photo attachment from camera.
* **Material Consumption Form:** Select material from stock list and enter quantity used.
* **Snag Report Form:** Snaps a photo of the site issue, writes a brief description, and selects severity (Low/Medium/High).

#### C. Builder App Screens
* **Builder Dashboard Screen:** The primary screen for the Builder. Includes:
  * Overall project completion percentage.
  * Quick-stats cards: *Low Stock Alerts*, *Active Snags*, *Today's Labor Count*.
* **Phase Progress Screen:** Visual progress bars for each phase (e.g. *Phase 2 Digging: 75% completed*).
* **Material Stock Panel:** View stock levels per material, consumption trends, and low-stock alerts.
* **Site Issues Panel:** Lists active defects with photo thumbnails. Tapping an issue shows the before/after photos and the "Close Ticket" button.

---

## 2. State Management Architecture

BuildEx uses the **BLoC (Business Logic Component)** pattern to separate the UI layer from the database operations.

```mermaid
flowchart LR
    UI[Flutter Widget / UI] -- 1. Trigger Event --> BLoC[BLoC / State Controller]
    BLoC -- 2. Call DB API --> Repository[Repository / Data Service]
    Repository -- 3. Fetch/Update --> DB[(Firebase / REST API)]
    DB -- 4. Return Data/Model --> Repository
    Repository -- 5. Push Model --> BLoC
    BLoC -- 6. Emit State --> UI
```

### Core BLoCs & States

1. **`AuthBloc`**
   * *Events:* `AppLaunched`, `LoginSubmitted`, `LogoutRequested`, `SignUpSubmitted`.
   * *States:* `AuthLoading`, `Authenticated(User)`, `Unauthenticated`, `AuthError`.
2. **`ProjectProgressBloc`**
   * *Events:* `LoadProjectProgress`, `ToggleSubpointCompletion(subPhaseId)`.
   * *States:* `ProgressLoading`, `ProgressLoaded(ProjectModel)`, `ProgressSyncError`.
3. **`MaterialStockBloc`**
   * *Events:* `LoadStockLevels`, `RecordStockDelivery(MaterialStock)`, `LogConsumption(usage)`.
   * *States:* `StockLoading`, `StockLoaded(List<MaterialStock>)`, `LowStockAlert`, `StockActionSuccess`.
4. **`DailyLogBloc`**
   * *Events:* `SubmitDPR(DailyLog)`, `LoadDPRHistory`.
   * *States:* `LogSubmitting`, `LogSubmittedSuccess`, `LogHistoryLoaded`.
5. **`SiteIssueBloc`**
   * *Events:* `LogNewIssue`, `ResolveIssue(issueId, fixPhotoUrl)`, `CloseIssue(issueId)`.
   * *States:* `IssuesLoading`, `IssuesLoaded(List<SiteIssue>)`, `IssueUpdatedSuccess`.

---

## 3. Design System & Styling Tokens

To create a clean and professional look matching the construction environment, BuildEx uses the following design tokens:

### A. Color Palette
* **Primary (Brand Identity):** `#00696E` (Deep Construction Teal)
* **Secondary (Accents & Primary Buttons):** `#FFC800` (Safety Yellow)
* **Background Dark (Builder Mode/Header):** `#0F1E1F` (Charcoal/Dark Teal)
* **Background Light (Contractor Input Forms):** `#F2F8F8` (Off-white/Muted Ice)
* **Status Colors:**
  * *Pending/Alert:* `#D32F2F` (Alert Red)
  * *Arriving/In-Progress:* `#FBC02D` (Amber Yellow)
  * *Delivered/Closed:* `#388E3C` (Success Green)

### B. Typography
* **Primary Font:** `Inter` (Standard, clean sans-serif for numbers, tables, and lists)
* **Secondary Font:** `Outfit` (Modern, rounded font used for large headings and dashboard metrics)
* **Scale:**
  * Title/Progress Hero: `32px` (Bold)
  * Sub-headings: `18px` (Medium)
  * Body/Logs: `14px` (Regular)
  * Labels/Details: `12px` (Light)
