# BuildEx -- Use Case Diagram & Stitch Design Mapping

This document provides a comprehensive **Use Case Diagram** for the BuildEx Mobile Application. It details the interactions between different roles (Actors) and the system functionality (Use Cases), mapping each directly to the registered high-fidelity **Stitch Design screens**.

---

## 1. Mermaid Use Case Diagram

The diagram below visualizes the system boundaries, actors, and use cases. It demonstrates who can perform each function and categorizes the capabilities into functional sub-modules.

```mermaid
flowchart LR
    %% Actors
    subgraph Actors ["Actors"]
        direction TB
        C["👷 Contractor<br/>(On-Site Operator)"]
        B["👑 Builder<br/>(Owner / Approver)"]
        AU["👥 All Users<br/>(Contractor & Builder)"]
        G["👤 Guest"]
    end

    %% Role inheritance/generalization
    C -.-> AU
    B -.-> AU
    G -.-> AU

    %% System Boundary
    subgraph BuildEx ["🛡️ BuildEx System Boundary"]
        direction TB
        
        %% Authentication Use Cases
        subgraph Auth ["Authentication"]
            UC_Register(["Register Account"])
            UC_Login(["Sign In"])
            UC_Profile(["Manage Profile & Settings"])
            UC_Logout(["Log Out"])
        end

        %% Project Management Use Cases
        subgraph ProjMgmt ["Project Management"]
            UC_ViewProj(["View Assigned Projects"])
            UC_AddProj(["Add New Project"])
            UC_ManageTeam(["Invite/Manage Team"])
        end

        %% Daily Operations (Contractor Core)
        subgraph Ops ["Daily Site Operations (Contractor Hub)"]
            UC_LogProgress(["Log Daily Progress Notes"])
            UC_LogPhotos(["Log Site Photos"])
            UC_LogAttendance(["Record Worker Attendance"])
            UC_LogMaterials(["Log Material Intake & Costs"])
            UC_ReportIssue(["Report Site Issue/Defect"])
            UC_SubmitReport(["Submit & Lock Daily Report"])
        end

        %% Monitoring & Audit (Builder Core)
        subgraph Monitoring ["Monitoring & Auditing"]
            UC_ViewDash(["View Project Dashboard"])
            UC_AuditReports(["Audit Daily Reports History"])
            UC_AuditAttendance(["View Attendance History"])
            UC_TrackDefects(["Track Defects & Issues"])
            UC_ResolveIssue(["Resolve Defect / Issue"])
            UC_AuditReportDetail(["Approve / Audit Daily Report"])
        end

        %% Task Management Use Cases
        subgraph Tasks ["Task & Checklist Management"]
            UC_ViewTasks(["View Tasks List"])
            UC_TaskDetail(["View Task Details & Chat"])
            UC_CheckTask(["Complete Checklists / Tasks"])
            UC_CreateTask(["Create & Assign Tasks"])
        end
    end

    %% Actor Connections to Use Cases
    G --> UC_Register
    
    AU --> UC_Login
    AU --> UC_Profile
    AU --> UC_Logout
    AU --> UC_ViewProj
    AU --> UC_ViewTasks
    AU --> UC_TaskDetail
    AU --> UC_CheckTask

    C --> UC_LogProgress
    C --> UC_LogPhotos
    C --> UC_LogAttendance
    C --> UC_LogMaterials
    C --> UC_ReportIssue
    C --> UC_SubmitReport

    B --> UC_AddProj
    B --> UC_ManageTeam
    B --> UC_CreateTask
    B --> UC_ViewDash
    B --> UC_AuditReports
    B --> UC_AuditAttendance
    B --> UC_TrackDefects
    B --> UC_ResolveIssue
    B --> UC_AuditReportDetail
    
    %% Style definitions
    classDef actor fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f,font-weight:bold;
    classDef usecase fill:#FFFFFF,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef boundary fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,stroke-dasharray: 5 5;
    
    class C,B,AU,G actor;
    class UC_Register,UC_Login,UC_Profile,UC_Logout,UC_ViewProj,UC_AddProj,UC_ManageTeam,UC_LogProgress,UC_LogPhotos,UC_LogAttendance,UC_LogMaterials,UC_ReportIssue,UC_SubmitReport,UC_ViewDash,UC_AuditReports,UC_AuditAttendance,UC_TrackDefects,UC_ResolveIssue,UC_AuditReportDetail,UC_ViewTasks,UC_TaskDetail,UC_CheckTask,UC_CreateTask usecase;
    class BuildEx boundary;
```

---

## 2. Actors Definition

| Actor | Type | Description | Inherits Roles |
| :--- | :--- | :--- | :--- |
| **Guest** | Primary | An unauthenticated user accessing the sign-up flow. | None |
| **All Users** | Abstract | Shared base functionality available to both Contractor and Builder. | None |
| **Contractor** | Primary | The on-site operator responsible for daily tasks, crew check-ins, photo evidence, and material logging. | All Users |
| **Builder** | Primary | The project owner / admin who configures projects, monitors overall completion, audits historical logs, and allocates tasks. | All Users |

