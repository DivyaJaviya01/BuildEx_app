# BuildEx - System Design: Data Flow Diagrams (DFD)

This document shows how information (data) flows through the **BuildEx** system. It helps explain where the contractor's inputs go, how they are stored, and what the builder sees on the dashboard.

---

## 1. Level 0 DFD (Context Diagram)

The Level 0 diagram shows the big picture: how the **Builder** and the **Contractor** send and receive information through the **BuildEx App**.

```mermaid
flowchart TD
    %% External Entities
    C["👷 Contractor<br/>(Site Executor)"]
    B["👑 Builder<br/>(Owner / Approver)"]
    
    %% System Bubble
    System(["🛡️ BuildEx System"])

    %% Data Flow from Contractor to System
    C -- "1. Completed Sub-points" --> System
    C -- "2. Daily Material Consumption" --> System
    C -- "3. Daily Logs (Attendance, Machine, Notes)" --> System
    C -- "4. Site Issues & Snags" --> System

    %% Data Flow from System to Contractor
    System -- "a. Stock Levels & Alerts" --> C
    System -- "b. Active Site Issues List" --> C

    %% Data Flow from Builder to System
    B -- "I. Record Initial Material Stock" --> System
    B -- "II. Close Resolved Site Issues" --> System

    %% Data Flow from System to Builder
    System -- "A. Overall Progress % & Phase Lists" --> B
    System -- "B. Stock Levels & Low Stock Alerts" --> B
    System -- "C. Dashboard Overview & Active Issues" --> B

    %% Custom formatting
    classDef entity fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f,font-weight:bold;
    classDef system fill:#FFFFFF,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    class C,B entity;
    class System system;
```

---

## 2. Level 1 DFD (Detailed Data Flows)

The Level 1 diagram breaks the BuildEx app down into its **4 core processes** and shows how data is saved in different databases (**Data Stores**).

```mermaid
flowchart TD
    %% Actors
    C["👷 Contractor"]
    B["👑 Builder"]

    %% Processes (Bubbles)
    P1(["1.0 Track Progress & Phases"])
    P2(["2.0 Manage Material Stock & Consumption"])
    P3(["3.0 Log Daily Operations (DPR)"])
    P4(["4.0 Manage Site Issues (Snags)"])

    %% Data Stores (Databases)
    D1[("DS1: Project Phases & Progress")]
    D2[("DS2: Material Stock & Consumption")]
    D3[("DS3: Daily Logs & Attendance")]
    D4[("DS4: Site Issues")]

    %% Process 1.0 (Progress Flow)
    C -- "Mark Sub-points Completed" --> P1
    P1 -- "Update Completed Points" --> D1
    D1 -- "Calculate Overall & Phase %" --> P1
    P1 -- "Display Percentage Progress" --> B

    %% Process 2.0 (Material Flow)
    B -- "Record Initial Stock Delivery" --> P2
    P2 -- "Save Stock" --> D2
    C -- "Log Daily Material Consumption" --> P2
    P2 -- "Deduct from Stock" --> D2
    D2 -- "Check Low Stock Threshold" --> P2
    P2 -- "Show Stock Levels & Alerts" --> B

    %% Process 3.0 (DPR Flow)
    C -- "Submit Attendance (with wage), Machine, & Notes" --> P3
    P3 -- "Save Daily Logs" --> D3
    D3 -- "Get Daily Summary Logs" --> P3
    P3 -- "Show Daily Logs Summary" --> B

    %% Process 4.0 (Issues Flow)
    C -- "Report Site Issue" --> P4
    B -- "Report Site Issue" --> P4
    P4 -- "Log New Issue" --> D4
    D4 -- "Retrieve Active Issues" --> P4
    P4 -- "Show Active Issues list" --> B
    C -- "Submit Photo of Fixed Issue" --> P4
    B -- "Mark Issue as 'Closed'" --> P4
    P4 -- "Update Issue Status to Closed" --> D4

    %% Custom formatting
    classDef actor fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f,font-weight:bold;
    classDef process fill:#FFFFFF,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef store fill:#F2F8F8,stroke:#6d797a,stroke-width:2px;
    class C,B actor;
    class P1,P2,P3,P4 process;
    class D1,D2,D3,D4 store;
```

---

## 3. Simple Data Flow Explanations

Here is what happens inside each of the 4 databases:

### DS1: Project Phases & Progress Database
* **Input from Contractor:** Checks off completed tasks (e.g., *Area Inspection*).
* **Output to Builder Dashboard:** Shows simple progress bars (e.g., *Substructure is 50% done*, *Overall Project is 12% done*).

### DS2: Material Stock & Consumption Database
* **Input from Builder:** Records initial material stock delivered to site (e.g., *50 bags of cement*).
* **Input from Contractor:** Logs daily material consumption (e.g., *Used 10 bags of cement*).
* **System Action:** Auto-deducts consumed quantity from stock and alerts Builder when stock is low.
* **Output to Builder Dashboard:** Shows remaining stock levels and consumption trends.

### DS3: Daily Site Reports & Attendance Database
* **Input from Contractor:** Daily logs including progress notes, worker attendance (with daily wage), machinery hours, and material consumed today.
* **System Action:** Auto-calculates total wages payable per worker and aggregate labor cost.
* **Output to Builder Dashboard:** A clean daily report ledger with attendance summary, wage liability, and resource usage.

### DS4: Site Issues Database
* **Input from Contractor/Builder:** Defect reports with photos.
* **Action by Contractor:** Marks resolved with fix photo.
* **Action by Builder:** Closes the ticket.
* **Output to Builder Dashboard:** Highlighted warnings of unresolved issues on site.
