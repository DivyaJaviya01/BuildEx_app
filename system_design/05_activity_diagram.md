# BuildEx - System Design: Activity Diagrams (Flowcharts)

This document contains step-by-step **Activity Diagrams** (flowcharts) showing how the main processes in **BuildEx** work, including decisions, validations, and app updates.

---

## 1. Daily Progress & Site Logging (DPR) Workflow

This diagram shows how the Contractor submits the Daily Progress Report (DPR) and how the system recalculates the project progress percentage.

```mermaid
flowchart TD
    Start([Start Daily Log]) --> SelectSubpoint[1. Contractor selects active Sub-point<br/>e.g., 'Clean Area']
    SelectSubpoint --> MarkComplete[2. Marks Sub-point as Completed]
    MarkComplete --> LogUsage[3. Logs daily material consumption<br/>e.g., 'Cement: 50 bags']
    LogUsage --> LogLabor[4. Marks worker count<br/>e.g., '12 masons']
    LogLabor --> LogMachine[5. Logs machine hours<br/>e.g., 'JCB: 4 hours']
    LogMachine --> UploadPhoto[6. Snaps and uploads work photos]
    UploadPhoto --> ClickSubmit{Contractor clicks Submit?}

    ClickSubmit -- No --> KeepEditing[Save Draft & Keep Editing]
    KeepEditing --> LogUsage
    
    ClickSubmit -- Yes --> Validate{Are Photos & Required<br/>Fields filled?}
    
    Validate -- No --> ShowError[Show Alert: Fill required details]
    ShowError --> LogMachine

    Validate -- Yes --> LockReport[Lock DPR report for the day]
    LockReport --> DB_Write[(Save to Database)]
    DB_Write --> UpdateProgress[Recalculate Phase & Project %]
    UpdateProgress --> RefreshDashboard[Update Builder Dashboard]
    RefreshDashboard --> End([End DPR Flow])

    %% Custom formatting
    classDef start_end fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,color:#0f1e1f;
    classDef step fill:#eceff1,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef decision fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f;
    class Start,End start_end;
    class SelectSubpoint,MarkComplete,LogUsage,LogLabor,LogMachine,UploadPhoto,KeepEditing,ShowError,LockReport,UpdateProgress,RefreshDashboard step;
    class ClickSubmit,Validate decision;
```

---

## 2. Material Request & "Arriving" Workflow

This diagram shows how the Contractor requests materials and how the Builder updates the request until it arrives on site.

```mermaid
flowchart TD
    Start([Start Material Needs]) --> C_Request[1. Contractor submits request<br/>e.g., 'Need 100 cement bags']
    C_Request --> DB_Save[(Request saved as PENDING)]
    DB_Save --> B_Alert[2. Builder sees request on Dashboard]
    B_Alert --> B_Order{Builder orders<br/>material from vendor?}

    B_Order -- No --> Pending[Keep status as PENDING]
    Pending --> B_Alert

    B_Order -- Yes --> B_MarkArriving[3. Builder marks status as ARRIVING<br/>and enters expected date]
    B_MarkArriving --> DB_Update[(Update status in Database)]
    DB_Update --> C_Notify[4. Contractor sees ARRIVING status<br/>on their mobile screen]
    C_Notify --> MaterialArrive[5. Material truck arrives on site]
    MaterialArrive --> C_GateIn[6. Contractor verifies quantity<br/>and logs Gate-In]
    C_GateIn --> DB_StockUpdate[(Stock ledger automatically updated)]
    DB_StockUpdate --> End([End Material Flow])

    %% Custom formatting
    classDef start_end fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,color:#0f1e1f;
    classDef step fill:#eceff1,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef decision fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f;
    class Start,End start_end;
    class C_Request,B_Alert,B_MarkArriving,C_Notify,MaterialArrive,C_GateIn step;
    class B_Order decision;
```

---

## 3. Site Issue (Snag) Lifecycle

This diagram shows how quality or construction issues are reported, fixed, and closed.

```mermaid
flowchart TD
    Start([Issue Identified]) --> LogIssue[1. Builder or Contractor logs issue<br/>with photo and severity]
    LogIssue --> DB_Create[(Issue saved as OPEN)]
    DB_Create --> C_Notify[2. Contractor notified of open issue]
    C_Notify --> C_Resolve[3. Contractor fixes defect on-site]
    C_Resolve --> C_Upload[4. Contractor uploads fix photo<br/>and marks RESOLVED]
    C_Upload --> DB_Resolve[(Status updated to RESOLVED)]
    DB_Resolve --> B_Inspect[5. Builder inspects work on-site]
    B_Inspect --> B_Approve{Is work satisfactory?}

    B_Approve -- No --> B_Reopen[Builder reopens issue]
    B_Reopen --> DB_Reopen[(Status reset to OPEN)]
    DB_Reopen --> C_Notify

    B_Approve -- Yes --> B_Close[6. Builder marks issue as CLOSED]
    B_Close --> DB_Close[(Status updated to CLOSED)]
    DB_Close --> End([End Issue Flow])

    %% Custom formatting
    classDef start_end fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,color:#0f1e1f;
    classDef step fill:#eceff1,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef decision fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f;
    class Start,End start_end;
    class LogIssue,C_Notify,C_Resolve,C_Upload,B_Inspect,B_Reopen,B_Close step;
    class B_Approve decision;
```
