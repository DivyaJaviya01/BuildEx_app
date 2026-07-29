# BuildEx - System Design: Activity Diagrams (Flowcharts)

This document contains step-by-step **Activity Diagrams** (flowcharts) showing how the main processes in **BuildEx** work, including decisions, validations, and app updates.

---

## 1. Daily Progress & Site Logging (DPR) Workflow

This diagram shows how the Contractor submits the Daily Progress Report (DPR) and how the system recalculates the project progress percentage.

```mermaid
flowchart TD
    Start([Start Daily Log]) --> SelectSubpoint[1. Contractor selects active Sub-point<br/>e.g., 'Clean Area']
    SelectSubpoint --> MarkComplete[2. Marks Sub-point as Completed]
    MarkComplete --> LogUsage[3. Logs daily material consumption<br/>e.g., 'Cement: 10 bags used']
    LogUsage --> CheckStock{Stock low?}
    CheckStock -- Yes --> AlertBuilder[Alert: Material needs replenishment]
    AlertBuilder --> LogLabor
    CheckStock -- No --> LogLabor[4. Add workers with daily wage<br/>e.g., 'Rajesh: 500, Present']
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
    DB_Write --> DeductStock[Deduct consumed quantity from material stock]
    DeductStock --> UpdateProgress[Recalculate Phase & Project %]
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

## 2. Material Stock & Low Stock Alert Workflow

This diagram shows how the Builder records initial material stock, the Contractor logs consumption, and the system alerts when stock needs replenishment.

```mermaid
flowchart TD
    Start([Material Management]) --> InitStock[1. Builder records material stock<br/>e.g., 'Cement: 50 bags delivered']
    InitStock --> DB_Stock[(Stock saved in Database)]
    DB_Stock --> Consume[2. Contractor logs daily consumption<br/>e.g., 'Used 10 bags of cement']
    Consume --> CalcRemaining[Deduct from remaining stock]
    CalcRemaining --> CheckAlert{Remaining below<br/>threshold?}
    
    CheckAlert -- No --> EndOK([Continue tracking consumption])
    CheckAlert -- Yes --> AlertBuilder[3. System alerts Builder:<br/>'Cement running low - 5 bags left']
    AlertBuilder --> B_Restock[4. Builder orders more stock]
    B_Restock --> DB_Stock

    %% Custom formatting
    classDef start_end fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,color:#0f1e1f;
    classDef step fill:#eceff1,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef decision fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f;
    class Start,EndOK start_end;
    class InitStock,Consume,CalcRemaining,AlertBuilder,B_Restock step;
    class CheckAlert decision;
    class DB_Stock store;

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
