# BuildEx - System Design: Sequence Diagrams

This document contains **Sequence Diagrams** showing the step-by-step communication between the different parts of the **BuildEx** system (User -> Flutter App -> State Manager -> Backend Database) over time.

---

## 1. Progress Recalculation & Sync (DPR)

This diagram shows what happens when the Contractor marks a sub-point task completed, how the database recalculates the progress, and how it updates the Builder's dashboard.

```mermaid
sequenceDiagram
    autonumber
    actor Contractor as 👷 Contractor
    participant UI as 📱 Contractor App
    participant Manager as ⚙️ State Manager (BLoC/Provider)
    participant DB as 🗄️ Backend Database
    participant BuilderUI as 👑 Builder Dashboard
    actor Builder as 👑 Builder

    Contractor->>UI: Tap "Complete" on Sub-Point (e.g. Area Inspection)
    UI->>Manager: updateSubpointStatus(subPhaseId, isCompleted = true)
    activate Manager
    Manager->>DB: Write: Set sub_phases.is_completed = true
    deactivate Manager
    activate DB
    Note over DB: Calculate Phase completion %:<br/>(Completed Sub-Points / Total Sub-Points) * 100
    Note over DB: Calculate Overall Project %:<br/>Average of all Phases progress
    DB-->>BuilderUI: Pushes real-time progress update (%)
    deactivate DB
    activate BuilderUI
    BuilderUI-->>Builder: Displays new overall progress (e.g., "35% Completed")
    deactivate BuilderUI
```

---

## 2. Material Needs Request & status update to "Arriving"

This diagram shows how a material request from the Contractor goes to the Builder, gets approved, and is updated on the Contractor's phone.

```mermaid
sequenceDiagram
    autonumber
    actor Contractor as 👷 Contractor
    participant C_UI as 📱 Contractor App
    participant DB as 🗄️ Backend Database
    participant B_UI as 💻 Builder Dashboard
    actor Builder as 👑 Builder

    Contractor->>C_UI: Submit Material Request (e.g. 100 bags cement)
    C_UI->>DB: Create Request: status = "PENDING"
    activate DB
    DB-->>B_UI: Push new pending request to dashboard
    deactivate DB
    activate B_UI
    B_UI-->>Builder: Highlight request on panel
    deactivate B_UI
    
    Builder->>B_UI: Click "Mark Arriving" & enter delivery date
    activate B_UI
    B_UI->>DB: Update Request: status = "ARRIVING", expected_date = Date
    deactivate B_UI
    activate DB
    DB-->>C_UI: Push real-time status update
    deactivate DB
    activate C_UI
    C_UI-->>Contractor: Display status: "Arriving on Wednesday"
    deactivate C_UI
```

---

## 3. Site Issue Logging & Resolution (Snag list)

This diagram shows the communication flow when reporting a defect, uploading a photo, fixing it, and closing the ticket.

```mermaid
sequenceDiagram
    autonumber
    actor Builder as 👑 Builder
    participant B_UI as 💻 Builder Dashboard
    participant Storage as ☁️ Cloud Storage
    participant DB as 🗄️ Backend Database
    participant C_UI as 📱 Contractor App
    actor Contractor as 👷 Contractor

    Builder->>B_UI: Capture & Log Issue (e.g. plaster crack)
    activate B_UI
    B_UI->>Storage: Upload defect photo
    activate Storage
    Storage-->>B_UI: Return file storage URL
    deactivate Storage
    B_UI->>DB: Save Issue (title, photo_url, status = "OPEN")
    deactivate B_UI
    activate DB
    DB-->>C_UI: Push active issue alert
    deactivate DB
    activate C_UI
    C_UI-->>Contractor: Alert: "New Open Issue at Room 102"
    deactivate C_UI

    Note over Contractor: Fixes issue on-site
    
    Contractor->>C_UI: Upload fix photo & click "Resolve"
    activate C_UI
    C_UI->>Storage: Upload resolution photo
    activate Storage
    Storage-->>C_UI: Return resolved file URL
    deactivate Storage
    C_UI->>DB: Update Issue: status = "RESOLVED", resolved_photo_url = URL
    deactivate C_UI
    activate DB
    DB-->>B_UI: Push status update
    deactivate DB
    activate B_UI
    B_UI-->>Builder: Show issue resolved (awaiting inspection)
    deactivate B_UI

    Note over Builder: Inspects work on-site
    
    Builder->>B_UI: Click "Close Issue"
    activate B_UI
    B_UI->>DB: Update Issue: status = "CLOSED", closed_at = Now
    deactivate B_UI
    activate DB
    DB-->>C_UI: Remove from active issues list
    deactivate DB
```