---

## 3. Use Case to Stitch Screen Synchronization Matrix

Every use case corresponds directly to one or more screen designs in the Stitch design workspace.

| Sub-Module | Use Case | Primary Actor | Stitch Screen Name | Stitch Screen ID | Purpose |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Auth** | Register Account | Guest | **Create Account** | `3a0d042f6a414326860e3b61374a77d4` | Create a new user profile. |
| **Auth** | Sign In | Guest / All | **Sign In** | `e716a31a16584ac4aa47c273d1ea87ba` | Sign in to access the system dashboard. |
| **Auth** | Manage Profile | All Users | **My Profile** | `b136f4d8fe4e44a9b1d1d6307717463d` | Edit personal info, manage settings, toggle alerts. |
| **Auth** | Log Out | All Users | **My Profile** | `b136f4d8fe4e44a9b1d1d6307717463d` | Terminate session and clear state. |
| **ProjMgmt** | View Assigned Projects | All Users | **My Projects** | `44ad4540281d4ca0898c2fe2a4508216` | Browse active and pending construction projects. |
| **ProjMgmt** | Add New Project | Builder | **Add New Project** | `f46110e352dd4f6f8fa6e1f6e7c34b01` | Create a site and select lifecycle templates. |
| **ProjMgmt** | Invite/Manage Team | Builder | **My Team** / **Invite Team Member** | `8b06dea2a4bf42e8bbc74416dd88f146` / `7e385eb03db9470795e16f596d7f78ca` | Manage directory roster and invite team members. |
| **Ops** | Log Daily Progress Notes | Contractor | **Daily Progress** | `fbe6099b23044bee967d4270ae7f4e01` | Record physical milestones and daily text reports. |
| **Ops** | Log Site Photos | Contractor | **Site Photos** | `86113211eb28489381a6f0f9caef4e2d` | Snapping and tagging daily site photos. |
| **Ops** | Record Worker Attendance | Contractor | **Worker Attendance** | `af60e6b8087a4cd6a67a70ca2e3b60e` | Take roll-call checkboxes for crew members. |
| **Ops** | Log Material Intake & Costs | Contractor | **Material Log** | `39f244bc9c9745eda6b6143bafbfb70b` | Input concrete/sand delivery metrics and costs. |
| **Ops** | Report Site Issue/Defect | Contractor | **Report Issue** | `76203631429c47f498b7a1989506b5bc` | Log defect/blocker tickets with priority tags. |
| **Ops** | Submit & Lock Daily Report | Contractor | **Daily Report Summary** | `1ed6f3d594b449508a67a70ca2e3b60e` | Compile daily inputs and lock submission to cloud. |
| **Monitoring**| View Project Dashboard | Builder | **Project Dashboard** | `c041fbbbbc1d49b39921bea8fdb1e3c3` | Monitor overall cost, timeline, and daily tasks list. |
| **Monitoring**| Audit Daily Reports History| Builder | **Daily Reports History** | `e48c5a51b48a4b0188a37a266a0f79fa` | View past submitted daily summaries calendar list. |
| **Monitoring**| Approve / Audit Daily Report| Builder | **Daily Report Audit** | `f955a7a5c8574b45a5403ae97e77a539` | Audit full daily log and download PDF reports. |
| **Monitoring**| View Attendance History | Builder | **Attendance History** | `dda387cd60584ff68d3c3293385dafcf` | Audit past employee presence and attendance calendar. |
| **Monitoring**| Track Defects & Issues | Builder | **Issues & Defects Tracker** | `37b3a92c96b7444c89b17c8f9ce2fc48` | View global active defect tracker. |
| **Monitoring**| Resolve Defect / Issue | Builder | **Issue Detail** | `8f23f2c3376d440dbe13e7f5681d8d91` | Collaborate on issues, edit severity, and mark resolved. |
| **Tasks** | View Tasks List | All Users | **My Tasks** | `6fc9ba7256b740f7ab526454baf71478` | Browse personal checklists and agenda items. |
| **Tasks** | View Task Details & Chat | All Users | **Task Details** | `4439d870eaf4484b88b1b58547b5fb25` | View task checklist, attachment files, and task logs. |
| **Tasks** | Complete Checklists / Tasks | All Users | **My Tasks** / **Task Details** | `6fc9ba7256b740f7ab526454baf71478` / `4439d870eaf4484b88b1b58547b5fb25` | Check/uncheck milestones and complete task stages. |
| **Tasks** | Create & Assign Tasks | Builder | **Add New Task** | `ed5624f9ad8b4467987c58c57815906a` | Issue new work allocation to Contractors. |
